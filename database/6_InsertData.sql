/* =========================================================
   1. BẢNG DANH MỤC: AIRLINE, AIRPORT, AIRCRAFT, ROUTE
   ========================================================= */
-- Thêm 10 Hãng hàng không
INSERT ALL
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL01', 'Vietnam Airlines', 'Vietnam', '19001100', 'vn@vietnamairlines.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL02', 'VietJet Air', 'Vietnam', '19001886', 'vj@vietjetair.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL03', 'Bamboo Airways', 'Vietnam', '19001166', 'bb@bambooairways.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL04', 'Singapore Airlines', 'Singapore', '+6562238888', 'contact@singaporeair.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL05', 'Thai Airways', 'Thailand', '+6623561111', 'contact@thaiairways.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL06', 'Qatar Airways', 'Qatar', '+97440230000', 'support@qatar.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL07', 'Emirates', 'UAE', '+971600555555', 'support@emirates.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL08', 'Korean Air', 'South Korea', '+8215882001', 'info@koreanair.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL09', 'Japan Airlines', 'Japan', '+81367333062', 'info@jal.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL10', 'Air France', 'France', '+33969393654', 'contact@airfrance.com')
SELECT 1 FROM DUAL;

-- Thêm 10 Sân bay
INSERT ALL
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP01', 'Tan Son Nhat', 'Ho Chi Minh', 'Vietnam', 'SGN')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP02', 'Noi Bai', 'Hanoi', 'Vietnam', 'HAN')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP03', 'Da Nang', 'Da Nang', 'Vietnam', 'DAD')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP04', 'Phu Quoc', 'Phu Quoc', 'Vietnam', 'PQC')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP05', 'Changi', 'Singapore', 'Singapore', 'SIN')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP06', 'Suvarnabhumi', 'Bangkok', 'Thailand', 'BKK')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP07', 'Hamad', 'Doha', 'Qatar', 'DOH')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP08', 'Dubai Intl', 'Dubai', 'UAE', 'DXB')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP09', 'Incheon', 'Seoul', 'South Korea', 'ICN')
    INTO AIRPORT (AirportID, AirportName, City, Country, IATACode) VALUES ('AP10', 'Narita', 'Tokyo', 'Japan', 'NRT')
SELECT 1 FROM DUAL;

-- Thêm 10 Máy bay
INSERT ALL
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC01', 'AL01', 'Airbus A321', 180, 2018)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC02', 'AL02', 'Airbus A320', 160, 2020)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC03', 'AL03', 'Boeing 787', 250, 2021)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC04', 'AL04', 'Airbus A350', 300, 2019)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC05', 'AL05', 'Boeing 777', 350, 2017)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC06', 'AL01', 'Boeing 787-9', 290, 2022)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC07', 'AL02', 'Airbus A321neo', 200, 2021)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC08', 'AL06', 'Airbus A380', 500, 2018)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC09', 'AL08', 'Boeing 747-8', 410, 2016)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC10', 'AL09', 'Boeing 787-8', 240, 2020)
SELECT 1 FROM DUAL;

-- Thêm 10 Tuyến bay
INSERT ALL
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT01', 'AP01', 'AP02', 1150, 120)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT02', 'AP02', 'AP01', 1150, 120)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT03', 'AP01', 'AP03', 600, 80)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT04', 'AP01', 'AP04', 300, 50)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT05', 'AP01', 'AP05', 1100, 120)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT06', 'AP02', 'AP06', 1200, 130)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT07', 'AP01', 'AP09', 3600, 300)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT08', 'AP02', 'AP10', 3700, 310)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT09', 'AP01', 'AP08', 5600, 480)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT10', 'AP02', 'AP07', 5500, 470)
SELECT 1 FROM DUAL;


/* =========================================================
   2. BẢNG NGƯỜI DÙNG: USERS, ACCOUNT, CUSTOMER, EMPLOYEE
   ========================================================= */
-- Thêm 15 Users
INSERT ALL
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US01', 'Nguyen Khach A', 'khacha@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US02', 'Tran Khach B', 'khachb@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US03', 'Le Khach C', 'khachc@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US04', 'Pham Khach D', 'khachd@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US05', 'Hoang Khach E', 'khache@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US06', 'Vu Khach F', 'khachf@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US07', 'Dang Khach G', 'khachg@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US08', 'Bui Khach H', 'khachh@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US09', 'Do Khach I', 'khachi@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US10', 'Ly Khach K', 'khachk@gmail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US11', 'Admin He Thong', 'admin@airline.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US12', 'Nhan Vien Nam', 'nam.staff@airline.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US13', 'Nhan Vien Nu', 'nu.staff@airline.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US14', 'Quan Ly Chi Nhanh', 'manager1@airline.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US15', 'Quan Ly Truong', 'manager2@airline.com', 0)
SELECT 1 FROM DUAL;

-- Thêm 15 Accounts (Trạng thái đa dạng: ACTIVE, INACTIVE, LOCKED)
INSERT ALL
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC01', 'US01', 'khacha', 'pass1', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC02', 'US02', 'khachb', 'pass2', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC03', 'US03', 'khachc', 'pass3', 'LOCKED', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC04', 'US04', 'khachd', 'pass4', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC05', 'US05', 'khache', 'pass5', 'INACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC06', 'US06', 'khachf', 'pass6', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC07', 'US07', 'khachg', 'pass7', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC08', 'US08', 'khachh', 'pass8', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC09', 'US09', 'khachi', 'pass9', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC10', 'US10', 'khachk', 'pass10', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC11', 'US11', 'admin', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC12', 'US12', 'staffnam', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC13', 'US13', 'staffnu', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC14', 'US14', 'manager1', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC15', 'US15', 'manager2', 'pass', 'ACTIVE', 0)
SELECT 1 FROM DUAL;

-- Thêm 10 Customers (Khớp với Account 1-10)
INSERT ALL
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS01', 'ACC01', 'Nguyen Khach A', 'Male', DATE '1990-01-01', '090111', 'khacha@gmail.com', 'P001')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS02', 'ACC02', 'Tran Khach B', 'Female', DATE '1992-02-02', '090222', 'khachb@gmail.com', 'P002')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS03', 'ACC03', 'Le Khach C', 'Male', DATE '1985-03-03', '090333', 'khachc@gmail.com', 'P003')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS04', 'ACC04', 'Pham Khach D', 'Female', DATE '1998-04-04', '090444', 'khachd@gmail.com', 'P004')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS05', 'ACC05', 'Hoang Khach E', 'Male', DATE '2000-05-05', '090555', 'khache@gmail.com', 'P005')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS06', 'ACC06', 'Vu Khach F', 'Female', DATE '1988-06-06', '090666', 'khachf@gmail.com', 'P006')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS07', 'ACC07', 'Dang Khach G', 'Male', DATE '1995-07-07', '090777', 'khachg@gmail.com', 'P007')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS08', 'ACC08', 'Bui Khach H', 'Female', DATE '1993-08-08', '090888', 'khachh@gmail.com', 'P008')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS09', 'ACC09', 'Do Khach I', 'Male', DATE '1991-09-09', '090999', 'khachi@gmail.com', 'P009')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS10', 'ACC10', 'Ly Khach K', 'Other', DATE '1996-10-10', '091000', 'khachk@gmail.com', 'P010')
SELECT 1 FROM DUAL;

-- Thêm 5 Employees (Khớp với Account 11-15)
INSERT ALL
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP01', 'ACC11', 'Admin He Thong', 'System Admin', '099111', 'admin@airline.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP02', 'ACC12', 'Nhan Vien Nam', 'Ticketing Staff', '099222', 'nam.staff@airline.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP03', 'ACC13', 'Nhan Vien Nu', 'Ticketing Staff', '099333', 'nu.staff@airline.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP04', 'ACC14', 'Quan Ly Chi Nhanh', 'Branch Manager', '099444', 'manager1@airline.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP05', 'ACC15', 'Quan Ly Truong', 'General Manager', '099555', 'manager2@airline.com')
SELECT 1 FROM DUAL;


/* =========================================================
   3. BẢNG GIAO DỊCH: FLIGHT, SEAT, PRICE, BOOKING, TICKET
   ========================================================= */
-- Thêm 10 Chuyến bay 
INSERT ALL
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL01', 'VN101', 'AL01', 'AC01', 'RT01', SYSDATE - 2, SYSDATE - 2 + 2/24, '01', 'COMPLETED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL02', 'VN102', 'AL01', 'AC06', 'RT02', SYSDATE - 1, SYSDATE - 1 + 2/24, '02', 'LANDED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL03', 'VJ201', 'AL02', 'AC02', 'RT03', SYSDATE + 1, SYSDATE + 1 + 1.5/24, '03A', 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL04', 'VJ202', 'AL02', 'AC07', 'RT04', SYSDATE + 2, SYSDATE + 2 + 1/24, '04', 'DELAYED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL05', 'BB301', 'AL03', 'AC03', 'RT01', SYSDATE + 3, SYSDATE + 3 + 2/24, '05B', 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL06', 'BB302', 'AL03', 'AC03', 'RT05', SYSDATE + 4, SYSDATE + 4 + 2/24, '06', 'CANCELLED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL07', 'SQ401', 'AL04', 'AC04', 'RT05', SYSDATE + 5, SYSDATE + 5 + 2/24, '07', 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL08', 'TG501', 'AL05', 'AC05', 'RT06', SYSDATE + 6, SYSDATE + 6 + 2.5/24, '08', 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL09', 'KE601', 'AL08', 'AC09', 'RT07', SYSDATE + 7, SYSDATE + 7 + 5/24, '09', 'SCHEDULED')
    INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL10', 'JL701', 'AL09', 'AC10', 'RT08', SYSDATE + 8, SYSDATE + 8 + 5.5/24, '10', 'SCHEDULED')
SELECT 1 FROM DUAL;

-- Thêm Ghế
INSERT ALL
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST01', 'AC01', '1A', 'Business')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST02', 'AC01', '1B', 'Business')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST03', 'AC01', '10A', 'Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST04', 'AC01', '10B', 'Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST05', 'AC02', '1A', 'Premium Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST06', 'AC02', '2A', 'Premium Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST07', 'AC02', '15C', 'Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST08', 'AC02', '15D', 'Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST09', 'AC03', '1A', 'First Class')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST10', 'AC03', '1B', 'First Class')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST11', 'AC03', '20A', 'Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST12', 'AC04', '5A', 'Business')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST13', 'AC04', '30C', 'Economy')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST14', 'AC06', '2A', 'Business')
    INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES ('ST15', 'AC06', '12B', 'Economy')
SELECT 1 FROM DUAL;

-- Bảng giá
INSERT ALL
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP01', 'FL01', 'Business', 4000000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP02', 'FL01', 'Economy', 1500000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP03', 'FL02', 'Business', 4200000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP04', 'FL02', 'Economy', 1600000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP05', 'FL03', 'Premium Economy', 2000000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP06', 'FL03', 'Economy', 1200000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP07', 'FL05', 'First Class', 8000000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP08', 'FL05', 'Economy', 1400000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP09', 'FL07', 'Business', 6000000)
    INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('SCP10', 'FL07', 'Economy', 2500000)
SELECT 1 FROM DUAL;

-- Thêm Hành khách
INSERT ALL
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA01', 'Nguyen Khach A', 'Male', DATE '1990-01-01', 'P001')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA02', 'Tran Khach B', 'Female', DATE '1992-02-02', 'P002')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA03', 'Le Khach C', 'Male', DATE '1985-03-03', 'P003')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA04', 'Pham Khach D', 'Female', DATE '1998-04-04', 'P004')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA05', 'Hoang Khach E', 'Male', DATE '2000-05-05', 'P005')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA06', 'Vu Khach F', 'Female', DATE '1988-06-06', 'P006')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA07', 'Dang Khach G', 'Male', DATE '1995-07-07', 'P007')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA08', 'Bui Khach H', 'Female', DATE '1993-08-08', 'P008')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA09', 'Do Khach I', 'Male', DATE '1991-09-09', 'P009')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA10', 'Ly Khach K', 'Other', DATE '1996-10-10', 'P010')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA11', 'Nguyen Con Nho', 'Male', DATE '2015-01-01', 'P001_KID')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA12', 'Tran Con Nho', 'Female', DATE '2018-05-05', 'P002_KID')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA13', 'Le Vo C', 'Female', DATE '1987-03-03', 'P003_WIFE')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA14', 'Pham Chong D', 'Male', DATE '1995-04-04', 'P004_HUSBAND')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA15', 'Hoang Ban E', 'Male', DATE '1999-05-05', 'P005_FRIEND')
SELECT 1 FROM DUAL;

-- Thêm Booking
INSERT ALL
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK01', 'CUS01', 'EMP02', SYSDATE - 10, 5500000, 'COMPLETED')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK02', 'CUS02', 'EMP02', SYSDATE - 9, 5800000, 'COMPLETED')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK03', 'CUS03', 'EMP03', SYSDATE - 8, 4000000, 'CONFIRMED')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK04', 'CUS04', 'EMP03', SYSDATE - 7, 2400000, 'PENDING')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK05', 'CUS05', 'EMP02', SYSDATE - 6, 8000000, 'CONFIRMED')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK06', 'CUS06', 'EMP02', SYSDATE - 5, 8000000, 'CANCELLED')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK07', 'CUS07', 'EMP03', SYSDATE - 4, 6000000, 'CONFIRMED')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK08', 'CUS08', 'EMP03', SYSDATE - 3, 2500000, 'CONFIRMED')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK09', 'CUS09', 'EMP02', SYSDATE - 2, 1500000, 'PENDING')
    INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK10', 'CUS10', 'EMP02', SYSDATE - 1, 1600000, 'CANCELLED')
SELECT 1 FROM DUAL;

-- Thêm Vé (In hoa TicketStatus)
INSERT ALL
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK01', 'BK01', 'FL01', 'ST01', 'PA01', 4000000, 'CHECKED-IN')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK02', 'BK01', 'FL01', 'ST03', 'PA11', 1500000, 'CHECKED-IN')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK03', 'BK02', 'FL02', 'ST14', 'PA02', 4200000, 'CHECKED-IN')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK04', 'BK02', 'FL02', 'ST15', 'PA12', 1600000, 'CHECKED-IN')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK05', 'BK03', 'FL03', 'ST05', 'PA03', 2000000, 'PAID')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK06', 'BK03', 'FL03', 'ST06', 'PA13', 2000000, 'PAID')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK07', 'BK04', 'FL03', 'ST07', 'PA04', 1200000, 'BOOKED')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK08', 'BK04', 'FL03', 'ST08', 'PA14', 1200000, 'BOOKED')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK09', 'BK05', 'FL05', 'ST09', 'PA05', 8000000, 'PAID')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK10', 'BK06', 'FL05', 'ST10', 'PA06', 8000000, 'CANCELLED')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK11', 'BK07', 'FL07', 'ST12', 'PA07', 6000000, 'PAID')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK12', 'BK08', 'FL07', 'ST13', 'PA08', 2500000, 'PAID')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK13', 'BK09', 'FL01', 'ST04', 'PA09', 1500000, 'BOOKED')
    INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK14', 'BK10', 'FL02', 'ST08', 'PA10', 1600000, 'CANCELLED')
SELECT 1 FROM DUAL;

-- Thêm Thanh toán
INSERT ALL
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM01', 'BK01', SYSDATE - 10, 5500000, 'CREDIT CARD', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM02', 'BK02', SYSDATE - 9, 5800000, 'BANK TRANSFER', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM03', 'BK03', SYSDATE - 8, 4000000, 'MOMO', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM04', 'BK04', SYSDATE - 7, 2400000, 'CREDIT CARD', 'PENDING')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM05', 'BK05', SYSDATE - 6, 8000000, 'BANK TRANSFER', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM06', 'BK06', SYSDATE - 5, 8000000, 'CREDIT CARD', 'REFUNDED')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM07', 'BK07', SYSDATE - 4, 6000000, 'MOMO', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM08', 'BK08', SYSDATE - 3, 2500000, 'CREDIT CARD', 'SUCCESS')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM09', 'BK09', SYSDATE - 2, 1500000, 'BANK TRANSFER', 'PENDING')
    INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PM10', 'BK10', SYSDATE - 1, 1600000, 'MOMO', 'FAILED')
SELECT 1 FROM DUAL;

-- Thêm Hành lý
INSERT ALL
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG01', 'TK01', 7, 'Carry-on')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG02', 'TK01', 30, 'Checked')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG03', 'TK02', 7, 'Carry-on')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG04', 'TK03', 20, 'Fragile')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG05', 'TK05', 40, 'Oversized')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG06', 'TK07', 15, 'Checked')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG07', 'TK09', 45, 'Checked')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG08', 'TK11', 7, 'Carry-on')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG09', 'TK11', 20, 'Checked')
    INTO BAGGAGE (BaggageID, TicketID, Weight, BaggageType) VALUES ('BG10', 'TK12', 10, 'Checked')
SELECT 1 FROM DUAL;

-- Thêm Lịch sử Giao dịch
INSERT ALL
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH01', 'CUS01', 'BK01', 'PM01', 'PAYMENT', 5500000, SYSDATE - 10, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH02', 'CUS02', 'BK02', 'PM02', 'PAYMENT', 5800000, SYSDATE - 9, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH03', 'CUS03', 'BK03', 'PM03', 'PAYMENT', 4000000, SYSDATE - 8, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH04', 'CUS05', 'BK05', 'PM05', 'PAYMENT', 8000000, SYSDATE - 6, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH05', 'CUS06', 'BK06', 'PM06', 'REFUND', 8000000, SYSDATE - 4, 'Hoan tien do huy chuyen')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH06', 'CUS07', 'BK07', 'PM07', 'PAYMENT', 6000000, SYSDATE - 4, 'Thanh toan ve')
    INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH07', 'CUS08', 'BK08', 'PM08', 'PAYMENT', 2500000, SYSDATE - 3, 'Thanh toan ve')
SELECT 1 FROM DUAL;


/* =========================================================
   4. BẢNG PHÂN QUYỀN (Auth & Roles)
   ========================================================= */
-- 1. Thêm Chức năng
INSERT ALL
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN01', 'DASHBOARD', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN02', 'BOOKING_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN03', 'FLIGHT_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN04', 'CUSTOMER_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN05', 'SYSTEM_MANAGEMENT', 0)
SELECT 1 FROM DUAL;

-- 2. Thêm Quyền thao tác
INSERT ALL
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL01', 'FN01', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL02', 'FN02', 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL03', 'FN03', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL04', 'FN02', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL05', 'FN03', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL06', 'FN05', 1, 1, 1, 1, 1, 0)
SELECT 1 FROM DUAL;

-- 3. Thêm Nhóm quyền
INSERT ALL
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES ('RG01', 'CUSTOMER_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES ('RG02', 'STAFF_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES ('RG03', 'MANAGER_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES ('RG04', 'ADMIN_GROUP', 0)
SELECT 1 FROM DUAL;

-- 4. Gán Quyền vào Nhóm quyền
INSERT ALL
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL01', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG02', 'RL02', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG02', 'RL03', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG03', 'RL04', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG03', 'RL05', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG04', 'RL06', 0)
SELECT 1 FROM DUAL;

-- 5. Gán Nhóm quyền cho các Tài khoản
INSERT ALL
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC01', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC02', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC03', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC04', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC05', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC06', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC07', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC08', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC09', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC10', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC11', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC12', 'RG02', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC13', 'RG02', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC14', 'RG03', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC15', 'RG03', 0)
SELECT 1 FROM DUAL;

-- 6. Gán quyền đặc biệt lẻ tẻ 
INSERT ALL
    INTO ACCOUNT_ASSIGN_ROLE (AccountID, RoleID, IsDeleted) VALUES ('ACC11', 'RL01', 0)
SELECT 1 FROM DUAL;
