-- ================================= Bảng AIRLINE  =================================
--Thêm hãng mới
CREATE OR REPLACE PROCEDURE SP_ADD_AIRLINE (
    p_AirlineName IN VARCHAR2,
    p_Country IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
    v_AirlineID NUMBER;
BEGIN
    SELECT NVL(MAX(AirlineID), 0) + 1 INTO v_AirlineID FROM AIRLINE;

    INSERT INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email)
    VALUES (v_AirlineID, p_AirlineName, p_Country, p_Phone, p_Email);

    COMMIT;
END;


--Cập nhật thông tin Hãng bay:
CREATE OR REPLACE PROCEDURE SP_UPDATE_AIRLINE (
    p_AirlineID IN NUMBER,
    p_AirlineName IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    UPDATE AIRLINE
    SET AirlineName = p_AirlineName,
        Phone = p_Phone,
        Email = p_Email
    WHERE AirlineID = p_AirlineID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20044, 'Lỗi: Không tìm thấy Hãng hàng không cần cập nhật.');
    END IF;
    COMMIT;
END;


--Xóa Hãng bay:
CREATE OR REPLACE PROCEDURE SP_DELETE_AIRLINE (
    p_AirlineID IN NUMBER
) AS
BEGIN
    DELETE FROM AIRLINE WHERE AirlineID = p_AirlineID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20045, 'Lỗi: Không tìm thấy Hãng bay để xóa.');
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            RAISE_APPLICATION_ERROR(-20046, 'Lỗi: Không thể xóa hãng bay này vì đang có máy bay hoặc chuyến bay trực thuộc.');
        ELSE
            RAISE;
        END IF;
END;


-- ================================= Bảng AIRPORT  =================================
--Thêm sân bay mới
CREATE OR REPLACE PROCEDURE SP_ADD_AIRPORT (
    p_AirportName IN VARCHAR2,
    p_City IN VARCHAR2,
    p_Country IN VARCHAR2,
    p_IATACode IN CHAR
) AS
    v_AirportID NUMBER;
BEGIN
    SELECT NVL(MAX(AirportID), 0) + 1 INTO v_AirportID FROM AIRPORT;

    INSERT INTO AIRPORT (AirportID, AirportName, City, Country, IATACode)
    VALUES (v_AirportID, p_AirportName, p_City, p_Country, UPPER(p_IATACode));

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20031, 'Lỗi: Mã IATA này đã tồn tại!');
END;


--cập nhật thông tin sân bay
CREATE OR REPLACE PROCEDURE SP_UPDATE_AIRPORT (
    p_AirportID IN NUMBER,
    p_AirportName IN VARCHAR2,
    p_City IN VARCHAR2,
    p_Country IN VARCHAR2
) AS
BEGIN
    UPDATE AIRPORT
    SET AirportName = p_AirportName,
        City = p_City,
        Country = p_Country
    WHERE AirportID = p_AirportID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20041, 'Lỗi: Không tìm thấy Sân bay cần cập nhật.');
    END IF;
    COMMIT;
END;


--Xóa Sân bay:
CREATE OR REPLACE PROCEDURE SP_DELETE_AIRPORT (
    p_AirportID IN NUMBER
) AS
BEGIN
    DELETE FROM AIRPORT WHERE AirportID = p_AirportID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20042, 'Lỗi: Không tìm thấy Sân bay để xóa.');
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN -- Lỗi vi phạm khóa ngoại (ORA-02292)
            RAISE_APPLICATION_ERROR(-20043, 'Lỗi: Không thể xóa sân bay này vì đang có chuyến bay/tuyến bay sử dụng.');
        ELSE
            RAISE;
        END IF;
END;


-- ================================= Bảng AIRCRAFT  =================================
-- Thêm máy bay mới
CREATE OR REPLACE PROCEDURE SP_ADD_AIRCRAFT (
    p_AirlineID IN NUMBER,
    p_Model IN VARCHAR2,
    p_Capacity IN NUMBER,
    p_ManufactureYear IN NUMBER
) AS
    v_AircraftID NUMBER;
BEGIN
    IF p_Capacity <= 0 THEN
        RAISE_APPLICATION_ERROR(-20023, 'Lỗi: Sức chứa máy bay phải lớn hơn 0.');
    END IF;

    SELECT NVL(MAX(AircraftID), 0) + 1 INTO v_AircraftID FROM AIRCRAFT;

    INSERT INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear)
    VALUES (v_AircraftID, p_AirlineID, p_Model, p_Capacity, p_ManufactureYear);

    COMMIT;
END;


--Cập nhật thông tin Máy bay:
CREATE OR REPLACE PROCEDURE SP_UPDATE_AIRCRAFT (
    p_AircraftID IN NUMBER,
    p_Model IN VARCHAR2,
    p_ManufactureYear IN NUMBER
) AS
BEGIN
    UPDATE AIRCRAFT
    SET Model = p_Model,
        ManufactureYear = p_ManufactureYear
    WHERE AircraftID = p_AircraftID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20047, 'Lỗi: Không tìm thấy Máy bay cần cập nhật.');
    END IF;
    COMMIT;
END;


--Xóa Máy bay:
CREATE OR REPLACE PROCEDURE SP_DELETE_AIRCRAFT (
    p_AircraftID IN NUMBER
) AS
BEGIN
    -- Xóa các ghế thuộc máy bay này trước (nếu thiết kế chưa có ON DELETE CASCADE)
    DELETE FROM SEAT WHERE AircraftID = p_AircraftID;

    -- Sau đó mới xóa máy bay
    DELETE FROM AIRCRAFT WHERE AircraftID = p_AircraftID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20048, 'Lỗi: Không tìm thấy Máy bay để xóa.');
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            RAISE_APPLICATION_ERROR(-20049, 'Lỗi: Không thể xóa vì máy bay này đang được gán cho một chuyến bay.');
        ELSE
            RAISE;
        END IF;
END;


-- ================================= Bảng ROUTE  =================================
--Thêm tuyến bay
CREATE OR REPLACE PROCEDURE SP_ADD_ROUTE (
    p_DepartureAirportID IN NUMBER,
    p_ArrivalAirportID IN NUMBER,
    p_Distance IN NUMBER,
    p_EstimatedTime IN NUMBER
) AS
    v_RouteID NUMBER;
BEGIN
    IF p_DepartureAirportID = p_ArrivalAirportID THEN
        RAISE_APPLICATION_ERROR(-20032, 'Lỗi: Sân bay đi và đến không được trùng nhau.');
    END IF;

    SELECT NVL(MAX(RouteID), 0) + 1 INTO v_RouteID FROM ROUTE;

    INSERT INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime)
    VALUES (v_RouteID, p_DepartureAirportID, p_ArrivalAirportID, p_Distance, p_EstimatedTime);

    COMMIT;
END;


--Cập nhật Tuyến bay (Cập nhật khoảng cách & Thời gian bay dự kiến):
CREATE OR REPLACE PROCEDURE SP_UPDATE_ROUTE (
    p_RouteID IN NUMBER,
    p_Distance IN NUMBER,
    p_EstimatedTime IN NUMBER
) AS
BEGIN
    UPDATE ROUTE
    SET Distance = p_Distance,
        EstimatedTime = p_EstimatedTime
    WHERE RouteID = p_RouteID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20050, 'Lỗi: Không tìm thấy Tuyến bay cần cập nhật.');
    END IF;
    COMMIT;
END;


--Xóa Tuyến bay:
CREATE OR REPLACE PROCEDURE SP_DELETE_ROUTE (
    p_RouteID IN NUMBER
) AS
BEGIN
    DELETE FROM ROUTE WHERE RouteID = p_RouteID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20051, 'Lỗi: Không tìm thấy Tuyến bay để xóa.');
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            RAISE_APPLICATION_ERROR(-20052, 'Lỗi: Không thể xóa vì tuyến bay này đang có chuyến bay hoạt động.');
        ELSE
            RAISE;
        END IF;
END;


-- ================================= Bảng FLIGHT  =================================

-- Thêm chuyến bay mới
CREATE OR REPLACE PROCEDURE SP_ADD_FLIGHT (
    p_FlightNumber IN VARCHAR2,
    p_AirlineID IN NUMBER,
    p_AircraftID IN NUMBER,
    p_DepartureAirportID IN NUMBER,
    p_ArrivalAirportID IN NUMBER,
    p_RouteID IN NUMBER,
    p_DepartureTime IN DATE,
    p_ArrivalTime IN DATE
) AS
    v_FlightID NUMBER;
BEGIN
    SELECT NVL(MAX(FlightID), 0) + 1 INTO v_FlightID FROM FLIGHT;

    INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus)
    VALUES (v_FlightID, p_FlightNumber, p_AirlineID, p_AircraftID, p_DepartureAirportID, p_ArrivalAirportID, p_RouteID, p_DepartureTime, p_ArrivalTime, 'SCHEDULED');

    COMMIT;
END;


-- Hủy chuyến bay (Chuyển trạng thái, không DELETE trực tiếp)
CREATE OR REPLACE PROCEDURE SP_CANCEL_FLIGHT (
    p_FlightID IN NUMBER
) AS
BEGIN
    UPDATE FLIGHT 
    SET FlightStatus = 'CANCELLED' 
    WHERE FlightID = p_FlightID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20071, 'Lỗi: Không tìm thấy chuyến bay để hủy.');
    END IF;
    COMMIT;
END;


--Cập nhật lịch bay & Quản lý delay 
CREATE OR REPLACE PROCEDURE SP_DELAY_FLIGHT (
    p_FlightID IN NUMBER, p_NewDepartureTime IN DATE
) AS
    v_OldDepartureTime DATE;
BEGIN
    SELECT DepartureTime INTO v_OldDepartureTime FROM FLIGHT WHERE FlightID = p_FlightID;

    IF p_NewDepartureTime <= v_OldDepartureTime THEN
        RAISE_APPLICATION_ERROR(-20001, 'Giờ khởi hành mới phải muộn hơn giờ cũ.');
    END IF;

    UPDATE FLIGHT 
    SET DepartureTime = p_NewDepartureTime, 
        ArrivalTime = p_NewDepartureTime + (ArrivalTime - DepartureTime),
        FlightStatus = 'DELAYED'
    WHERE FlightID = p_FlightID;
    COMMIT;
END;



-- ================================= Bảng CUSTOMER  =================================

-- Thêm hồ sơ khách hàng mới
CREATE OR REPLACE PROCEDURE SP_ADD_CUSTOMER (
    p_AccountID IN NUMBER,
    p_FullName IN VARCHAR2,
    p_Gender IN VARCHAR2,
    p_DateOfBirth IN DATE,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Passport IN VARCHAR2,
    p_Nationality IN VARCHAR2
) AS
    v_CustomerID NUMBER;
BEGIN
    -- Tự động tăng ID
    SELECT NVL(MAX(CustomerID), 0) + 1 INTO v_CustomerID FROM CUSTOMER;

    INSERT INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality)
    VALUES (v_CustomerID, p_AccountID, p_FullName, p_Gender, p_DateOfBirth, p_Phone, p_Email, p_Passport, p_Nationality);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Đã thêm khách hàng mới thành công!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20021, 'Lỗi: AccountID, Email hoặc Passport đã tồn tại trong hệ thống.');
END;


-- Cập nhật thông tin liên lạc của khách hàng
CREATE OR REPLACE PROCEDURE SP_UPDATE_CUSTOMER_INFO (
    p_CustomerID IN NUMBER,
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


-- ================================= Bảng EMPLOYEE  =================================
--Thêm nhân viên mới
CREATE OR REPLACE PROCEDURE SP_ADD_EMPLOYEE (
    p_AccountID IN NUMBER,
    p_FullName IN VARCHAR2,
    p_Position IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
    v_EmployeeID NUMBER;
BEGIN
    SELECT NVL(MAX(EmployeeID), 0) + 1 INTO v_EmployeeID FROM EMPLOYEE;

    INSERT INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email)
    VALUES (v_EmployeeID, p_AccountID, p_FullName, p_Position, p_Phone, p_Email);

    COMMIT;
END;


--Cập nhật chức vụ và liên hệ của Nhân viên:
CREATE OR REPLACE PROCEDURE SP_UPDATE_EMPLOYEE (
    p_EmployeeID IN NUMBER,
    p_Position IN VARCHAR2,
    p_Phone IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    UPDATE EMPLOYEE
    SET Position = p_Position,
        Phone = p_Phone,
        Email = p_Email
    WHERE EmployeeID = p_EmployeeID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20053, 'Lỗi: Không tìm thấy Nhân viên cần cập nhật.');
    END IF;
    COMMIT;
END;


--Xóa Nhân viên (Xóa thông tin nhân viên khỏi hệ thống):
CREATE OR REPLACE PROCEDURE SP_DELETE_EMPLOYEE (
    p_EmployeeID IN NUMBER
) AS
BEGIN
    DELETE FROM EMPLOYEE WHERE EmployeeID = p_EmployeeID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20054, 'Lỗi: Không tìm thấy Nhân viên để xóa.');
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -2292 THEN
            RAISE_APPLICATION_ERROR(-20055, 'Lỗi: Nhân viên này đã từng xử lý giao dịch (Booking), không thể xóa hẳn để bảo lưu lịch sử kế toán.');
        ELSE
            RAISE;
        END IF;
END;


-- ================================= Bảng BOOKING =================================

--Đặt vé máy bay
CREATE OR REPLACE PROCEDURE SP_CREATE_BOOKING_TRANSACTION (
    p_CustomerID IN NUMBER, p_EmployeeID IN NUMBER, p_FlightID IN NUMBER, p_SeatID IN NUMBER
) AS
    v_BookingID NUMBER; v_Price NUMBER; v_SeatClass VARCHAR2(20);
BEGIN
    SELECT Class INTO v_SeatClass FROM SEAT WHERE SeatID = p_SeatID;
    SELECT Price INTO v_Price FROM SEATCLASSPRICE WHERE FlightID = p_FlightID AND Class = v_SeatClass;

    INSERT INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status)
    VALUES (p_CustomerID, p_EmployeeID, SYSDATE, 0, 'PENDING') RETURNING BookingID INTO v_BookingID;

    INSERT INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus)
    VALUES (v_BookingID, p_FlightID, p_SeatID, v_Price, 'BOOKED');

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Lỗi hệ thống: ' || SQLERRM);
END;


-- Hủy vé và hoàn tiền 
CREATE OR REPLACE PROCEDURE SP_CANCEL_BOOKING (
    p_BookingID IN NUMBER, p_CancelReason IN VARCHAR2
) AS
    v_Status VARCHAR2(50); v_CustomerID NUMBER; v_TotalAmount NUMBER;
BEGIN
    SELECT Status, CustomerID, TotalAmount INTO v_Status, v_CustomerID, v_TotalAmount 
    FROM BOOKING WHERE BookingID = p_BookingID;

    IF v_Status = 'CONFIRMED' THEN
        INSERT INTO TRANSACTION_HISTORY (CustomerID, BookingID, TransactionType, Amount, TransactionDate, Description)
        VALUES (v_CustomerID, p_BookingID, 'REFUND', v_TotalAmount, SYSDATE, 'Hoàn tiền do: ' || p_CancelReason);
    END IF;

    UPDATE BOOKING SET Status = 'CANCELLED' WHERE BookingID = p_BookingID;
    UPDATE TICKET SET TicketStatus = 'CANCELLED' WHERE BookingID = p_BookingID;
    COMMIT;
END;


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



-- ================================= Bảng TICKET  =================================

--Đổi chuyến bay / Đổi vé 
CREATE OR REPLACE PROCEDURE SP_CHANGE_FLIGHT_TICKET (
    p_TicketID IN NUMBER, p_NewFlightID IN NUMBER, p_NewSeatID IN NUMBER
) AS
    v_OldPrice NUMBER; v_NewPrice NUMBER; v_BookingID NUMBER;
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



-- ================================= Bảng SEAT  =================================

--Khởi tạo ghế tự động cho máy bay 
CREATE OR REPLACE PROCEDURE SP_GENERATE_SEATS (
    p_AircraftID IN NUMBER, p_BusinessSeats IN NUMBER
) AS
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



-- ================================= Bảng PAYMENT  =================================

--Xử lý thanh toán và xác nhận vé 
CREATE OR REPLACE PROCEDURE SP_PROCESS_PAYMENT (
    p_BookingID IN NUMBER, p_PaymentMethod IN VARCHAR2
) AS
    v_TotalAmount NUMBER; v_PaymentID NUMBER;
BEGIN
    SELECT TotalAmount INTO v_TotalAmount FROM BOOKING WHERE BookingID = p_BookingID AND Status = 'PENDING';

    INSERT INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus)
    VALUES (p_BookingID, SYSDATE, v_TotalAmount, p_PaymentMethod, 'SUCCESS') RETURNING PaymentID INTO v_PaymentID;

    UPDATE BOOKING SET Status = 'CONFIRMED' WHERE BookingID = p_BookingID;
    UPDATE TICKET SET TicketStatus = 'PAID' WHERE BookingID = p_BookingID;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK; DBMS_OUTPUT.PUT_LINE('Lỗi thanh toán: ' || SQLERRM);
END;


-- ================================= Bảng BAGGAGE  =================================

-- Mua thêm/đăng ký hành lý cho một vé cụ thể
CREATE OR REPLACE PROCEDURE SP_ADD_BAGGAGE (
    p_TicketID IN NUMBER,
    p_Weight IN NUMBER,
    p_BaggageType IN VARCHAR2
) AS
    v_BaggageID NUMBER;
    v_TicketStatus VARCHAR2(50);
BEGIN
    -- Kiểm tra vé có hợp lệ không
    SELECT TicketStatus INTO v_TicketStatus FROM TICKET WHERE TicketID = p_TicketID;
    
    IF v_TicketStatus = 'CANCELLED' THEN
        RAISE_APPLICATION_ERROR(-20025, 'Lỗi: Không thể thêm hành lý cho vé đã hủy.');
    END IF;

    SELECT NVL(MAX(BaggageID), 0) + 1 INTO v_BaggageID FROM BAGGAGE;

    INSERT INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType)
    VALUES (v_BaggageID, p_TicketID, p_Weight, p_BaggageType);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20026, 'Lỗi: Không tìm thấy mã vé này.');
END;


-- ================================= Bảng TRANSACTION_HISTORY =================================

CREATE OR REPLACE PROCEDURE SP_GET_DASHBOARD_REPORT (
    p_StartDate IN DATE,          -- Ngày bắt đầu lọc (VD: '01-OCT-2023')
    p_EndDate IN DATE,            -- Ngày kết thúc lọc (VD: '31-OCT-2023')
    p_AirlineID IN NUMBER,        -- ID hãng bay (Truyền NULL nếu muốn xem TẤT CẢ hãng)
    p_KPI_Data OUT SYS_REFCURSOR,       -- Trả về 4 thẻ chỉ số tổng quan
    p_RevenueTrend OUT SYS_REFCURSOR,   -- Trả về dữ liệu Biểu đồ đường (Theo tháng)
    p_ClassRevenue OUT SYS_REFCURSOR    -- Trả về dữ liệu Biểu đồ cột (Theo hạng ghế)
) AS
BEGIN
    -- ==============================================================================
    -- 1. TẬP KẾT QUẢ 1: 4 THẺ CHỈ SỐ TỔNG QUAN (KPIs)
    -- ==============================================================================
    OPEN p_KPI_Data FOR
        WITH FilteredFlights AS (
            -- Lọc các chuyến bay trong khoảng thời gian và theo Hãng (nếu có)
            SELECT FlightID, DepartureTime, FlightStatus
            FROM FLIGHT
            WHERE (p_AirlineID IS NULL OR AirlineID = p_AirlineID)
              AND DepartureTime BETWEEN p_StartDate AND p_EndDate
        )
        SELECT 
            -- Tổng doanh thu (Lấy từ vé đã thanh toán thuộc các chuyến bay hợp lệ)
            (SELECT NVL(SUM(t.Price), 0) 
             FROM TICKET t 
             JOIN FilteredFlights f ON t.FlightID = f.FlightID 
             WHERE t.TicketStatus = 'PAID') AS Total_Revenue,
             
            -- Tổng số đặt chỗ (Đếm số Booking không bị hủy có chứa vé của các chuyến này)
            (SELECT COUNT(DISTINCT t.BookingID) 
             FROM TICKET t 
             JOIN FilteredFlights f ON t.FlightID = f.FlightID 
             WHERE t.TicketStatus != 'CANCELLED') AS Total_Bookings,
             
            -- Tỷ lệ lấp đầy ghế (Sử dụng lại Function FUNC_GET_OCCUPANCY_RATE của bạn)
            (SELECT NVL(ROUND(AVG(FUNC_GET_OCCUPANCY_RATE(f.FlightID)), 2), 0) 
             FROM FilteredFlights f) AS Avg_Occupancy_Rate,
             
            -- Số chuyến bay hoàn thành (Giả sử bạn dùng status COMPLETED cho chuyến bay đã bay)
            (SELECT COUNT(FlightID) 
             FROM FilteredFlights 
             WHERE FlightStatus = 'COMPLETED') AS Completed_Flights
        FROM DUAL;

    -- ==============================================================================
    -- 2. TẬP KẾT QUẢ 2: BIỂU ĐỒ XU HƯỚNG DOANH THU (Theo tháng)
    -- ==============================================================================
    OPEN p_RevenueTrend FOR
        SELECT 
            TO_CHAR(f.DepartureTime, 'MM') AS Month_Number,
            TO_CHAR(f.DepartureTime, 'Mon') AS Month_Name,
            NVL(SUM(t.Price), 0) AS Monthly_Revenue
        FROM TICKET t
        JOIN FLIGHT f ON t.FlightID = f.FlightID
        WHERE (p_AirlineID IS NULL OR f.AirlineID = p_AirlineID)
          AND f.DepartureTime BETWEEN p_StartDate AND p_EndDate
          AND t.TicketStatus = 'PAID'
        GROUP BY TO_CHAR(f.DepartureTime, 'MM'), TO_CHAR(f.DepartureTime, 'Mon')
        ORDER BY Month_Number;

    -- ==============================================================================
    -- 3. TẬP KẾT QUẢ 3: BIỂU ĐỒ DOANH THU THEO HẠNG GHẾ
    -- ==============================================================================
    OPEN p_ClassRevenue FOR
        SELECT 
            s.Class AS Seat_Class,
            NVL(SUM(t.Price), 0) AS Revenue,
            COUNT(t.TicketID) AS Tickets_Sold
        FROM TICKET t
        JOIN FLIGHT f ON t.FlightID = f.FlightID
        JOIN SEAT s ON t.SeatID = s.SeatID
        WHERE (p_AirlineID IS NULL OR f.AirlineID = p_AirlineID)
          AND f.DepartureTime BETWEEN p_StartDate AND p_EndDate
          AND t.TicketStatus = 'PAID'
        GROUP BY s.Class
        ORDER BY Revenue DESC;

END SP_GET_DASHBOARD_REPORT;


-- ================================= Bảng SEATCLASSPRICE  =================================

-- Thêm giá vé ban đầu cho hạng ghế của chuyến bay
CREATE OR REPLACE PROCEDURE SP_ADD_SEAT_PRICE (
    p_FlightID IN NUMBER,
    p_Class IN VARCHAR2,
    p_Price IN NUMBER
) AS
    v_PriceID NUMBER;
BEGIN
    IF p_Price <= 0 THEN
        RAISE_APPLICATION_ERROR(-20073, 'Lỗi: Giá vé phải lớn hơn 0.');
    END IF;

    SELECT NVL(MAX(PriceID), 0) + 1 INTO v_PriceID FROM SEATCLASSPRICE;

    INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price)
    VALUES (v_PriceID, p_FlightID, UPPER(p_Class), p_Price);

    COMMIT;
END;


--Cập nhật giá vé hàng loạt khuyến mãi 
CREATE OR REPLACE PROCEDURE SP_APPLY_FLIGHT_DISCOUNT (
    p_FlightID IN NUMBER, p_DiscountPercent IN NUMBER
) AS
BEGIN
    IF p_DiscountPercent < 0 OR p_DiscountPercent > 100 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Phần trăm giảm giá phải từ 0 đến 100.');
    END IF;

    UPDATE SEATCLASSPRICE 
    SET Price = Price - (Price * p_DiscountPercent / 100)
    WHERE FlightID = p_FlightID;
    COMMIT;
END;


--Cập nhật giá vé thủ công cho một hạng ghế của một chuyến bay:
CREATE OR REPLACE PROCEDURE SP_UPDATE_SEAT_PRICE (
    p_FlightID IN NUMBER,
    p_Class IN VARCHAR2,
    p_NewPrice IN NUMBER
) AS
BEGIN
    IF p_NewPrice <= 0 THEN
        RAISE_APPLICATION_ERROR(-20033, 'Lỗi: Giá vé phải lớn hơn 0.');
    END IF;

    UPDATE SEATCLASSPRICE
    SET Price = p_NewPrice
    WHERE FlightID = p_FlightID AND Class = UPPER(p_Class);

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20034, 'Lỗi: Không tìm thấy chuyến bay hoặc hạng ghế này.');
    END IF;

    COMMIT;
END;


-- ================================= Bảng USER  =================================

-- Thêm người dùng mới
CREATE OR REPLACE PROCEDURE SP_ADD_USER (
    p_FullName IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
    v_UserID NUMBER;
BEGIN
    SELECT NVL(MAX(UserID), 0) + 1 INTO v_UserID FROM USERS;

    INSERT INTO USERS (UserID, FullName, Email, IsDeleted)
    VALUES (v_UserID, p_FullName, p_Email, 0);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20072, 'Lỗi: Email người dùng đã tồn tại.');
END;


-- Cập nhật thông tin người dùng
CREATE OR REPLACE PROCEDURE SP_UPDATE_USER (
    p_UserID IN NUMBER,
    p_FullName IN VARCHAR2,
    p_Email IN VARCHAR2
) AS
BEGIN
    UPDATE USERS
    SET FullName = p_FullName,
        Email = p_Email,
        Updated_At = SYSDATE
    WHERE UserID = p_UserID;

    COMMIT;
END;


-- Xóa mềm (Soft Delete) người dùng và tài khoản liên quan
CREATE OR REPLACE PROCEDURE SP_SOFT_DELETE_USER (
    p_UserID IN NUMBER
) AS
BEGIN
    -- Vô hiệu hóa User
    UPDATE USERS 
    SET IsDeleted = 1, Updated_At = SYSDATE 
    WHERE UserID = p_UserID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20027, 'Lỗi: Không tìm thấy UserID này.');
    END IF;

    -- Vô hiệu hóa Account liên kết với User đó
    UPDATE ACCOUNT 
    SET IsDeleted = 1, Status = 'DISABLED', Updated_At = SYSDATE 
    WHERE UserID = p_UserID;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Đã vô hiệu hóa tài khoản người dùng an toàn!');
END;


-- Phục hồi tài khoản đã xóa mềm
CREATE OR REPLACE PROCEDURE SP_RESTORE_USER (
    p_UserID IN NUMBER
) AS
BEGIN
    UPDATE USERS SET IsDeleted = 0, Updated_At = SYSDATE WHERE UserID = p_UserID;
    UPDATE ACCOUNT SET IsDeleted = 0, Status = 'ACTIVE', Updated_At = SYSDATE WHERE UserID = p_UserID;

    COMMIT;
END;


-- ================================= Bảng ACCOUNT   =================================

-- Thêm tài khoản mới (Gắn với một UserID đã tồn tại)
CREATE OR REPLACE PROCEDURE SP_ADD_ACCOUNT (
    p_UserID IN NUMBER,
    p_UserName IN VARCHAR2,
    p_Password IN VARCHAR2
) AS
    v_AccountID NUMBER;
BEGIN
    SELECT NVL(MAX(AccountID), 0) + 1 INTO v_AccountID FROM ACCOUNT;

    INSERT INTO ACCOUNT (AccountID, UserID, UserName, Password, Status)
    VALUES (v_AccountID, p_UserID, p_UserName, p_Password, 'ACTIVE');

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20061, 'Lỗi: Tên đăng nhập (UserName) đã tồn tại.');
END;


-- Đổi mật khẩu
CREATE OR REPLACE PROCEDURE SP_CHANGE_PASSWORD (
    p_AccountID IN NUMBER,
    p_NewPassword IN VARCHAR2
) AS
BEGIN
    UPDATE ACCOUNT 
    SET Password = p_NewPassword, 
        Updated_At = SYSDATE
    WHERE AccountID = p_AccountID;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20062, 'Lỗi: Không tìm thấy tài khoản để đổi mật khẩu.');
    END IF;
    COMMIT;
END;


-- ================================= Bảng FUNCTION   =================================
-- Thêm chức năng mới
CREATE OR REPLACE PROCEDURE SP_ADD_FUNCTION (
    p_NameFunction IN VARCHAR2
) AS
    v_FunctionID NUMBER;
BEGIN
    SELECT NVL(MAX(FunctionID), 0) + 1 INTO v_FunctionID FROM FUNCTION;

    INSERT INTO FUNCTION (FunctionID, NameFunction)
    VALUES (v_FunctionID, p_NameFunction);

    COMMIT;
END;


-- ================================= Bảng ROLE   =================================
-- Thiết lập quyền cho một chức năng
CREATE OR REPLACE PROCEDURE SP_ASSIGN_ROLE_PERMISSIONS (
    p_FunctionID IN NUMBER,
    p_AddPerm IN NUMBER,
    p_EditPerm IN NUMBER,
    p_DeletePerm IN NUMBER,
    p_DownloadPerm IN NUMBER,
    p_ViewPerm IN NUMBER
) AS
    v_RoleID NUMBER;
BEGIN
    -- Kiểm tra giá trị truyền vào chỉ được là 0 hoặc 1
    IF p_AddPerm NOT IN (0,1) OR p_EditPerm NOT IN (0,1) OR p_DeletePerm NOT IN (0,1) THEN
        RAISE_APPLICATION_ERROR(-20063, 'Lỗi: Giá trị phân quyền chỉ được là 0 (Không) hoặc 1 (Có).');
    END IF;

    SELECT NVL(MAX(RoleID), 0) + 1 INTO v_RoleID FROM ROLE;

    INSERT INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm)
    VALUES (v_RoleID, p_FunctionID, p_AddPerm, p_EditPerm, p_DeletePerm, p_DownloadPerm, p_ViewPerm);

    COMMIT;
END;


-- ================================= Bảng ROLE_GROUP   =================================
-- Thêm nhóm quyền mới
CREATE OR REPLACE PROCEDURE SP_ADD_ROLE_GROUP (
    p_NameRoleGroup IN VARCHAR2
) AS
    v_RoleGroupID NUMBER;
BEGIN
    SELECT NVL(MAX(RoleGroupID), 0) + 1 INTO v_RoleGroupID FROM ROLE_GROUP;

    INSERT INTO ROLE_GROUP (RoleGroupID, NameRoleGroup)
    VALUES (v_RoleGroupID, p_NameRoleGroup);

    COMMIT;
END;


-- Cập nhật tên nhóm quyền
CREATE OR REPLACE PROCEDURE SP_UPDATE_ROLE_GROUP (
    p_RoleGroupID IN NUMBER,
    p_NameRoleGroup IN VARCHAR2
) AS
BEGIN
    UPDATE ROLE_GROUP 
    SET NameRoleGroup = p_NameRoleGroup, 
        Updated_At = SYSDATE
    WHERE RoleGroupID = p_RoleGroupID AND IsDeleted = 0;

    COMMIT;
END;


-- ================================= Bảng ACCOUNT_ASSIGN_ROLE_GROUP   =================================
-- Gán Nhóm quyền cho Tài khoản (VD: Biến 1 tài khoản thành Quản trị viên)
CREATE OR REPLACE PROCEDURE SP_ASSIGN_GROUP_TO_ACCOUNT (
    p_AccountID IN NUMBER,
    p_RoleGroupID IN NUMBER
) AS
BEGIN
    INSERT INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID)
    VALUES (p_AccountID, p_RoleGroupID);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20074, 'Lỗi: Tài khoản này đã được gán nhóm quyền này rồi.');
END;


-- Gỡ Nhóm quyền khỏi Tài khoản
CREATE OR REPLACE PROCEDURE SP_REMOVE_GROUP_FROM_ACCOUNT (
    p_AccountID IN NUMBER,
    p_RoleGroupID IN NUMBER
) AS
BEGIN
    DELETE FROM ACCOUNT_ASSIGN_ROLE_GROUP 
    WHERE AccountID = p_AccountID AND RoleGroupID = p_RoleGroupID;

    COMMIT;
END;
