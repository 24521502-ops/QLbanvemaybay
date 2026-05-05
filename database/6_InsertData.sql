/* =========================================================
   1. BẢNG DANH MỤC: AIRLINE, AIRPORT, AIRCRAFT, ROUTE
   ========================================================= */

-- Thêm 10 Hãng hàng không
INSERT ALL
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (1, 'Vietnam Airlines', 'Vietnam', '19001100', 'vn@vietnamairlines.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (2, 'VietJet Air', 'Vietnam', '19001886', 'vj@vietjetair.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (3, 'Bamboo Airways', 'Vietnam', '19001166', 'bb@bambooairways.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (4, 'Singapore Airlines', 'Singapore', '+6562238888', 'contact@singaporeair.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (5, 'Thai Airways', 'Thailand', '+6623561111', 'contact@thaiairways.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (6, 'Qatar Airways', 'Qatar', '+97440230000', 'support@qatar.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (7, 'Emirates', 'UAE', '+971600555555', 'support@emirates.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (8, 'Korean Air', 'South Korea', '+8215882001', 'info@koreanair.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (9, 'Japan Airlines', 'Japan', '+81367333062', 'info@jal.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES (10, 'Air France', 'France', '+33969393654', 'contact@airfrance.com')
SELECT 1 FROM DUAL;

-- Thêm 10 Sân bay
INSERT ALL
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (1, 'Tan Son Nhat', 'Ho Chi Minh', 'Vietnam', 'SGN')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (2, 'Noi Bai', 'Hanoi', 'Vietnam', 'HAN')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (3, 'Da Nang', 'Da Nang', 'Vietnam', 'DAD')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (4, 'Phu Quoc', 'Phu Quoc', 'Vietnam', 'PQC')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (5, 'Changi', 'Singapore', 'Singapore', 'SIN')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (6, 'Suvarnabhumi', 'Bangkok', 'Thailand', 'BKK')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (7, 'Hamad', 'Doha', 'Qatar', 'DOH')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (8, 'Dubai Intl', 'Dubai', 'UAE', 'DXB')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (9, 'Incheon', 'Seoul', 'South Korea', 'ICN')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES (10, 'Narita', 'Tokyo', 'Japan', 'NRT')
SELECT 1 FROM DUAL;

-- Thêm 10 Máy bay
INSERT ALL
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (1, 1, 'Airbus A321', 180, 2018)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (2, 2, 'Airbus A320', 160, 2020)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (3, 3, 'Boeing 787', 250, 2021)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (4, 4, 'Airbus A350', 300, 2019)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (5, 5, 'Boeing 777', 350, 2017)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (6, 1, 'Boeing 787-9', 290, 2022)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (7, 2, 'Airbus A321neo', 200, 2021)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (8, 6, 'Airbus A380', 500, 2018)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (9, 8, 'Boeing 747-8', 410, 2016)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (10, 9, 'Boeing 787-8', 240, 2020)
SELECT 1 FROM DUAL;

-- Thêm 10 Tuyến bay
INSERT ALL
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 1, 2, 1150, 120) -- SGN-HAN
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (2, 2, 1, 1150, 120) -- HAN-SGN
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (3, 1, 3, 600, 80)   -- SGN-DAD
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (4, 1, 4, 300, 50)   -- SGN-PQC
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (5, 1, 5, 1100, 120) -- SGN-SIN
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (6, 2, 6, 1200, 130) -- HAN-BKK
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (7, 1, 9, 3600, 300) -- SGN-ICN
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (8, 2, 10, 3700, 310) -- HAN-NRT
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (9, 1, 8, 5600, 480) -- SGN-DXB
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (10, 2, 7, 5500, 470) -- HAN-DOH
SELECT 1 FROM DUAL;


/* =========================================================
   2. BẢNG NGƯỜI DÙNG: USERS, ACCOUNT, CUSTOMER, EMPLOYEE
   ========================================================= */

-- Thêm 15 Users
INSERT ALL
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (1, 'Nguyen Khach A', 'khacha@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (2, 'Tran Khach B', 'khachb@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (3, 'Le Khach C', 'khachc@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (4, 'Pham Khach D', 'khachd@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (5, 'Hoang Khach E', 'khache@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (6, 'Vu Khach F', 'khachf@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (7, 'Dang Khach G', 'khachg@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (8, 'Bui Khach H', 'khachh@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (9, 'Do Khach I', 'khachi@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (10, 'Ly Khach K', 'khachk@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (11, 'Admin He Thong', 'admin@airline.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (12, 'Nhan Vien Nam', 'nam.staff@airline.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (13, 'Nhan Vien Nu', 'nu.staff@airline.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (14, 'Quan Ly Chi Nhanh', 'manager1@airline.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES (15, 'Quan Ly Truong', 'manager2@airline.com', 0)
SELECT 1 FROM DUAL;

-- Thêm 15 Accounts (Trạng thái đa dạng: ACTIVE, INACTIVE, LOCKED)
INSERT ALL
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (1, 1, 'khacha', 'pass1', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (2, 2, 'khachb', 'pass2', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (3, 3, 'khachc', 'pass3', 'LOCKED', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (4, 4, 'khachd', 'pass4', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (5, 5, 'khache', 'pass5', 'INACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (6, 6, 'khachf', 'pass6', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (7, 7, 'khachg', 'pass7', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (8, 8, 'khachh', 'pass8', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (9, 9, 'khachi', 'pass9', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (10, 10, 'khachk', 'pass10', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (11, 11, 'admin', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (12, 12, 'staffnam', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (13, 13, 'staffnu', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (14, 14, 'manager1', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES (15, 15, 'manager2', 'pass', 'ACTIVE', 0)
SELECT 1 FROM DUAL;

-- Thêm 10 Customers (Khớp với Account 1-10)
INSERT ALL
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (1, 1, 'Nguyen Khach A', 'Male', DATE '1990-01-01', '090111', 'khacha@gmail.com', 'P001')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (2, 2, 'Tran Khach B', 'Female', DATE '1992-02-02', '090222', 'khachb@gmail.com', 'P002')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (3, 3, 'Le Khach C', 'Male', DATE '1985-03-03', '090333', 'khachc@gmail.com', 'P003')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (4, 4, 'Pham Khach D', 'Female', DATE '1998-04-04', '090444', 'khachd@gmail.com', 'P004')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (5, 5, 'Hoang Khach E', 'Male', DATE '2000-05-05', '090555', 'khache@gmail.com', 'P005')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (6, 6, 'Vu Khach F', 'Female', DATE '1988-06-06', '090666', 'khachf@gmail.com', 'P006')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (7, 7, 'Dang Khach G', 'Male', DATE '1995-07-07', '090777', 'khachg@gmail.com', 'P007')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (8, 8, 'Bui Khach H', 'Female', DATE '1993-08-08', '090888', 'khachh@gmail.com', 'P008')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (9, 9, 'Do Khach I', 'Male', DATE '1991-09-09', '090999', 'khachi@gmail.com', 'P009')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES (10, 10, 'Ly Khach K', 'Other', DATE '1996-10-10', '091000', 'khachk@gmail.com', 'P010')
SELECT 1 FROM DUAL;

-- Thêm 5 Employees (Khớp với Account 11-15)
INSERT ALL
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES (1, 11, 'Admin He Thong', 'System Admin', '099111', 'admin@airline.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES (2, 12, 'Nhan Vien Nam', 'Ticketing Staff', '099222', 'nam.staff@airline.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES (3, 13, 'Nhan Vien Nu', 'Ticketing Staff', '099333', 'nu.staff@airline.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES (4, 14, 'Quan Ly Chi Nhanh', 'Branch Manager', '099444', 'manager1@airline.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES (5, 15, 'Quan Ly Truong', 'General Manager', '099555', 'manager2@airline.com')
SELECT 1 FROM DUAL;


/* =========================================================
   3. BẢNG GIAO DỊCH: FLIGHT, SEAT, PRICE, BOOKING, TICKET
   ========================================================= */

-- Thêm 10 Chuyến bay (Đủ các trạng thái)
INSERT ALL
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (1, 'VN101', 1, 1, 1, SYSDATE - 2, SYSDATE - 2 + 2/24, 'COMPLETED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (2, 'VN102', 1, 6, 2, SYSDATE - 1, SYSDATE - 1 + 2/24, 'LANDED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (3, 'VJ201', 2, 2, 3, SYSDATE + 1, SYSDATE + 1 + 1.5/24, 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (4, 'VJ202', 2, 7, 4, SYSDATE + 2, SYSDATE + 2 + 1/24, 'DELAYED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (5, 'BB301', 3, 3, 1, SYSDATE + 3, SYSDATE + 3 + 2/24, 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (6, 'BB302', 3, 3, 5, SYSDATE + 4, SYSDATE + 4 + 2/24, 'CANCELLED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (7, 'SQ401', 4, 4, 5, SYSDATE + 5, SYSDATE + 5 + 2/24, 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (8, 'TG501', 5, 5, 6, SYSDATE + 6, SYSDATE + 6 + 2.5/24, 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (9, 'KE601', 8, 9, 7, SYSDATE + 7, SYSDATE + 7 + 5/24, 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES (10, 'JL701', 9, 10, 8, SYSDATE + 8, SYSDATE + 8 + 5.5/24, 'SCHEDULED')
SELECT 1 FROM DUAL;

-- Thêm ~20 Ghế (Cho các máy bay 1, 2, 3, 4, 6)
INSERT ALL
    -- Máy bay 1 (A321)
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (1, 1, '1A', 'Business')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (2, 1, '1B', 'Business')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (3, 1, '10A', 'Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (4, 1, '10B', 'Economy')
    -- Máy bay 2 (A320)
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (5, 2, '1A', 'Premium Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (6, 2, '2A', 'Premium Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (7, 2, '15C', 'Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (8, 2, '15D', 'Economy')
    -- Máy bay 3 (B787)
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (9, 3, '1A', 'First Class')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (10, 3, '1B', 'First Class')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (11, 3, '20A', 'Economy')
    -- Máy bay 4 (A350)
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (12, 4, '5A', 'Business')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (13, 4, '30C', 'Economy')
    -- Máy bay 6 (B787-9)
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (14, 6, '2A', 'Business')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (15, 6, '12B', 'Economy')
SELECT 1 FROM DUAL;

-- Bảng giá (Khớp theo Flight và Hạng ghế)
INSERT ALL
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (1, 1, 'Business', 4000000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (2, 1, 'Economy', 1500000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (3, 2, 'Business', 4200000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (4, 2, 'Economy', 1600000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (5, 3, 'Premium Economy', 2000000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (6, 3, 'Economy', 1200000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (7, 5, 'First Class', 8000000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (8, 5, 'Economy', 1400000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (9, 7, 'Business', 6000000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (10, 7, 'Economy', 2500000)
SELECT 1 FROM DUAL;

-- Thêm 15 Hành khách (Gồm Khách hàng tự đi, và người thân/trẻ em)
INSERT ALL
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (1, 'Nguyen Khach A', 'Male', DATE '1990-01-01', 'P001')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (2, 'Tran Khach B', 'Female', DATE '1992-02-02', 'P002')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (3, 'Le Khach C', 'Male', DATE '1985-03-03', 'P003')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (4, 'Pham Khach D', 'Female', DATE '1998-04-04', 'P004')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (5, 'Hoang Khach E', 'Male', DATE '2000-05-05', 'P005')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (6, 'Vu Khach F', 'Female', DATE '1988-06-06', 'P006')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (7, 'Dang Khach G', 'Male', DATE '1995-07-07', 'P007')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (8, 'Bui Khach H', 'Female', DATE '1993-08-08', 'P008')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (9, 'Do Khach I', 'Male', DATE '1991-09-09', 'P009')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (10, 'Ly Khach K', 'Other', DATE '1996-10-10', 'P010')
    -- Người thân đi kèm
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (11, 'Nguyen Con Nho', 'Male', DATE '2015-01-01', 'P001_KID')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (12, 'Tran Con Nho', 'Female', DATE '2018-05-05', 'P002_KID')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (13, 'Le Vo C', 'Female', DATE '1987-03-03', 'P003_WIFE')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (14, 'Pham Chong D', 'Male', DATE '1995-04-04', 'P004_HUSBAND')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES (15, 'Hoang Ban E', 'Male', DATE '1999-05-05', 'P005_FRIEND')
SELECT 1 FROM DUAL;

-- Thêm 10 Booking (Khớp TotalAmount với giá vé bên dưới)
INSERT ALL
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (1, 1, 2, SYSDATE - 10, 5500000, 'COMPLETED') -- 1 Bus(4M) + 1 Eco(1.5M) Flight 1
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (2, 2, 2, SYSDATE - 9, 5800000, 'COMPLETED') -- 1 Bus(4.2M) + 1 Eco(1.6M) Flight 2
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (3, 3, 3, SYSDATE - 8, 4000000, 'CONFIRMED') -- 2 PremEco(2M) Flight 3
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (4, 4, 3, SYSDATE - 7, 2400000, 'PENDING')   -- 2 Eco(1.2M) Flight 3
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (5, 5, 2, SYSDATE - 6, 8000000, 'CONFIRMED') -- 1 First(8M) Flight 5
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (6, 6, 2, SYSDATE - 5, 8000000, 'CANCELLED') -- Bị hủy, 1 First(8M) Flight 5
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (7, 7, 3, SYSDATE - 4, 6000000, 'CONFIRMED') -- 1 Bus(6M) Flight 7
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (8, 8, 3, SYSDATE - 3, 2500000, 'CONFIRMED') -- 1 Eco(2.5M) Flight 7
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (9, 9, 2, SYSDATE - 2, 1500000, 'PENDING')   -- 1 Eco(1.5M) Flight 1 (mua muộn)
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (10, 10, 2, SYSDATE - 1, 1600000, 'CANCELLED') -- Bị hủy
SELECT 1 FROM DUAL;

-- Thêm 15 Vé (Match BookingID, FlightID, SeatID và TicketStatus chính xác)
INSERT ALL
    -- Booking 1 (Đã bay -> Checked-in)
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (1, 1, 1, 1, 1, 4000000, 'Checked-in')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (2, 1, 1, 3, 11, 1500000, 'Checked-in')
    -- Booking 2 (Đã bay -> Checked-in)
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (3, 2, 2, 14, 2, 4200000, 'Checked-in')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (4, 2, 2, 15, 12, 1600000, 'Checked-in')
    -- Booking 3 (Sắp bay -> Paid)
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (5, 3, 3, 5, 3, 2000000, 'Paid')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (6, 3, 3, 6, 13, 2000000, 'Paid')
    -- Booking 4 (Chờ thanh toán -> Booked)
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (7, 4, 3, 7, 4, 1200000, 'Booked')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (8, 4, 3, 8, 14, 1200000, 'Booked')
    -- Booking 5, 6 (Flight 5 - First Class)
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (9, 5, 5, 9, 5, 8000000, 'Paid')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (10, 6, 5, 10, 6, 8000000, 'Cancelled') -- Hủy
    -- Booking 7, 8 (Flight 7)
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (11, 7, 7, 12, 7, 6000000, 'Paid')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (12, 8, 7, 13, 8, 2500000, 'Paid')
    -- Booking 9, 10
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (13, 9, 1, 4, 9, 1500000, 'Booked')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (14, 10, 2, 8, 10, 1600000, 'Cancelled')
SELECT 1 FROM DUAL;

-- Thêm 10 Thanh toán (Khớp Amount với TotalAmount của Booking)
INSERT ALL
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (1, 1, SYSDATE - 10, 5500000, 'CREDIT CARD', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (2, 2, SYSDATE - 9, 5800000, 'BANK TRANSFER', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (3, 3, SYSDATE - 8, 4000000, 'MOMO', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (4, 4, SYSDATE - 7, 2400000, 'CREDIT CARD', 'PENDING')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (5, 5, SYSDATE - 6, 8000000, 'BANK TRANSFER', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (6, 6, SYSDATE - 5, 8000000, 'CREDIT CARD', 'REFUNDED') -- Booking hủy -> Hoàn tiền
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (7, 7, SYSDATE - 4, 6000000, 'MOMO', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (8, 8, SYSDATE - 3, 2500000, 'CREDIT CARD', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (9, 9, SYSDATE - 2, 1500000, 'BANK TRANSFER', 'PENDING')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (10, 10, SYSDATE - 1, 1600000, 'MOMO', 'FAILED') -- Lỗi thanh toán dẫn đến Booking bị hủy
SELECT 1 FROM DUAL;

-- Thêm 10 Hành lý (Cho 10 vé ngẫu nhiên)
INSERT ALL
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (1, 1, 7, 'Carry-on')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (2, 1, 30, 'Checked')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (3, 2, 7, 'Carry-on')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (4, 3, 20, 'Fragile')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (5, 5, 40, 'Oversized')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (6, 7, 15, 'Checked')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (7, 9, 45, 'Checked')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (8, 11, 7, 'Carry-on')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (9, 11, 20, 'Checked')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES (10, 12, 10, 'Checked')
SELECT 1 FROM DUAL;

-- Thêm 10 Lịch sử Giao dịch
INSERT ALL
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES (1, 1, 1, 1, 'PAYMENT', 5500000, SYSDATE - 10, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES (2, 2, 2, 2, 'PAYMENT', 5800000, SYSDATE - 9, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES (3, 3, 3, 3, 'PAYMENT', 4000000, SYSDATE - 8, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES (4, 5, 5, 5, 'PAYMENT', 8000000, SYSDATE - 6, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES (5, 6, 6, 6, 'REFUND', 8000000, SYSDATE - 4, 'Hoan tien do huy chuyen')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES (6, 7, 7, 7, 'PAYMENT', 6000000, SYSDATE - 4, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES (7, 8, 8, 8, 'PAYMENT', 2500000, SYSDATE - 3, 'Thanh toan ve')
SELECT 1 FROM DUAL;

/* =========================================================
   4. BẢNG PHÂN QUYỀN (Auth & Roles)
   ========================================================= */

-- 1. Thêm 5 Chức năng (Function) của hệ thống
INSERT ALL
    INTO FUNCTION (FunctionID, NameFunction, IsDeleted) VALUES (1, 'DASHBOARD', 0)
    INTO FUNCTION (FunctionID, NameFunction, IsDeleted) VALUES (2, 'BOOKING_MANAGEMENT', 0)
    INTO FUNCTION (FunctionID, NameFunction, IsDeleted) VALUES (3, 'FLIGHT_MANAGEMENT', 0)
    INTO FUNCTION (FunctionID, NameFunction, IsDeleted) VALUES (4, 'CUSTOMER_MANAGEMENT', 0)
    INTO FUNCTION (FunctionID, NameFunction, IsDeleted) VALUES (5, 'SYSTEM_MANAGEMENT', 0)
SELECT 1 FROM DUAL;

-- 2. Thêm 6 Quyền thao tác chi tiết (Role)
INSERT ALL
    -- Quyền cho Khách hàng (Chỉ xem Dashboard)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (1, 1, 0, 0, 0, 0, 1, 0)
    -- Quyền cho Nhân viên bán vé (Thêm/Sửa/Xem Booking, Xem Flight)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (2, 2, 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (3, 3, 0, 0, 0, 0, 1, 0)
    -- Quyền cho Quản lý (Toàn quyền Booking, Flight, Customer)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (4, 2, 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (5, 3, 1, 1, 1, 1, 1, 0)
    -- Quyền cho Admin (Toàn quyền Hệ thống)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (6, 5, 1, 1, 1, 1, 1, 0)
SELECT 1 FROM DUAL;

-- 3. Thêm 4 Nhóm quyền (Role Group)
INSERT ALL
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES (1, 'CUSTOMER_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES (2, 'STAFF_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES (3, 'MANAGER_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES (4, 'ADMIN_GROUP', 0)
SELECT 1 FROM DUAL;

-- 4. Gán Quyền vào Nhóm quyền (Role Group Assign Role)
INSERT ALL
    -- Nhóm Khách hàng có quyền 1
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (1, 1, 0)
    -- Nhóm Staff có quyền 2, 3
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (2, 2, 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (2, 3, 0)
    -- Nhóm Manager có quyền 4, 5
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (3, 4, 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (3, 5, 0)
    -- Nhóm Admin có quyền 6
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (4, 6, 0)
SELECT 1 FROM DUAL;

-- 5. Gán Nhóm quyền cho các Tài khoản (Account Assign Role Group)
INSERT ALL
    -- 10 Khách hàng (Account 1 đến 10) vào nhóm Khách
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (1, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (2, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (3, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (4, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (5, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (6, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (7, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (8, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (9, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (10, 1, 0)
    -- Admin Hệ Thống (Account 11) vào nhóm Admin
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (11, 4, 0)
    -- Nhân viên (Account 12, 13) vào nhóm Staff
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (12, 2, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (13, 2, 0)
    -- Quản lý (Account 14, 15) vào nhóm Manager
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (14, 3, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (15, 3, 0)
SELECT 1 FROM DUAL;

-- 6. Gán quyền đặc biệt lẻ tẻ (Account Assign Role) - VD: Admin được quyền xem cả Dashboard của khách
INSERT ALL
    INTO ACCOUNT_ASSIGN_ROLE (AccountID, RoleID, IsDeleted) VALUES (11, 1, 0)
SELECT 1 FROM DUAL;
