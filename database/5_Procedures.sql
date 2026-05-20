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
    p_AirlineID IN VARCHAR2, -- Đổi thành VARCHAR2
    p_AirlineName IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    UPDATE AIRLINE
    SET AirlineName = p_AirlineName, Phone = p_Phone, Email = p_Email
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
    p_AirportID IN VARCHAR2, p_AirportName IN VARCHAR2, p_City IN VARCHAR2, p_Country IN VARCHAR2
) AS
BEGIN
    UPDATE AIRPORT
    SET AirportName = p_AirportName, City = p_City, Country = p_Country
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
    p_AircraftID IN VARCHAR2, p_Model IN VARCHAR2, p_ManufactureYear IN NUMBER
) AS
BEGIN
    UPDATE AIRCRAFT SET Model = p_Model, ManufactureYear = p_ManufactureYear WHERE AircraftID = p_AircraftID;
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
CREATE OR REPLACE PROCEDURE SP_ADD_ROUTE (
    p_DepartureAirportID IN VARCHAR2, p_ArrivalAirportID IN VARCHAR2, p_Distance IN NUMBER, p_EstimatedTime IN NUMBER
) AS
BEGIN
    IF p_DepartureAirportID = p_ArrivalAirportID THEN RAISE_APPLICATION_ERROR(-20032, 'Lỗi: Sân bay trùng nhau.'); END IF;
    INSERT INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime)
    VALUES (p_DepartureAirportID, p_ArrivalAirportID, p_Distance, p_EstimatedTime);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_ROUTE (p_RouteID IN VARCHAR2, p_Distance IN NUMBER, p_EstimatedTime IN NUMBER) AS
BEGIN
    UPDATE ROUTE SET Distance = p_Distance, EstimatedTime = p_EstimatedTime WHERE RouteID = p_RouteID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_DELETE_ROUTE (p_RouteID IN VARCHAR2) AS
BEGIN
    DELETE FROM ROUTE WHERE RouteID = p_RouteID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN RAISE_APPLICATION_ERROR(-20052, 'Lỗi: Đang có chuyến bay hoạt động trên tuyến.');
        ELSE RAISE; END IF;
END;
/


-- ================================= Bảng FLIGHT =================================
CREATE OR REPLACE PROCEDURE SP_ADD_FLIGHT (
    p_FlightNumber IN VARCHAR2, 
    p_AirlineID IN VARCHAR2, 
    p_AircraftID IN VARCHAR2, 
    p_RouteID IN VARCHAR2, 
    p_DepartureTime IN DATE, 
    p_ArrivalTime IN DATE,
    p_Gate IN VARCHAR2 -- Đã bổ sung tham số Gate
) AS
BEGIN
    INSERT INTO FLIGHT (FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus)
    VALUES (p_FlightNumber, p_AirlineID, p_AircraftID, p_RouteID, p_DepartureTime, p_ArrivalTime, p_Gate, 'SCHEDULED');
    
    COMMIT;
END;
/

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

-- Cập nhật Cổng ra máy bay (Gate) cho chuyến bay
CREATE OR REPLACE PROCEDURE SP_UPDATE_FLIGHT_GATE (
    p_FlightID IN VARCHAR2,
    p_NewGate IN VARCHAR2
) AS
BEGIN
    UPDATE FLIGHT 
    SET Gate = p_NewGate 
    WHERE FlightID = p_FlightID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20080, 'Lỗi: Không tìm thấy chuyến bay để cập nhật Cổng.');
    END IF;
    
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

CREATE OR REPLACE PROCEDURE SP_PROCESS_PAYMENT (p_BookingID IN VARCHAR2, p_PaymentMethod IN VARCHAR2) AS
    v_TotalAmount NUMBER; v_PaymentID VARCHAR2(20);
BEGIN
    SELECT TotalAmount INTO v_TotalAmount FROM BOOKING WHERE BookingID = p_BookingID AND Status = 'PENDING';

    INSERT INTO PAYMENT (BookingID, Amount, PaymentMethod, PaymentStatus)
    VALUES (p_BookingID, v_TotalAmount, p_PaymentMethod, 'SUCCESS') RETURNING PaymentID INTO v_PaymentID;

    UPDATE TICKET SET TicketStatus = 'PAID' WHERE BookingID = p_BookingID;
    UPDATE BOOKING SET Status = 'CONFIRMED' WHERE BookingID = p_BookingID;
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
    p_Password IN VARCHAR2
) AS
    v_UserID VARCHAR2(20);
    v_AccountID VARCHAR2(20);
    v_HashedPassword VARCHAR2(256);
    v_CheckEmail NUMBER;
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

    SELECT TO_CHAR(ORA_HASH(p_Password)) 
    INTO v_HashedPassword 
    FROM DUAL;

    -- Insert User
    INSERT INTO USERS (FullName, Email)
    VALUES (p_FullName, p_Email)
    RETURNING UserID INTO v_UserID;

    -- Insert Account
    INSERT INTO ACCOUNT (UserID, UserName, Password)
    VALUES (v_UserID, p_Email, v_HashedPassword)
    RETURNING AccountID INTO v_AccountID;

    -- Insert Customer
    INSERT INTO CUSTOMER (
        AccountID,
        FullName,
        Phone,
        Email
    )
    VALUES (
        v_AccountID,
        p_FullName,
        p_Phone,
        p_Email
    );

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
--Tự động hủy các Booking quá hạn 
CREATE OR REPLACE PROCEDURE SP_AUTO_CANCEL_EXPIRED_BOOKINGS AS
    CURSOR c_ExpiredBookings IS
        SELECT BookingID FROM BOOKING WHERE Status = 'PENDING' AND BookingDate < SYSDATE - 1;
BEGIN
    FOR rec IN c_ExpiredBookings LOOP
        UPDATE BOOKING SET Status = 'CANCELLED' WHERE BookingID = rec.BookingID;
        UPDATE TICKET SET TicketStatus = 'CANCELLED' WHERE BookingID = rec.BookingID;
    END LOOP;
    COMMIT;
END;
/

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
--Khởi tạo ghế tự động cho máy bay 
CREATE OR REPLACE PROCEDURE SP_GENERATE_SEATS (p_AircraftID IN VARCHAR2, p_BusinessSeats IN NUMBER) AS
    v_Capacity NUMBER; v_EconomySeats NUMBER;
BEGIN
    SELECT Capacity INTO v_Capacity FROM AIRCRAFT WHERE AircraftID = p_AircraftID;
    v_EconomySeats := v_Capacity - p_BusinessSeats;

    FOR i IN 1..p_BusinessSeats LOOP
        INSERT INTO SEAT (AircraftID, SeatNumber, Class) VALUES (p_AircraftID, 'B' || i, 'Business');
    END LOOP;

    FOR j IN 1..v_EconomySeats LOOP
        INSERT INTO SEAT (AircraftID, SeatNumber, Class) VALUES (p_AircraftID, 'E' || j, 'Economy');
    END LOOP;
    COMMIT;
END;
/

-- Mua thêm/đăng ký hành lý cho một vé cụ thể
CREATE OR REPLACE PROCEDURE SP_ADD_BAGGAGE (
    p_TicketID IN VARCHAR2, p_Weight IN NUMBER, p_BaggageType IN VARCHAR2
) AS
    v_TicketStatus VARCHAR2(50);
BEGIN
    SELECT TicketStatus INTO v_TicketStatus FROM TICKET WHERE TicketID = p_TicketID;
    
    IF v_TicketStatus = 'CANCELLED' THEN
        RAISE_APPLICATION_ERROR(-20025, 'Lỗi: Không thể thêm hành lý cho vé đã hủy.');
    END IF;

    INSERT INTO BAGGAGE (TicketID, Weight, BaggageType)
    VALUES (p_TicketID, p_Weight, p_BaggageType);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK; RAISE_APPLICATION_ERROR(-20026, 'Lỗi: Không tìm thấy mã vé này.');
END;
/

--================================= Bảng DASHBOARD & BÁO CÁO =================================
CREATE OR REPLACE PROCEDURE SP_GET_DASHBOARD_REPORT (
    p_StartDate IN DATE, 
    p_EndDate IN DATE, 
    p_AirlineID IN VARCHAR2, -- Đã đổi sang VARCHAR2
    p_KPI_Data OUT SYS_REFCURSOR, 
    p_RevenueTrend OUT SYS_REFCURSOR, 
    p_ClassRevenue OUT SYS_REFCURSOR 
) AS
BEGIN
    OPEN p_KPI_Data FOR
        WITH FilteredFlights AS (
            SELECT FlightID, DepartureTime, FlightStatus
            FROM FLIGHT
            WHERE (p_AirlineID IS NULL OR AirlineID = p_AirlineID)
              AND DepartureTime BETWEEN p_StartDate AND p_EndDate
        )
        SELECT 
            (SELECT NVL(SUM(t.Price), 0) FROM TICKET t JOIN FilteredFlights f ON t.FlightID = f.FlightID WHERE t.TicketStatus = 'PAID') AS Total_Revenue,
            (SELECT COUNT(DISTINCT t.BookingID) FROM TICKET t JOIN FilteredFlights f ON t.FlightID = f.FlightID WHERE t.TicketStatus != 'CANCELLED') AS Total_Bookings,
            (SELECT NVL(ROUND(AVG(FUNC_GET_OCCUPANCY_RATE(f.FlightID)), 2), 0) FROM FilteredFlights f) AS Avg_Occupancy_Rate,
            (SELECT COUNT(FlightID) FROM FilteredFlights WHERE FlightStatus = 'COMPLETED') AS Completed_Flights
        FROM DUAL;

    OPEN p_RevenueTrend FOR
        SELECT TO_CHAR(f.DepartureTime, 'MM') AS Month_Number, TO_CHAR(f.DepartureTime, 'Mon') AS Month_Name, NVL(SUM(t.Price), 0) AS Monthly_Revenue
        FROM TICKET t
        JOIN FLIGHT f ON t.FlightID = f.FlightID
        WHERE (p_AirlineID IS NULL OR f.AirlineID = p_AirlineID)
          AND f.DepartureTime BETWEEN p_StartDate AND p_EndDate AND t.TicketStatus = 'PAID'
        GROUP BY TO_CHAR(f.DepartureTime, 'MM'), TO_CHAR(f.DepartureTime, 'Mon')
        ORDER BY Month_Number;

    OPEN p_ClassRevenue FOR
        SELECT s.Class AS Seat_Class, NVL(SUM(t.Price), 0) AS Revenue, COUNT(t.TicketID) AS Tickets_Sold
        FROM TICKET t
        JOIN FLIGHT f ON t.FlightID = f.FlightID
        JOIN SEAT s ON t.SeatID = s.SeatID
        WHERE (p_AirlineID IS NULL OR f.AirlineID = p_AirlineID)
          AND f.DepartureTime BETWEEN p_StartDate AND p_EndDate AND t.TicketStatus = 'PAID'
        GROUP BY s.Class
        ORDER BY Revenue DESC;
END;
/

--================================= Bảng SEATCLASSPRICE =================================
CREATE OR REPLACE PROCEDURE SP_ADD_SEAT_PRICE (p_FlightID IN VARCHAR2, p_Class IN VARCHAR2, p_Price IN NUMBER) AS
BEGIN
    IF p_Price <= 0 THEN RAISE_APPLICATION_ERROR(-20073, 'Lỗi: Giá vé phải lớn hơn 0.'); END IF;
    INSERT INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (p_FlightID, UPPER(p_Class), p_Price);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_APPLY_FLIGHT_DISCOUNT (p_FlightID IN VARCHAR2, p_DiscountPercent IN NUMBER) AS
BEGIN
    IF p_DiscountPercent < 0 OR p_DiscountPercent > 100 THEN RAISE_APPLICATION_ERROR(-20011, 'Phần trăm giảm giá phải từ 0 đến 100.'); END IF;
    UPDATE SEATCLASSPRICE SET Price = Price - (Price * p_DiscountPercent / 100) WHERE FlightID = p_FlightID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_SEAT_PRICE (p_FlightID IN VARCHAR2, p_Class IN VARCHAR2, p_NewPrice IN NUMBER) AS
BEGIN
    IF p_NewPrice <= 0 THEN RAISE_APPLICATION_ERROR(-20033, 'Lỗi: Giá vé phải lớn hơn 0.'); END IF;
    UPDATE SEATCLASSPRICE SET Price = p_NewPrice WHERE FlightID = p_FlightID AND Class = UPPER(p_Class);
    IF SQL%ROWCOUNT = 0 THEN RAISE_APPLICATION_ERROR(-20034, 'Lỗi: Không tìm thấy.'); END IF;
    COMMIT;
END;
/

-- ================================= QUẢN LÝ USER / ACCOUNT / ROLE =================================

CREATE OR REPLACE PROCEDURE SP_ADD_USER (p_FullName IN VARCHAR2, p_Email IN VARCHAR2) AS
BEGIN
    INSERT INTO USERS (FullName, Email, IsDeleted) VALUES (p_FullName, p_Email, 0);
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK; RAISE_APPLICATION_ERROR(-20072, 'Lỗi: Email người dùng đã tồn tại.');
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_USER (p_UserID IN VARCHAR2, p_FullName IN VARCHAR2, p_Email IN VARCHAR2) AS
BEGIN
    UPDATE USERS SET FullName = p_FullName, Email = p_Email, Updated_At = SYSDATE WHERE UserID = p_UserID;
    COMMIT;
END;
/

-- Đã sửa trạng thái Account thành 'INACTIVE' để khớp với bảng constraint
CREATE OR REPLACE PROCEDURE SP_SOFT_DELETE_USER (p_UserID IN VARCHAR2) AS
BEGIN
    UPDATE USERS SET IsDeleted = 1, Updated_At = SYSDATE WHERE UserID = p_UserID;
    IF SQL%ROWCOUNT = 0 THEN RAISE_APPLICATION_ERROR(-20027, 'Lỗi: Không tìm thấy UserID này.'); END IF;

    UPDATE ACCOUNT SET IsDeleted = 1, Status = 'INACTIVE', Updated_At = SYSDATE WHERE UserID = p_UserID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_RESTORE_USER (p_UserID IN VARCHAR2) AS
BEGIN
    UPDATE USERS SET IsDeleted = 0, Updated_At = SYSDATE WHERE UserID = p_UserID;
    UPDATE ACCOUNT SET IsDeleted = 0, Status = 'ACTIVE', Updated_At = SYSDATE WHERE UserID = p_UserID;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_ADD_ACCOUNT (p_UserID IN VARCHAR2, p_UserName IN VARCHAR2, p_Password IN VARCHAR2) AS
BEGIN
    INSERT INTO ACCOUNT (UserID, UserName, Password, Status) VALUES (p_UserID, p_UserName, p_Password, 'ACTIVE');
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN ROLLBACK; RAISE_APPLICATION_ERROR(-20061, 'Lỗi: Tên đăng nhập đã tồn tại.');
END;
/

CREATE OR REPLACE PROCEDURE SP_CHANGE_PASSWORD (p_AccountID IN VARCHAR2, p_NewPassword IN VARCHAR2) AS
BEGIN
    UPDATE ACCOUNT SET Password = p_NewPassword, Updated_At = SYSDATE WHERE AccountID = p_AccountID;
    IF SQL%ROWCOUNT = 0 THEN RAISE_APPLICATION_ERROR(-20062, 'Lỗi: Không tìm thấy tài khoản.'); END IF;
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_ADD_FUNCTION (p_NameFunction IN VARCHAR2) AS
BEGIN
    INSERT INTO "FUNCTION" (NameFunction) VALUES (p_NameFunction);
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE SP_ASSIGN_ROLE_PERMISSIONS (
    p_FunctionID IN VARCHAR2, p_AddPerm IN NUMBER, p_EditPerm IN NUMBER, p_DeletePerm IN NUMBER, p_DownloadPerm IN NUMBER, p_ViewPerm IN NUMBER
) AS
BEGIN
    IF p_AddPerm NOT IN (0,1) OR p_EditPerm NOT IN (0,1) OR p_DeletePerm NOT IN (0,1) THEN
        RAISE_APPLICATION_ERROR(-20063, 'Lỗi: Giá trị phân quyền chỉ được là 0 hoặc 1.');
    END IF;
    INSERT INTO ROLE (FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm)
    VALUES (p_FunctionID, p_AddPerm, p_EditPerm, p_DeletePerm, p_DownloadPerm, p_ViewPerm);
    COMMIT;
END;
/

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

CREATE OR REPLACE PROCEDURE SP_ASSIGN_GROUP_TO_ACCOUNT (p_AccountID IN VARCHAR2, p_RoleGroupID IN VARCHAR2) AS
BEGIN
    INSERT INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID) VALUES (p_AccountID, p_RoleGroupID);
    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN ROLLBACK; RAISE_APPLICATION_ERROR(-20074, 'Lỗi: Tài khoản đã được gán nhóm quyền này.');
END;
/

CREATE OR REPLACE PROCEDURE SP_REMOVE_GROUP_FROM_ACCOUNT (p_AccountID IN VARCHAR2, p_RoleGroupID IN VARCHAR2) AS
BEGIN
    DELETE FROM ACCOUNT_ASSIGN_ROLE_GROUP WHERE AccountID = p_AccountID AND RoleGroupID = p_RoleGroupID;
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
