-- =========================================================================
-- FILE 7: CÁC VIEW, FUNCTION, PROCEDURE VÀ TRIGGER LIÊN QUAN ĐẾN LỚP DAO ĐANG LÀM
-- =========================================================================
-- File này đã được lọc tinh gọn, chỉ chứa các đối tượng DB được sử dụng hoặc có ảnh hưởng
-- trực tiếp đến các DAO: SeatDAO.java, FlightDAO.java, và BookingDAO.java.
-- =========================================================================

-- =========================================================================
-- PHẦN 1: FUNCTIONS LIÊN QUAN (TÍNH TOÁN GHẾ TRỐNG VÀ GIÁ ĐỘNG)
-- =========================================================================

-- 1. Lấy số ghế trống theo hạng (Được gọi bởi VIEW_FLIGHT_SEARCH)
CREATE OR REPLACE FUNCTION FUNC_GET_AVAILABLE_SEATS (p_FlightID IN VARCHAR2, p_Class IN VARCHAR2) RETURN NUMBER AS
    v_TotalSeats NUMBER; v_BookedSeats NUMBER; v_AircraftID VARCHAR2(20);
BEGIN
    SELECT AircraftID INTO v_AircraftID FROM FLIGHT WHERE FlightID = p_FlightID;
    SELECT COUNT(*) INTO v_TotalSeats FROM SEAT WHERE AircraftID = v_AircraftID AND Class = p_Class;
    SELECT COUNT(*) INTO v_BookedSeats FROM TICKET t JOIN SEAT s ON t.SeatID = s.SeatID
    WHERE t.FlightID = p_FlightID AND s.Class = p_Class AND t.TicketStatus != 'CANCELLED';

    RETURN v_TotalSeats - v_BookedSeats;
END;
/

-- 2. Tính giá vé động (Được gọi bởi các View tìm kiếm chuyến bay & BookingDAO)
CREATE OR REPLACE FUNCTION FUNC_GET_DYNAMIC_PRICE (p_FlightID IN VARCHAR2, p_Class IN VARCHAR2) RETURN NUMBER AS
    v_BasePrice NUMBER; v_DepartureTime DATE; v_DaysDifference NUMBER;
BEGIN
    SELECT Price INTO v_BasePrice FROM SEATCLASSPRICE WHERE FlightID = p_FlightID AND Class = p_Class;
    SELECT DepartureTime INTO v_DepartureTime FROM FLIGHT WHERE FlightID = p_FlightID;
    
    v_DaysDifference := v_DepartureTime - SYSDATE;
    IF v_DaysDifference >= 30 THEN RETURN v_BasePrice * 0.9;
    ELSIF v_DaysDifference <= 3 THEN RETURN v_BasePrice * 1.2;
    ELSE RETURN v_BasePrice; END IF;
END;
/


-- =========================================================================
-- PHẦN 2: VIEWS TRUY VẤN MỚI (ĐƯỢC GỌI TRỰC TIẾP TỪ JAVA)
-- =========================================================================

-- 1. VIEW_FLIGHT_SEAT_STATUS (Sử dụng trong SeatDAO.java)
CREATE OR REPLACE VIEW VIEW_FLIGHT_SEAT_STATUS AS
SELECT f.FlightID, s.SeatID, s.SeatNumber, s.Class,
       CASE WHEN t.TicketID IS NOT NULL AND (
           t.TicketStatus IN ('PAID', 'CHECKED-IN') OR 
           (t.TicketStatus = 'BOOKED' AND b.BookingDate >= SYSDATE - (20/(24*60)))
       ) THEN 1 ELSE 0 END as IsBooked
FROM SEAT s 
JOIN FLIGHT f ON s.AircraftID = f.AircraftID 
LEFT JOIN TICKET t ON s.SeatID = t.SeatID AND t.FlightID = f.FlightID AND t.TicketStatus != 'CANCELLED' 
LEFT JOIN BOOKING b ON t.BookingID = b.BookingID;
/

-- 2. VIEW_FLIGHT_SEARCH (Sử dụng trong FlightDAO.java - tìm kiếm chuyến bay)
CREATE OR REPLACE VIEW VIEW_FLIGHT_SEARCH AS
SELECT 
    f.FlightID, 
    al.AirlineName, 
    a.Model AS AircraftModel, 
    dep.IATACode AS DepCode, 
    arr.IATACode AS ArrCode,
    f.DepartureTime, 
    f.ArrivalTime,
    scp.Class as ClassName,
    FUNC_GET_DYNAMIC_PRICE(f.FlightID, scp.Class) as Price,
    FUNC_GET_AVAILABLE_SEATS(f.FlightID, scp.Class) as Seats
FROM FLIGHT f
JOIN AIRLINE al ON f.AirlineID = al.AirlineID
JOIN AIRCRAFT a ON f.AircraftID = a.AircraftID
JOIN ROUTE r ON f.RouteID = r.RouteID
JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID
JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID
JOIN SEATCLASSPRICE scp ON f.FlightID = scp.FlightID;
/

-- 3. VIEW_FLIGHT_MIN_PRICES (Sử dụng trong FlightDAO.java - lấy giá rẻ nhất tuần)
CREATE OR REPLACE VIEW VIEW_FLIGHT_MIN_PRICES AS
SELECT 
    f.FlightID,
    dep.IATACode AS DepCode,
    arr.IATACode AS ArrCode,
    f.DepartureTime,
    p.Class,
    FUNC_GET_DYNAMIC_PRICE(f.FlightID, p.Class) AS Price
FROM FLIGHT f
JOIN ROUTE r ON f.RouteID = r.RouteID
JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID
JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID
JOIN SEATCLASSPRICE p ON f.FlightID = p.FlightID;
/


-- =========================================================================
-- PHẦN 3: PROCEDURES LIÊN QUAN (SỬ DỤNG TRONG BOOKINGDAO.JAVA)
-- =========================================================================

-- 1. SP_GET_OR_CREATE_PASSENGER (Tìm/tạo Hành khách bằng PassportNumber)
CREATE OR REPLACE PROCEDURE SP_GET_OR_CREATE_PASSENGER (
    p_FullName IN VARCHAR2,
    p_Gender IN VARCHAR2,
    p_DateOfBirth IN DATE,
    p_PassportNumber IN VARCHAR2,
    p_PassengerID OUT VARCHAR2
) AS
BEGIN
    SELECT PassengerID INTO p_PassengerID
    FROM PASSENGER
    WHERE PassportNumber = p_PassportNumber
      AND ROWNUM = 1;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO PASSENGER (FullName, Gender, DateOfBirth, PassportNumber)
        VALUES (p_FullName, p_Gender, p_DateOfBirth, p_PassportNumber)
        RETURNING PassengerID INTO p_PassengerID;
END;
/

-- 2. SP_INIT_PENDING_BOOKING (Khởi tạo Booking PENDING)
CREATE OR REPLACE PROCEDURE SP_INIT_PENDING_BOOKING (
    p_BookingID OUT VARCHAR2
) AS
BEGIN
    INSERT INTO BOOKING (TotalAmount, Status, BookingDate)
    VALUES (0, 'PENDING', CURRENT_TIMESTAMP)
    RETURNING BookingID INTO p_BookingID;
END;
/

-- 3. SP_CLEANUP_AND_BOOK_TICKET (Dọn rác giữ chỗ cũ của ghế đó và tạo giữ chỗ mới)
CREATE OR REPLACE PROCEDURE SP_CLEANUP_AND_BOOK_TICKET (
    p_BookingID IN VARCHAR2,
    p_FlightID IN VARCHAR2,
    p_SeatNumber IN VARCHAR2,
    p_PassengerID IN VARCHAR2,
    p_Price IN NUMBER
) AS
    v_SeatID VARCHAR2(20);
BEGIN
    -- Lấy SeatID từ Số ghế và máy bay của Flight
    SELECT s.SeatID INTO v_SeatID
    FROM SEAT s JOIN FLIGHT f ON s.AircraftID = f.AircraftID
    WHERE f.FlightID = p_FlightID AND s.SeatNumber = TRIM(p_SeatNumber)
      AND ROWNUM = 1;

    -- Xóa các vé giữ chỗ tạm cũ chưa thanh toán cho ghế này
    DELETE FROM TICKET 
    WHERE FlightID = p_FlightID AND SeatID = v_SeatID AND TicketStatus != 'PAID';

    -- Chèn vé giữ chỗ mới
    INSERT INTO TICKET (BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus)
    VALUES (p_BookingID, p_FlightID, v_SeatID, p_PassengerID, p_Price, 'BOOKED');
END;
/

-- 4. SP_FINALIZE_BOOKING (Hoàn tất thanh toán đơn hàng)
CREATE OR REPLACE PROCEDURE SP_FINALIZE_BOOKING (
    p_BookingID IN VARCHAR2,
    p_PaymentMethod IN VARCHAR2,
    p_Amount IN NUMBER
) AS
BEGIN
    -- Chèn bản ghi thanh toán thành công
    INSERT INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus)
    VALUES (p_BookingID, CURRENT_TIMESTAMP, p_Amount, p_PaymentMethod, 'SUCCESS');

    -- Chuyển trạng thái vé sang PAID
    UPDATE TICKET SET TicketStatus = 'PAID' WHERE BookingID = p_BookingID;

    -- Chuyển trạng thái đơn hàng sang COMPLETED
    UPDATE BOOKING SET Status = 'COMPLETED' WHERE BookingID = p_BookingID;
END;
/

-- 5. SP_UPDATE_BOOKING_PASSENGER (Cập nhật thông tin khách cho từng vé theo thứ tự)
CREATE OR REPLACE PROCEDURE SP_UPDATE_BOOKING_PASSENGER (
    p_BookingID IN VARCHAR2,
    p_FullName IN VARCHAR2,
    p_Gender IN VARCHAR2,
    p_DateOfBirth IN DATE,
    p_PassportNumber IN VARCHAR2,
    p_Index IN NUMBER -- 1-based index tương ứng với vé
) AS
    v_PassengerID VARCHAR2(20);
    v_TicketID VARCHAR2(20);
BEGIN
    -- Lấy hoặc tự tạo mới Hành khách
    BEGIN
        SELECT PassengerID INTO v_PassengerID
        FROM PASSENGER
        WHERE PassportNumber = p_PassportNumber
          AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO PASSENGER (FullName, Gender, DateOfBirth, PassportNumber)
            VALUES (p_FullName, p_Gender, p_DateOfBirth, p_PassportNumber)
            RETURNING PassengerID INTO v_PassengerID;
    END;

    -- Tìm TicketID ở vị trí thứ p_Index thuộc Booking đó
    SELECT TicketID INTO v_TicketID
    FROM (
        SELECT TicketID, ROW_NUMBER() OVER (ORDER BY TicketID) as rn
        FROM TICKET
        WHERE BookingID = p_BookingID
    )
    WHERE rn = p_Index;

    -- Cập nhật PassengerID cho vé tương ứng
    IF v_TicketID IS NOT NULL AND v_PassengerID IS NOT NULL THEN
        UPDATE TICKET SET PassengerID = v_PassengerID WHERE TicketID = v_TicketID;
    END IF;
END;
/

-- 6. SP_CANCEL_BOOKING (Được gọi bởi cancelBooking trong BookingDAO.java để hủy đơn và hoàn tiền tự động)
CREATE OR REPLACE PROCEDURE SP_CANCEL_BOOKING (p_BookingID IN VARCHAR2, p_CancelReason IN VARCHAR2) AS
    v_Status VARCHAR2(50); v_CustomerID VARCHAR2(20); v_TotalAmount NUMBER;
BEGIN
    SELECT Status, CustomerID, TotalAmount INTO v_Status, v_CustomerID, v_TotalAmount FROM BOOKING WHERE BookingID = p_BookingID;
    IF v_Status = 'CONFIRMED' THEN
        INSERT INTO TRANSACTION_HISTORY (CustomerID, BookingID, TransactionType, Amount, Description)
        VALUES (v_CustomerID, p_BookingID, 'REFUND', v_TotalAmount, 'Hoàn tiền do: ' || p_CancelReason);
    END IF;

    UPDATE BOOKING SET Status = 'CANCELLED' WHERE BookingID = p_BookingID;
    UPDATE TICKET SET TicketStatus = 'CANCELLED' WHERE BookingID = p_BookingID;
    COMMIT;
END;
/

-- 7. PROC_RECALCULATE_BOOKING_TOTAL (Tính toán lại tổng tiền Booking gồm giá vé + 10% thuế mỗi vé)
CREATE OR REPLACE PROCEDURE PROC_RECALCULATE_BOOKING_TOTAL (p_BookingID IN VARCHAR2) AS
    v_BaseTotal NUMBER;
BEGIN
    -- Tính tổng giá vé cơ bản của các vé chưa hủy thuộc BookingID
    SELECT SUM(Price) INTO v_BaseTotal
    FROM TICKET 
    WHERE BookingID = p_BookingID AND TicketStatus != 'CANCELLED';

    -- Cập nhật lại hóa đơn với công thức: Tổng Giá Vé * 1.10 (Giá vé + 10% thuế VAT)
    UPDATE BOOKING 
    SET TotalAmount = NVL(v_BaseTotal, 0) * 1.10
    WHERE BookingID = p_BookingID;
END;
/

-- 8. SP_GET_SEATS_BY_FLIGHT_AND_CLASS (Lấy danh sách ghế theo chuyến bay và hạng ghế)
CREATE OR REPLACE PROCEDURE SP_GET_SEATS_BY_FLIGHT_AND_CLASS (
    p_FlightID IN VARCHAR2,
    p_Class IN VARCHAR2,
    p_ResultSet OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_ResultSet FOR
        SELECT SeatID, SeatNumber, Class, IsBooked
        FROM VIEW_FLIGHT_SEAT_STATUS
        WHERE FlightID = p_FlightID
          AND UPPER(TRIM(Class)) = UPPER(TRIM(p_Class))
        ORDER BY SeatNumber;
END;
/

-- 9. SP_SEARCH_FLIGHTS (Tìm kiếm chuyến bay theo điểm khởi hành, điểm đến và ngày đi)
CREATE OR REPLACE PROCEDURE SP_SEARCH_FLIGHTS (
    p_DepCode IN VARCHAR2,
    p_ArrCode IN VARCHAR2,
    p_DateStr IN VARCHAR2,
    p_ResultSet OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_ResultSet FOR
        SELECT FlightID, AirlineName, AircraftModel, DepCode, ArrCode, DepartureTime, ArrivalTime, ClassName, Price, Seats
        FROM VIEW_FLIGHT_SEARCH
        WHERE TRIM(UPPER(DepCode)) = TRIM(UPPER(p_DepCode))
          AND TRIM(UPPER(ArrCode)) = TRIM(UPPER(p_ArrCode))
          AND TRUNC(DepartureTime) = TO_DATE(p_DateStr, 'YYYY-MM-DD')
          AND DepartureTime > SYSDATE
        ORDER BY DepartureTime ASC, Price ASC;
END;
/

-- 10. SP_GET_MIN_PRICES_FOR_WEEK (Lấy giá vé rẻ nhất trong tuần xung quanh một ngày)
CREATE OR REPLACE PROCEDURE SP_GET_MIN_PRICES_FOR_WEEK (
    p_DepCode IN VARCHAR2,
    p_ArrCode IN VARCHAR2,
    p_StartDate IN VARCHAR2,
    p_EndDate IN VARCHAR2,
    p_ResultSet OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_ResultSet FOR
        SELECT TRUNC(DepartureTime) as d, MIN(Price) as min_p
        FROM VIEW_FLIGHT_MIN_PRICES
        WHERE TRIM(UPPER(DepCode)) = TRIM(UPPER(p_DepCode))
          AND TRIM(UPPER(ArrCode)) = TRIM(UPPER(p_ArrCode))
          AND TRUNC(DepartureTime) BETWEEN TO_DATE(p_StartDate, 'YYYY-MM-DD') AND TO_DATE(p_EndDate, 'YYYY-MM-DD')
          AND DepartureTime > SYSDATE
        GROUP BY TRUNC(DepartureTime);
END;
/


-- =========================================================================
-- PHẦN 4: TRIGGERS RÀNG BUỘC LIÊN QUAN ĐẾN VÉ, ĐƠN HÀNG VÀ THANH TOÁN
-- =========================================================================

-- 1. Trigger kiểm tra số vé không vượt quá sức chứa máy bay (Overbooking)
CREATE OR REPLACE TRIGGER TRG_PREVENT_OVERBOOKING
BEFORE INSERT ON TICKET
FOR EACH ROW
DECLARE
    v_CurrentTickets NUMBER; v_MaxCapacity NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_CurrentTickets FROM TICKET WHERE FlightID = :NEW.FlightID AND TicketStatus != 'CANCELLED';
    SELECT a.Capacity INTO v_MaxCapacity FROM FLIGHT f JOIN AIRCRAFT a ON f.AircraftID = a.AircraftID WHERE f.FlightID = :NEW.FlightID;

    IF v_CurrentTickets >= v_MaxCapacity THEN
        RAISE_APPLICATION_ERROR(-20002, 'Lỗi: Chuyến bay đã hết chỗ (Overbooking).');
    END IF;
END;
/

-- 2. Trigger cập nhật TotalAmount của BOOKING tự động theo giá vé
CREATE OR REPLACE TRIGGER TRG_UPDATE_BOOKING_TOTAL
AFTER INSERT OR UPDATE OF Price OR DELETE ON TICKET
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE BOOKING SET TotalAmount = NVL(TotalAmount, 0) + NVL(:NEW.Price, 0) WHERE BookingID = :NEW.BookingID;
    ELSIF UPDATING THEN
        UPDATE BOOKING SET TotalAmount = NVL(TotalAmount, 0) - NVL(:OLD.Price, 0) + NVL(:NEW.Price, 0) WHERE BookingID = :NEW.BookingID;
    ELSIF DELETING THEN
        UPDATE BOOKING SET TotalAmount = NVL(TotalAmount, 0) - NVL(:OLD.Price, 0) WHERE BookingID = :OLD.BookingID;
    END IF;
END;
/

-- 3. Trigger không cho phép giữ ghế/đặt vé khi chuyến bay đã khởi hành
CREATE OR REPLACE TRIGGER TRG_PREVENT_PAST_BOOKING
BEFORE INSERT ON TICKET
FOR EACH ROW
DECLARE
    v_DepartureTime DATE;
BEGIN
    SELECT DepartureTime INTO v_DepartureTime FROM FLIGHT WHERE FlightID = :NEW.FlightID;
    IF SYSDATE >= v_DepartureTime THEN
        RAISE_APPLICATION_ERROR(-20003, 'Lỗi: Chuyến bay đã hoặc đang khởi hành.');
    END IF;
END;
/

-- 4. Trigger đối chiếu đảm bảo ghế chọn thuộc về đúng máy bay thực hiện chuyến bay
CREATE OR REPLACE TRIGGER TRG_RB65_CHECK_SEAT_AIRCRAFT
BEFORE INSERT OR UPDATE ON TICKET
FOR EACH ROW
DECLARE
    v_FlightAircraftID VARCHAR2(20);
    v_SeatAircraftID VARCHAR2(20);
BEGIN
    SELECT AircraftID INTO v_FlightAircraftID FROM FLIGHT WHERE FlightID = :NEW.FlightID;
    SELECT AircraftID INTO v_SeatAircraftID FROM SEAT WHERE SeatID = :NEW.SeatID;

    IF v_FlightAircraftID != v_SeatAircraftID THEN
        RAISE_APPLICATION_ERROR(-20004, 'RB65: Lỗi! Ghế được chọn không thuộc về máy bay thực hiện chuyến bay này.');
    END IF;
END;
/

-- 5. Trigger đảm bảo chỉ được cập nhật trạng thái vé PAID khi đã thanh toán thành công
CREATE OR REPLACE TRIGGER TRG_RB64_CHECK_TICKET_PAYMENT
BEFORE UPDATE ON TICKET
FOR EACH ROW
DECLARE
    v_PaymentCount NUMBER;
BEGIN
    IF :NEW.TicketStatus = 'PAID' THEN
        SELECT COUNT(*) INTO v_PaymentCount FROM PAYMENT WHERE BookingID = :NEW.BookingID AND PaymentStatus = 'SUCCESS';
        IF v_PaymentCount = 0 THEN
            RAISE_APPLICATION_ERROR(-20006, 'RB64: Lỗi! Vé chỉ được cập nhật trạng thái PAID khi Booking đã thanh toán.');
        END IF;
    END IF;
END;
/

-- 6. Trigger tự động lưu nhật ký giao dịch (Transaction History) khi thanh toán thành công
CREATE OR REPLACE TRIGGER TRG_LOG_SUCCESSFUL_PAYMENT
AFTER INSERT OR UPDATE OF PaymentStatus ON PAYMENT
FOR EACH ROW
WHEN (NEW.PaymentStatus = 'SUCCESS')
DECLARE
    v_CustomerID VARCHAR2(20);
BEGIN
    SELECT CustomerID INTO v_CustomerID FROM BOOKING WHERE BookingID = :NEW.BookingID;

    INSERT INTO TRANSACTION_HISTORY (CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description)
    VALUES (v_CustomerID, :NEW.BookingID, :NEW.PaymentID, 'PAYMENT', :NEW.Amount, SYSDATE, 'Thanh toán thành công qua ' || :NEW.PaymentMethod);
END;
/

-- 7. Trigger không cho phép nhập số tiền thanh toán vượt quá hóa đơn Booking
CREATE OR REPLACE TRIGGER TRG_RB60_CHECK_PAYMENT_AMOUNT
BEFORE INSERT OR UPDATE ON PAYMENT
FOR EACH ROW
DECLARE
    v_TotalAmount NUMBER;
BEGIN
    SELECT TotalAmount INTO v_TotalAmount FROM BOOKING WHERE BookingID = :NEW.BookingID;

    IF :NEW.Amount > v_TotalAmount THEN
        RAISE_APPLICATION_ERROR(-20005, 'RB60: Lỗi! Số tiền thanh toán không được vượt quá tổng tiền của Booking.');
    END IF;
END;
/

-- 8. Trigger bắt buộc mỗi hóa đơn xác nhận (CONFIRMED hoặc COMPLETED) phải có ít nhất một vé
CREATE OR REPLACE TRIGGER TRG_RB66_BOOKING_MUST_HAVE_TICKET
BEFORE UPDATE ON BOOKING
FOR EACH ROW
DECLARE
    v_TicketCount NUMBER;
BEGIN
    -- Kiểm tra khi Booking được chốt (sang trạng thái CONFIRMED hoặc COMPLETED)
    IF :NEW.Status IN ('CONFIRMED', 'COMPLETED') AND :OLD.Status NOT IN ('CONFIRMED', 'COMPLETED') THEN
        SELECT COUNT(*) INTO v_TicketCount FROM TICKET WHERE BookingID = :NEW.BookingID;
        IF v_TicketCount = 0 THEN
            RAISE_APPLICATION_ERROR(-20007, 'RB66: Lỗi! Không thể xác nhận Booking vì chưa có vé nào.');
        END IF;
    END IF;
END;
/
