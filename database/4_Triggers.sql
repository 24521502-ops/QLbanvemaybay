
-- ================================= Bảng TICKET =================================

--2.Trigger kiểm tra số vé không vượt quá số ghế (RB65)//
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


--3.Trigger cập nhật TotalAmount của BOOKING (RB67)//
CREATE OR REPLACE TRIGGER TRG_UPDATE_BOOKING_TOTAL
AFTER INSERT OR UPDATE OF Price OR DELETE ON TICKET
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE BOOKING 
        SET TotalAmount = NVL(TotalAmount, 0) + NVL(:NEW.Price, 0) 
        WHERE BookingID = :NEW.BookingID;
        
    ELSIF UPDATING THEN
        UPDATE BOOKING 
        SET TotalAmount = NVL(TotalAmount, 0) - NVL(:OLD.Price, 0) + NVL(:NEW.Price, 0) 
        WHERE BookingID = :NEW.BookingID;
        
    ELSIF DELETING THEN
        UPDATE BOOKING 
        SET TotalAmount = NVL(TotalAmount, 0) - NVL(:OLD.Price, 0) 
        WHERE BookingID = :OLD.BookingID;
    END IF;
END;
/

--4.Trigger không được đặt vé sau khi chuyến bay đã khởi hành (RB63)//
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

--5.Trigger ghế phải thuộc đúng máy bay của chuyến bay (RB62)
CREATE OR REPLACE TRIGGER TRG_RB65_CHECK_SEAT_AIRCRAFT
BEFORE INSERT OR UPDATE ON TICKET
FOR EACH ROW
DECLARE
    v_FlightAircraftID VARCHAR2(20); -- Đã sửa thành VARCHAR2
    v_SeatAircraftID VARCHAR2(20);   -- Đã sửa thành VARCHAR2
BEGIN
    -- Lấy AircraftID của chuyến bay
    SELECT AircraftID INTO v_FlightAircraftID
    FROM FLIGHT
    WHERE FlightID = :NEW.FlightID;

    -- Lấy AircraftID của ghế được chọn
    SELECT AircraftID INTO v_SeatAircraftID
    FROM SEAT
    WHERE SeatID = :NEW.SeatID;

    -- Kiểm tra đối chiếu
    IF v_FlightAircraftID != v_SeatAircraftID THEN
        RAISE_APPLICATION_ERROR(-20004, 'RB65: Lỗi! Ghế được chọn không thuộc về máy bay thực hiện chuyến bay này.');
    END IF;
END;
/

--6.Ràng buộc 64: Vé chỉ hợp lệ khi đã có thanh toán
CREATE OR REPLACE TRIGGER TRG_RB64_CHECK_TICKET_PAYMENT
BEFORE UPDATE ON TICKET
FOR EACH ROW
DECLARE
    v_PaymentCount NUMBER;
BEGIN
    -- Đã sửa 'ACTIVE' thành 'PAID' để khớp với Constraint bảng TICKET
    IF :NEW.TicketStatus = 'PAID' THEN
        
        -- Đếm số lượng giao dịch thanh toán của Booking này
        SELECT COUNT(*) INTO v_PaymentCount
        FROM PAYMENT
        WHERE BookingID = :NEW.BookingID AND PaymentStatus = 'SUCCESS';

        IF v_PaymentCount = 0 THEN
            RAISE_APPLICATION_ERROR(-20006, 'RB64: Lỗi! Vé chỉ được cập nhật trạng thái PAID khi Booking đã được thanh toán thành công.');
        END IF;
    END IF;
END;
/


-- ================================= Bảng FLIGHT =================================

--7.Trigger kiểm tra thời gian chuyến bay hợp lệ (RB50)--------
CREATE OR REPLACE TRIGGER TRG_Check_Flight_Time
BEFORE INSERT OR UPDATE ON FLIGHT
FOR EACH ROW
BEGIN
    IF :NEW.ArrivalTime <= :NEW.DepartureTime THEN
        RAISE_APPLICATION_ERROR(-20003, 
        'Thời gian đến phải lớn hơn thời gian đi!');
    END IF;
END;
/

--8. Trigger: Máy bay sử dụng cho chuyến bay phải thuộc cùng hãng (RB61)
CREATE OR REPLACE TRIGGER TRG_Check_Airline_Aircraft 
BEFORE INSERT OR UPDATE ON FLIGHT 
FOR EACH ROW 
DECLARE
    v_airlineID_aircraft VARCHAR2(20); -- Đã sửa thành VARCHAR2
BEGIN
    SELECT AirlineID INTO v_airlineID_aircraft 
    FROM AIRCRAFT 
    WHERE AircraftID = :NEW.AircraftID;
    
    IF v_airlineID_aircraft <> :NEW.AirlineID THEN
        RAISE_APPLICATION_ERROR(-20004, 'Máy bay không thuộc sở hữu của hãng hàng không này!');
    END IF;
END;
/

--9 Đảm bảo máy bay không bay 2 chuyến cùng lúc
CREATE OR REPLACE TRIGGER TRG_CHECK_AIRCRAFT_OVERLAP
BEFORE INSERT OR UPDATE ON FLIGHT
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_Count NUMBER;
BEGIN
    -- Đã sửa số 0 thành chuỗi '0' trong hàm NVL
    SELECT COUNT(*) INTO v_Count FROM FLIGHT
    WHERE AircraftID = :NEW.AircraftID AND FlightID != NVL(:NEW.FlightID, '0')
      AND ((:NEW.DepartureTime BETWEEN DepartureTime AND ArrivalTime) OR
          (:NEW.ArrivalTime BETWEEN DepartureTime AND ArrivalTime));

    IF v_Count > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Lỗi: Máy bay bị trùng lịch bay.');
    END IF;
    
    COMMIT;
END;
/

-- ================================= Bảng PAYMENT =================================
    
--10. Trigger tự tạo Transaction History khi thanh toán---------//
CREATE OR REPLACE TRIGGER TRG_LOG_SUCCESSFUL_PAYMENT
AFTER INSERT OR UPDATE OF PaymentStatus ON PAYMENT
FOR EACH ROW
WHEN (NEW.PaymentStatus = 'SUCCESS')
DECLARE
    v_CustomerID VARCHAR2(20); -- Đã sửa thành VARCHAR2
BEGIN
    SELECT CustomerID INTO v_CustomerID FROM BOOKING WHERE BookingID = :NEW.BookingID;

    INSERT INTO TRANSACTION_HISTORY (CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description)
    VALUES (v_CustomerID, :NEW.BookingID, :NEW.PaymentID, 'PAYMENT', :NEW.Amount, SYSDATE, 'Thanh toán thành công qua ' || :NEW.PaymentMethod);
END;
/


--11. Ràng buộc 60: Payment không vượt quá tổng tiền Booking
CREATE OR REPLACE TRIGGER TRG_RB60_CHECK_PAYMENT_AMOUNT
BEFORE INSERT OR UPDATE ON PAYMENT
FOR EACH ROW
DECLARE
    v_TotalAmount NUMBER;
BEGIN
    -- Lấy tổng tiền của Booking
    SELECT TotalAmount INTO v_TotalAmount
    FROM BOOKING
    WHERE BookingID = :NEW.BookingID;

    -- Kiểm tra số tiền thanh toán
    IF :NEW.Amount > v_TotalAmount THEN
        RAISE_APPLICATION_ERROR(-20005, 'RB60: Lỗi! Số tiền thanh toán (' || :NEW.Amount || ') không được vượt quá tổng tiền của Booking (' || v_TotalAmount || ').');
    END IF;
END;
/

-- ================================= Bảng USERS =================================

--12. cập nhật ngày sửa users---------
CREATE OR REPLACE TRIGGER TRG_UPDATE_USER
BEFORE UPDATE ON USERS
FOR EACH ROW
BEGIN
    :NEW.Updated_At := SYSDATE;
END;
/



-- ================================= Bảng BOOKING =================================

--13. Ràng buộc 66: Mỗi đơn đặt vé phải có ít nhất một vé
CREATE OR REPLACE TRIGGER TRG_RB66_BOOKING_MUST_HAVE_TICKET
BEFORE UPDATE ON BOOKING
FOR EACH ROW
DECLARE
    v_TicketCount NUMBER;
BEGIN
    -- Chỉ kiểm tra khi Booking chốt (CONFIRMED hoặc trạng thái tương đương)
    IF :NEW.Status = 'CONFIRMED' AND :OLD.Status != 'CONFIRMED' THEN
        
        -- Đếm số vé đang thuộc về Booking này
        SELECT COUNT(*) INTO v_TicketCount
        FROM TICKET
        WHERE BookingID = :NEW.BookingID;

        IF v_TicketCount = 0 THEN
            RAISE_APPLICATION_ERROR(-20007, 'RB66: Lỗi! Không thể xác nhận Booking này vì chưa có vé (Ticket) nào được tạo bên trong.');
        END IF;
    END IF;
END;
/


DROP TRIGGER TRG_No_Duplicate_Seat;
