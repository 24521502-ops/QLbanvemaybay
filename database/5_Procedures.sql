-- ================================= Bảng AIRLINE =================================
CREATE OR REPLACE PROCEDURE SP_ADD_AIRLINE (
    p_AirlineName IN VARCHAR2,
    p_Country IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    -- Không cần sinh ID nữa, Trigger sẽ tự động làm
    INSERT INTO AIRLINE (AirlineName, Country, Phone, Email)
    VALUES (p_AirlineName, p_Country, p_Phone, p_Email);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_AIRLINE (
    p_AirlineID IN VARCHAR2,
    p_AirlineName IN VARCHAR2,
    p_Country IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    UPDATE AIRLINE
    SET AirlineName = p_AirlineName, Country = p_Country, Phone = p_Phone, Email = p_Email
    WHERE AirlineID = p_AirlineID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20044, 'Lỗi: Không tìm thấy Hãng hàng không cần cập nhật.');
    END IF;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_DELETE_AIRLINE (p_AirlineID IN VARCHAR2) AS
BEGIN
    DELETE FROM AIRLINE WHERE AirlineID = p_AirlineID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            RAISE_APPLICATION_ERROR(-20046, 'Lỗi: Không thể xóa hãng bay này vì đang có máy bay hoặc chuyến bay trực thuộc.');
        ELSE RAISE; END IF;
END;
/


-- ================================= Bảng AIRPORT =================================
CREATE OR REPLACE PROCEDURE SP_ADD_AIRPORT (
    p_AirportName IN VARCHAR2, p_City IN VARCHAR2, p_Country IN VARCHAR2, p_IATACode IN CHAR
) AS
BEGIN
    INSERT INTO AIRPORT (AirportName, City, Country, IATACode)
    VALUES (p_AirportName, p_City, p_Country, UPPER(p_IATACode));
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK; RAISE_APPLICATION_ERROR(-20031, 'Lỗi: Mã IATA này đã tồn tại!');
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_AIRPORT (
    p_AirportID IN VARCHAR2, p_AirportName IN VARCHAR2, p_City IN VARCHAR2, p_Country IN VARCHAR2, p_IATACode IN CHAR
) AS
BEGIN
    UPDATE AIRPORT
    SET AirportName = p_AirportName, City = p_City, Country = p_Country, IATACode = UPPER(p_IATACode)
    WHERE AirportID = p_AirportID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_DELETE_AIRPORT (p_AirportID IN VARCHAR2) AS
BEGIN
    DELETE FROM AIRPORT WHERE AirportID = p_AirportID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN RAISE_APPLICATION_ERROR(-20043, 'Lỗi: Đang có chuyến bay/tuyến bay sử dụng.');
        ELSE RAISE; END IF;
END;
/


-- ================================= Bảng AIRCRAFT =================================
CREATE OR REPLACE PROCEDURE SP_ADD_AIRCRAFT (
    p_AirlineID IN VARCHAR2, p_Model IN VARCHAR2, p_Capacity IN NUMBER, p_ManufactureYear IN NUMBER
) AS
BEGIN
    IF p_Capacity <= 0 THEN RAISE_APPLICATION_ERROR(-20023, 'Lỗi: Sức chứa máy bay phải lớn hơn 0.'); END IF;
    INSERT INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear)
    VALUES (p_AirlineID, p_Model, p_Capacity, p_ManufactureYear);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_AIRCRAFT (
    p_AircraftID IN VARCHAR2, p_AirlineID IN VARCHAR2, p_Model IN VARCHAR2, p_Capacity IN NUMBER, p_ManufactureYear IN NUMBER
) AS
BEGIN
    UPDATE AIRCRAFT SET AirlineID = p_AirlineID, Model = p_Model, Capacity = p_Capacity, ManufactureYear = p_ManufactureYear WHERE AircraftID = p_AircraftID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_DELETE_AIRCRAFT (p_AircraftID IN VARCHAR2) AS
BEGIN
    DELETE FROM SEAT WHERE AircraftID = p_AircraftID;
    DELETE FROM AIRCRAFT WHERE AircraftID = p_AircraftID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN RAISE_APPLICATION_ERROR(-20049, 'Lỗi: Máy bay đang được gán cho một chuyến bay.');
        ELSE RAISE; END IF;
END;
/


-- ================================= Bảng ROUTE =================================

-- ================================= Bảng FLIGHT =================================


CREATE OR REPLACE PROCEDURE SP_CANCEL_FLIGHT (p_FlightID IN VARCHAR2) AS
BEGIN
    UPDATE FLIGHT SET FlightStatus = 'CANCELLED' WHERE FlightID = p_FlightID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_DELAY_FLIGHT (p_FlightID IN VARCHAR2, p_NewDepartureTime IN DATE) AS
    v_OldDepartureTime DATE;
BEGIN
    SELECT DepartureTime INTO v_OldDepartureTime FROM FLIGHT WHERE FlightID = p_FlightID;
    IF p_NewDepartureTime <= v_OldDepartureTime THEN RAISE_APPLICATION_ERROR(-20001, 'Giờ mới phải muộn hơn giờ cũ.'); END IF;

    UPDATE FLIGHT 
    SET DepartureTime = p_NewDepartureTime, 
        ArrivalTime = p_NewDepartureTime + (ArrivalTime - DepartureTime),
        FlightStatus = 'DELAYED'
    WHERE FlightID = p_FlightID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_ADD_FLIGHT_UI (
    p_FlightNumber IN VARCHAR2, p_AirlineID IN VARCHAR2, p_AircraftID IN VARCHAR2,
    p_DepartureAirportID IN VARCHAR2, p_ArrivalAirportID IN VARCHAR2,
    p_DepartureTime IN DATE, p_ArrivalTime IN DATE, p_Gate IN VARCHAR2, p_FlightStatus IN VARCHAR2
) AS
    v_RouteID VARCHAR2(20);
BEGIN
    BEGIN
        SELECT RouteID INTO v_RouteID FROM ROUTE
        WHERE DepartureAirportID = p_DepartureAirportID AND ArrivalAirportID = p_ArrivalAirportID AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO ROUTE (DepartureAirportID, ArrivalAirportID)
            VALUES (p_DepartureAirportID, p_ArrivalAirportID) RETURNING RouteID INTO v_RouteID;
    END;

    INSERT INTO FLIGHT (FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus)
    VALUES (p_FlightNumber, p_AirlineID, p_AircraftID, v_RouteID, p_DepartureTime, p_ArrivalTime, p_Gate, NVL(UPPER(p_FlightStatus), 'SCHEDULED'));
    COMMIT;
END;
/



-- ================================= Bảng BOOKING & PAYMENT =================================
CREATE OR REPLACE PROCEDURE SP_CREATE_BOOKING_TRANSACTION (
    p_CustomerID IN VARCHAR2, p_EmployeeID IN VARCHAR2, p_FlightID IN VARCHAR2, p_SeatID IN VARCHAR2
) AS
    v_BookingID VARCHAR2(20); v_Price NUMBER; v_SeatClass VARCHAR2(20);
BEGIN
    SELECT Class INTO v_SeatClass FROM SEAT WHERE SeatID = p_SeatID;
    SELECT Price INTO v_Price FROM SEATCLASSPRICE WHERE FlightID = p_FlightID AND Class = v_SeatClass;

    INSERT INTO BOOKING (CustomerID, EmployeeID, Status)
    VALUES (p_CustomerID, p_EmployeeID, 'PENDING') RETURNING BookingID INTO v_BookingID;

    INSERT INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus)
    VALUES (v_BookingID, p_FlightID, p_SeatID, v_Price, 'BOOKED');
    COMMIT;
END;
/



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


-- ================================= ĐĂNG KÝ TÀI KHOẢN AN TOÀN (Sửa lại chuẩn Database Mới) =================================
-- ================================= ĐĂNG KÝ TÀI KHOẢN AN TOÀN =================================
CREATE OR REPLACE PROCEDURE SP_REGISTER_ACCOUNT (
    p_FullName IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_UserName IN VARCHAR2,
    p_Password IN VARCHAR2
) AS
    v_UserID VARCHAR2(20);
    v_AccountID VARCHAR2(20);
    v_HashedPassword VARCHAR2(256);
    v_CheckEmail NUMBER;
    v_CheckUserName NUMBER;
BEGIN
    -- Check Email
    SELECT COUNT(*)
    INTO v_CheckEmail
    FROM USERS
    WHERE Email = p_Email;

    IF v_CheckEmail > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20010,
            'Lỗi: Email này đã được đăng ký!'
        );
    END IF;

    -- Check UserName
    SELECT COUNT(*)
    INTO v_CheckUserName
    FROM ACCOUNT
    WHERE UserName = p_UserName;

    IF v_CheckUserName > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20011,
            'Lỗi: Tên đăng nhập này đã tồn tại!'
        );
    END IF;

    -- Insert User
    INSERT INTO USERS (FullName, Email, IsDeleted)
    VALUES (p_FullName, p_Email, 0)
    RETURNING UserID INTO v_UserID;

    -- Insert Account (Lưu mật khẩu gốc nguyên bản)
    INSERT INTO ACCOUNT (UserID, UserName, Password, IsDeleted)
    VALUES (v_UserID, p_UserName, p_Password, 0)
    RETURNING AccountID INTO v_AccountID;

    -- Insert Customer
    INSERT INTO CUSTOMER (AccountID, FullName, Phone, Email)
    VALUES (v_AccountID, p_FullName, p_Phone, p_Email);

    -- Cấp quyền Khách Hàng (CUSTOMER_GROUP: RG01) mặc định
    INSERT INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted)
    VALUES (v_AccountID, 'RG01', 0);

    COMMIT;
END;
/
-- ================================= Bảng CUSTOMER =================================
-- Thêm hồ sơ khách hàng mới
CREATE OR REPLACE PROCEDURE SP_ADD_CUSTOMER (
    p_AccountID IN VARCHAR2,
    p_FullName IN VARCHAR2,
    p_Gender IN VARCHAR2,
    p_DateOfBirth IN DATE,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Passport IN VARCHAR2,
    p_Nationality IN VARCHAR2
) AS
BEGIN
    INSERT INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality)
    VALUES (p_AccountID, p_FullName, p_Gender, p_DateOfBirth, p_Phone, p_Email, p_Passport, p_Nationality);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Đã thêm khách hàng mới thành công!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20021, 'Lỗi: AccountID, Email hoặc Passport đã tồn tại trong hệ thống.');
END;
/

-- Cập nhật thông tin liên lạc của khách hàng
CREATE OR REPLACE PROCEDURE SP_UPDATE_CUSTOMER_INFO (
    p_CustomerID IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    UPDATE CUSTOMER 
    SET Phone = p_Phone, Email = p_Email 
    WHERE CustomerID = p_CustomerID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20022, 'Lỗi: Không tìm thấy khách hàng này.');
    END IF;

    COMMIT;
END;
/

--================================= Bảng EMPLOYEE =================================
--Thêm nhân viên mới
CREATE OR REPLACE PROCEDURE SP_ADD_EMPLOYEE (
    p_AccountID IN VARCHAR2,
    p_FullName IN VARCHAR2,
    p_Position IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    INSERT INTO EMPLOYEE (AccountID, FullName, Position, Phone, Email)
    VALUES (p_AccountID, p_FullName, p_Position, p_Phone, p_Email);

    COMMIT;
END;
/

--Cập nhật chức vụ và liên hệ của Nhân viên:
CREATE OR REPLACE PROCEDURE SP_UPDATE_EMPLOYEE (
    p_EmployeeID IN VARCHAR2,
    p_Position IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    UPDATE EMPLOYEE
    SET Position = p_Position, Phone = p_Phone, Email = p_Email
    WHERE EmployeeID = p_EmployeeID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20053, 'Lỗi: Không tìm thấy Nhân viên cần cập nhật.');
    END IF;
    COMMIT;
END;
/

--Xóa Nhân viên:
CREATE OR REPLACE PROCEDURE SP_DELETE_EMPLOYEE (p_EmployeeID IN VARCHAR2) AS
BEGIN
    DELETE FROM EMPLOYEE WHERE EmployeeID = p_EmployeeID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20054, 'Lỗi: Không tìm thấy Nhân viên để xóa.');
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            RAISE_APPLICATION_ERROR(-20055, 'Lỗi: Nhân viên này đã từng xử lý giao dịch (Booking), không thể xóa hẳn.');
        ELSE RAISE; END IF;
END;
/

--================================= Bảng TICKET & BOOKING (Phần bổ sung) =================================

--Đổi chuyến bay / Đổi vé 
CREATE OR REPLACE PROCEDURE SP_CHANGE_FLIGHT_TICKET (
    p_TicketID IN VARCHAR2, p_NewFlightID IN VARCHAR2, p_NewSeatID IN VARCHAR2
) AS
    v_OldPrice NUMBER; v_NewPrice NUMBER; v_BookingID VARCHAR2(20);
    v_SeatClass VARCHAR2(20); v_SeatBooked NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_SeatBooked FROM TICKET 
    WHERE FlightID = p_NewFlightID AND SeatID = p_NewSeatID AND TicketStatus != 'CANCELLED';
    
    IF v_SeatBooked > 0 THEN RAISE_APPLICATION_ERROR(-20010, 'Ghế đã có người đặt.'); END IF;

    SELECT Price, BookingID INTO v_OldPrice, v_BookingID FROM TICKET WHERE TicketID = p_TicketID;
    SELECT Class INTO v_SeatClass FROM SEAT WHERE SeatID = p_NewSeatID;
    SELECT Price INTO v_NewPrice FROM SEATCLASSPRICE WHERE FlightID = p_NewFlightID AND Class = v_SeatClass;

    UPDATE TICKET SET FlightID = p_NewFlightID, SeatID = p_NewSeatID, Price = v_NewPrice WHERE TicketID = p_TicketID;
    UPDATE BOOKING SET TotalAmount = TotalAmount + (v_NewPrice - v_OldPrice) WHERE BookingID = v_BookingID;
    COMMIT;
END;
/

--================================= Bảng SEAT & BAGGAGE =================================

--================================= Bảng DASHBOARD & BÁO CÁO =================================

--================================= Bảng SEATCLASSPRICE =================================

-- ================================= QUẢN LÝ USER / ACCOUNT / ROLE =================================

CREATE OR REPLACE PROCEDURE SP_ADD_ROLE_GROUP (p_NameRoleGroup IN VARCHAR2) AS
BEGIN
    INSERT INTO ROLE_GROUP (NameRoleGroup) VALUES (p_NameRoleGroup);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_ROLE_GROUP (p_RoleGroupID IN VARCHAR2, p_NameRoleGroup IN VARCHAR2) AS
BEGIN
    UPDATE ROLE_GROUP SET NameRoleGroup = p_NameRoleGroup, Updated_At = SYSDATE WHERE RoleGroupID = p_RoleGroupID AND IsDeleted = 0;
    COMMIT;
END;
/

    
CREATE OR REPLACE PROCEDURE SP_CANCEL_TICKET_FINAL (
    p_TicketID IN VARCHAR2
) AS
    v_BookingID VARCHAR2(20);
    v_CustomerID VARCHAR2(20);
    v_RefundAmount NUMBER;
BEGIN
    SELECT t.BookingID, b.CustomerID INTO v_BookingID, v_CustomerID
    FROM TICKET t JOIN BOOKING b ON t.BookingID = b.BookingID
    WHERE t.TicketID = p_TicketID;

    v_RefundAmount := FUNC_CALCULATE_REFUND(p_TicketID);

    UPDATE TICKET SET TicketStatus = 'CANCELLED' WHERE TicketID = p_TicketID;

    IF v_RefundAmount > 0 THEN
        INSERT INTO TRANSACTION_HISTORY (CustomerID, BookingID, TransactionType, Amount, Description)
        VALUES (v_CustomerID, v_BookingID, 'REFUND', v_RefundAmount, 'Hoàn tiền vé ' || p_TicketID);
        
        UPDATE BOOKING SET TotalAmount = TotalAmount - v_RefundAmount WHERE BookingID = v_BookingID;
    END IF;
    COMMIT;
END;
/

-- =========================================================================
-- PHẦN 3: PROCEDURES LIÊN QUAN (SỬ DỤNG TRONG BOOKINGDAO.JAVA)/ wang
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
    p_CustomerID IN VARCHAR2,
    p_BookingID OUT VARCHAR2
) AS
BEGIN
    INSERT INTO BOOKING (CustomerID, TotalAmount, Status, BookingDate)
    VALUES (p_CustomerID, 0, 'PENDING', CURRENT_TIMESTAMP)
    RETURNING BookingID INTO p_BookingID;
END;
/

-- 3. SP_CLEANUP_AND_BOOK_TICKET (Dọn rác giữ chỗ cũ của ghế đó và tạo giữ chỗ mới)
CREATE OR REPLACE PROCEDURE SP_CLEANUP_AND_BOOK_TICKET (
    p_BookingID   IN VARCHAR2,
    p_FlightID    IN VARCHAR2,
    p_SeatNumber  IN VARCHAR2,
    p_PassengerID IN VARCHAR2,
    p_Price       IN NUMBER
) AS
    v_SeatID VARCHAR2(20);
BEGIN
    -- Lấy SeatID từ Số ghế và máy bay của Flight
    SELECT s.SeatID INTO v_SeatID
    FROM SEAT s JOIN FLIGHT f ON s.AircraftID = f.AircraftID
    WHERE f.FlightID = p_FlightID AND s.SeatNumber = TRIM(p_SeatNumber)
      AND ROWNUM = 1;

    -- Giải phóng ghế cũ: đánh dấu CANCELLED + xóa SeatID để tránh 2 vấn đề:
    --   (1) Nếu chỉ CANCELLED mà giữ SeatID → UNIQUE(FlightID,SeatID) bị vi phạm khi INSERT mới
    --   (2) Nếu chỉ SET NULL mà không CANCELLED → TRG_UPDATE_BOOKING_TOTAL trừ tiền âm (ORA-02290)
    UPDATE TICKET
    SET TicketStatus = 'CANCELLED',
        SeatID       = NULL
    WHERE FlightID = p_FlightID
      AND SeatID   = v_SeatID
      AND TicketStatus NOT IN ('PAID', 'CHECKED-IN', 'CANCELLED');

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

    -- Chuyển trạng thái đơn hàng sang CONFIRMED
    UPDATE BOOKING SET Status = 'CONFIRMED' WHERE BookingID = p_BookingID;
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

-- 1. THỦ TỤC LẤY DANH SÁCH CHUYẾN BAY SẮP TỚI CỦA KHÁCH HÀNG
CREATE OR REPLACE PROCEDURE SP_GET_MY_FLIGHTS (
    p_account_id IN VARCHAR2,
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
        SELECT 
            b.BookingID,
            f.FlightID,
            dep.IATACode as DepartureIATA,
            arr.IATACode as ArrivalIATA,
            dep.City as DepartureCity,
            arr.City as ArrivalCity,
            al.AirlineName,
            f.FlightNumber,
            MAX(t.TicketStatus) as TicketStatus,
            f.DepartureTime,
            f.ArrivalTime,
            f.Gate,
            LISTAGG(s.SeatNumber, ', ') WITHIN GROUP (ORDER BY s.SeatNumber) as Seats,
            r.EstimatedTime
        FROM ACCOUNT acc
        JOIN CUSTOMER c ON acc.AccountID = c.AccountID
        JOIN BOOKING b ON c.CustomerID = b.CustomerID
        JOIN TICKET t ON b.BookingID = t.BookingID
        JOIN FLIGHT f ON t.FlightID = f.FlightID
        JOIN ROUTE r ON f.RouteID = r.RouteID
        JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID
        JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID
        JOIN AIRCRAFT a ON f.AircraftID = a.AircraftID
        JOIN AIRLINE al ON a.AirlineID = al.AirlineID
        LEFT JOIN SEAT s ON t.SeatID = s.SeatID
        WHERE acc.AccountID = p_account_id
          AND f.DepartureTime > SYSDATE
          AND b.Status != 'CANCELLED'
          AND t.TicketStatus != 'CANCELLED'
        GROUP BY b.BookingID, f.FlightID, dep.IATACode, arr.IATACode, dep.City, arr.City, 
                 al.AirlineName, f.FlightNumber, f.DepartureTime, f.ArrivalTime, f.Gate, r.EstimatedTime
        ORDER BY f.DepartureTime ASC;
END SP_GET_MY_FLIGHTS;
/

-- 2. THỦ TỤC LẤY LỊCH SỬ GIAO DỊCH ĐẶT VÉ CỦA KHÁCH HÀNG
CREATE OR REPLACE PROCEDURE SP_GET_BOOKING_HISTORY (
    p_account_id IN VARCHAR2,
    p_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_cursor FOR
        SELECT 
            b.BookingID, 
            b.BookingDate, 
            b.TotalAmount, 
            b.Status as BookingStatus,
            p.PaymentMethod,
            f.DepartureTime,
            dep.IATACode as DepIATA,
            arr.IATACode as ArrIATA,
            (SELECT COUNT(*) FROM TICKET t2 WHERE t2.BookingID = b.BookingID) as TicketCount,
            (SELECT COUNT(*) FROM TICKET t3 WHERE t3.BookingID = b.BookingID AND t3.TicketStatus = 'CHECKED-IN') as CheckedInCount
        FROM ACCOUNT acc
        JOIN CUSTOMER c ON acc.AccountID = c.AccountID
        JOIN BOOKING b ON c.CustomerID = b.CustomerID
        LEFT JOIN PAYMENT p ON b.BookingID = p.BookingID
        LEFT JOIN (
            SELECT t.BookingID, MIN(t.FlightID) as FlightID 
            FROM TICKET t 
            GROUP BY t.BookingID
        ) first_flight ON b.BookingID = first_flight.BookingID
        LEFT JOIN FLIGHT f ON first_flight.FlightID = f.FlightID
        LEFT JOIN ROUTE r ON f.RouteID = r.RouteID
        LEFT JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID
        LEFT JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID
        WHERE acc.AccountID = p_account_id
          AND NOT (b.Status = 'CANCELLED' AND NOT EXISTS (
              SELECT 1 FROM PAYMENT p2 WHERE p2.BookingID = b.BookingID
          ))
        ORDER BY b.BookingDate DESC;
END SP_GET_BOOKING_HISTORY;
/

-- ================================= CẬP NHẬT CHUYẾN BAY (FULL) =================================
CREATE OR REPLACE PROCEDURE SP_UPDATE_FLIGHT_FULL (
    p_FlightID IN VARCHAR2,
    p_FlightNumber IN VARCHAR2, 
    p_AirlineID IN VARCHAR2, 
    p_AircraftID IN VARCHAR2, 
    p_DepartureAirportID IN VARCHAR2, 
    p_ArrivalAirportID IN VARCHAR2,
    p_DepartureTime IN DATE, 
    p_ArrivalTime IN DATE,
    p_Gate IN VARCHAR2
) AS
    v_RouteID VARCHAR2(20);
BEGIN
    BEGIN
        SELECT RouteID INTO v_RouteID FROM ROUTE
        WHERE DepartureAirportID = p_DepartureAirportID AND ArrivalAirportID = p_ArrivalAirportID AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO ROUTE (DepartureAirportID, ArrivalAirportID)
            VALUES (p_DepartureAirportID, p_ArrivalAirportID) RETURNING RouteID INTO v_RouteID;
    END;

    UPDATE FLIGHT 
    SET FlightNumber = p_FlightNumber, 
        AirlineID = p_AirlineID, 
        AircraftID = p_AircraftID, 
        RouteID = v_RouteID, 
        DepartureTime = p_DepartureTime, 
        ArrivalTime = p_ArrivalTime, 
        Gate = p_Gate
    WHERE FlightID = p_FlightID;
    
    COMMIT;
END;
/

-- ================================= CẬP NHẬT KHÁCH HÀNG (FULL) =================================
CREATE OR REPLACE PROCEDURE SP_UPDATE_CUSTOMER_FULL (
    p_CustomerID IN VARCHAR2,
    p_FullName IN VARCHAR2,
    p_Gender IN VARCHAR2,
    p_DateOfBirth IN DATE,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_PassportNumber IN VARCHAR2,
    p_Nationality IN VARCHAR2
) AS
BEGIN
    UPDATE CUSTOMER 
    SET FullName = p_FullName, 
        Gender = p_Gender, 
        DateOfBirth = p_DateOfBirth, 
        Phone = p_Phone, 
        Email = p_Email, 
        PassportNumber = p_PassportNumber, 
        Nationality = p_Nationality
    WHERE CustomerID = p_CustomerID;
    
    COMMIT;
END;
/

-- ================================= XÓA KHÁCH HÀNG =================================
CREATE OR REPLACE PROCEDURE SP_DELETE_CUSTOMER (
    p_CustomerID IN VARCHAR2
) AS
BEGIN
    DELETE FROM CUSTOMER WHERE CustomerID = p_CustomerID;
    COMMIT;
END;
/

-- ================================= XÓA MỀM NHÓM QUYỀN =================================
CREATE OR REPLACE PROCEDURE SP_DELETE_ROLE_GROUP (
    p_RoleGroupID IN VARCHAR2
) AS
BEGIN
    UPDATE ROLE_GROUP 
    SET IsDeleted = 1, Updated_At = SYSDATE 
    WHERE RoleGroupID = p_RoleGroupID;
    
    COMMIT;
END;
/

-- ================================= GÁN QUYỀN CHO NHÓM QUYỀN =================================
CREATE OR REPLACE PROCEDURE SP_ASSIGN_ROLE_TO_GROUP (
    p_RoleGroupID IN VARCHAR2,
    p_RoleID IN VARCHAR2
) AS
    v_Check NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Check FROM ROLE_GROUP_ASSIGN_ROLE 
    WHERE RoleGroupID = p_RoleGroupID AND RoleID = p_RoleID;
    
    IF v_Check > 0 THEN
        UPDATE ROLE_GROUP_ASSIGN_ROLE 
        SET IsDeleted = 0, Updated_At = SYSDATE 
        WHERE RoleGroupID = p_RoleGroupID AND RoleID = p_RoleID;
    ELSE
        INSERT INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, Created_At, Updated_At, IsDeleted) 
        VALUES (p_RoleGroupID, p_RoleID, SYSDATE, SYSDATE, 0);
    END IF;
    
    COMMIT;
END;
/

-- ================================= XÓA TẤT CẢ QUYỀN CỦA NHÓM QUYỀN =================================
CREATE OR REPLACE PROCEDURE SP_REMOVE_ALL_ROLES_FROM_GROUP (
    p_RoleGroupID IN VARCHAR2
) AS
BEGIN
    UPDATE ROLE_GROUP_ASSIGN_ROLE 
    SET IsDeleted = 1, Updated_At = SYSDATE 
    WHERE RoleGroupID = p_RoleGroupID;
    
    COMMIT;
END;
/

-- ================================= CÁC PROCEDURE BỔ SUNG CHO DAO ĐẶT VÉ =================================

CREATE OR REPLACE PROCEDURE SP_UPDATE_BOOKING_STATUS (
    p_BookingID IN VARCHAR2,
    p_Status IN VARCHAR2
) AS
BEGIN
    UPDATE BOOKING SET Status = p_Status WHERE BookingID = p_BookingID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_INSERT_PAYMENT (
    p_BookingID IN VARCHAR2,
    p_Amount IN NUMBER,
    p_PaymentMethod IN VARCHAR2
) AS
BEGIN
    INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) 
    VALUES ('PAY-' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), p_BookingID, SYSDATE, p_Amount, p_PaymentMethod, 'SUCCESS');
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_TICKETS_STATUS (
    p_BookingID IN VARCHAR2,
    p_Status IN VARCHAR2
) AS
BEGIN
    UPDATE TICKET SET TicketStatus = p_Status WHERE BookingID = p_BookingID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_APPLY_CANCELLATION_FEE (
    p_BookingID IN VARCHAR2
) AS
BEGIN
    UPDATE BOOKING SET TotalAmount = TotalAmount * 0.3 WHERE BookingID = p_BookingID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_REFUND_PAYMENT (
    p_BookingID IN VARCHAR2
) AS
BEGIN
    UPDATE PAYMENT SET PaymentStatus = 'REFUNDED' WHERE BookingID = p_BookingID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_CHECK_IN_TICKET (
    p_BookingID IN VARCHAR2,
    p_FlightID IN VARCHAR2
) AS
BEGIN
    UPDATE TICKET SET TicketStatus = 'CHECKED-IN' WHERE BookingID = p_BookingID AND FlightID = p_FlightID;
    COMMIT;
END;
/



CREATE OR REPLACE PROCEDURE SP_RESET_PASSWORD (
    p_UserName IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_NewPassword IN VARCHAR2
) AS
    v_AccountID VARCHAR2(20);
BEGIN
    -- Verify if the UserName and Email match
    SELECT a.AccountID INTO v_AccountID
    FROM ACCOUNT a
    JOIN USERS u ON a.UserID = u.UserID
    WHERE a.UserName = p_UserName AND u.Email = p_Email AND (a.IsDeleted = 0 OR a.IsDeleted IS NULL);

    -- Update the password
    UPDATE ACCOUNT SET Password = p_NewPassword, Updated_At = SYSDATE WHERE AccountID = v_AccountID;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20062, 'Lỗi: Tên đăng nhập hoặc Email không đúng.');
END;
/

