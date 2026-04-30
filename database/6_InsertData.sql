/* =========================================================
   1. BẢNG DANH MỤC: AIRLINE, AIRPORT, AIRCRAFT, ROUTE
   ========================================================= */

-- Thêm 15 hãng hàng không
INSERT ALL
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Vietnam Airlines', 'Vietnam', '19001100', 'contact@vietnamairlines.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('VietJet Air', 'Vietnam', '19001886', 'info@vietjetair.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Bamboo Airways', 'Vietnam', '19001166', '19001166@bambooairways.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Pacific Airlines', 'Vietnam', '19001550', 'callcenter@pacificairlines.vn')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Vietravel Airlines', 'Vietnam', '19006686', 'customercare@vietravelairlines.vn')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Singapore Airlines', 'Singapore', '+6562238888', 'contact@singaporeair.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Thai Airways', 'Thailand', '+6623561111', 'contact@thaiairways.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Emirates', 'UAE', '+971600555555', 'customer.affairs@emirates.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Qatar Airways', 'Qatar', '+97440230000', 'support@qatarairways.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Korean Air', 'South Korea', '+8215882001', 'engcskal@koreanair.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Japan Airlines', 'Japan', '+81367333062', 'jal_info@jal.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('AirAsia', 'Malaysia', '+60321719222', 'support@airasia.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Delta Air Lines', 'USA', '+18002211212', 'charter@delta.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Lufthansa', 'Germany', '+496986799799', 'customer.relations@lufthansa.com')
    INTO AIRLINE (AirlineName, Country, Phone, Email) VALUES ('Air France', 'France', '+33969393654', 'contact@airfrance.com')
SELECT 1 FROM DUAL;

-- Thêm 15 sân bay
INSERT ALL
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Tan Son Nhat', 'Ho Chi Minh', 'Vietnam', 'SGN')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Noi Bai', 'Hanoi', 'Vietnam', 'HAN')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Da Nang', 'Da Nang', 'Vietnam', 'DAD')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Cam Ranh', 'Nha Trang', 'Vietnam', 'CXR')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Phu Quoc', 'Phu Quoc', 'Vietnam', 'PQC')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Cat Bi', 'Hai Phong', 'Vietnam', 'HPH')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Lien Khuong', 'Da Lat', 'Vietnam', 'DLI')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Changi', 'Singapore', 'Singapore', 'SIN')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Suvarnabhumi', 'Bangkok', 'Thailand', 'BKK')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Incheon', 'Seoul', 'South Korea', 'ICN')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Narita', 'Tokyo', 'Japan', 'NRT')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Dubai Intl', 'Dubai', 'UAE', 'DXB')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Hamad', 'Doha', 'Qatar', 'DOH')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('JFK Intl', 'New York', 'USA', 'JFK')
    INTO AIRPORT (AirportName, City, Country, IATACode) VALUES ('Charles de Gaulle', 'Paris', 'France', 'CDG')
SELECT 1 FROM DUAL;

-- Thêm 15 Máy bay
INSERT ALL
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (1, 'Airbus A321', 180, 2015)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (1, 'Boeing 787', 250, 2018)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (2, 'Airbus A320', 160, 2017)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (2, 'Airbus A321neo', 200, 2020)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (3, 'Boeing 787-9', 290, 2019)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (3, 'Airbus A320neo', 170, 2021)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (4, 'Airbus A320', 180, 2014)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (5, 'Airbus A321ceo', 210, 2020)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (6, 'Airbus A350', 300, 2018)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (7, 'Boeing 777', 350, 2016)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (8, 'Airbus A380', 500, 2015)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (9, 'Boeing 777X', 380, 2022)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (10, 'Boeing 747-8', 410, 2017)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (11, 'Boeing 787-8', 240, 2016)
    INTO AIRCRAFT (AirlineID, Model, Capacity, ManufactureYear) VALUES (12, 'Airbus A320', 180, 2013)
SELECT 1 FROM DUAL;

-- Thêm 15 Tuyến đường bay (Route)
INSERT ALL
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 2, 1150, 120) -- SGN - HAN
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (2, 1, 1150, 120) -- HAN - SGN
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 3, 600, 80)   -- SGN - DAD
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (2, 3, 630, 85)   -- HAN - DAD
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 5, 300, 50)   -- SGN - PQC
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (2, 5, 1200, 125) -- HAN - PQC
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 8, 1100, 120) -- SGN - SIN
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (2, 8, 2200, 190) -- HAN - SIN
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 9, 750, 90)   -- SGN - BKK
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (2, 10, 2700, 240) -- HAN - ICN
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 10, 3600, 300) -- SGN - ICN
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (2, 11, 3700, 310) -- HAN - NRT
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 11, 4300, 350) -- SGN - NRT
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (1, 12, 5600, 480) -- SGN - DXB
    INTO ROUTE (DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES (2, 15, 9200, 720) -- HAN - CDG
SELECT 1 FROM DUAL;


/* =========================================================
   2. BẢNG NGƯỜI DÙNG: USERS, ACCOUNT, CUSTOMER, EMPLOYEE
   ========================================================= */

-- Thêm 20 Users
INSERT ALL
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Nguyen Van A', 'nguyenvana@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Tran Thi B', 'tranthib@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Le Van C', 'levanc@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Pham Thi D', 'phamthid@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Hoang Van E', 'hoangvane@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Ngo Thi F', 'ngothif@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Vu Van G', 'vuvang@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Dang Thi H', 'dangthih@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Bui Van I', 'buivani@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Do Thi K', 'dothik@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Ly Van L', 'lyvanl@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Truong Thi M', 'truongthim@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Dinh Van N', 'dinhvann@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Phan Thi P', 'phanthip@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Mai Van Q', 'maivanq@gmail.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Admin Sys', 'admin@system.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Staff One', 'staff1@airline.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Staff Two', 'staff2@airline.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Manager One', 'manager1@airline.com', 0)
    INTO USERS (FullName, Email, IsDeleted) VALUES ('Manager Two', 'manager2@airline.com', 0)
SELECT 1 FROM DUAL;

-- Thêm 20 Accounts (Ánh xạ 1-1 với Users qua UserID 1-20)
INSERT ALL
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (1, 'usera', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (2, 'userb', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (3, 'userc', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (4, 'userd', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (5, 'usere', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (6, 'userf', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (7, 'userg', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (8, 'userh', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (9, 'useri', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (10, 'userk', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (11, 'userl', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (12, 'userm', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (13, 'usern', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (14, 'userp', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (15, 'userq', 'pass123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (16, 'admin', 'admin123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (17, 'staff1', 'staff123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (18, 'staff2', 'staff123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (19, 'manager1', 'mgr123', 'ACTIVE', 0)
    INTO ACCOUNT (UserID, UserName, Password, Status, IsDeleted) VALUES (20, 'manager2', 'mgr123', 'ACTIVE', 0)
SELECT 1 FROM DUAL;

-- Thêm 15 Customers (Gắn với Account từ 1 đến 15)
INSERT ALL
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (1, 'Nguyen Van A', 'Male', DATE '1990-01-15', '0901111111', 'nguyenvana@gmail.com', 'P001', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (2, 'Tran Thi B', 'Female', DATE '1992-05-20', '0902222222', 'tranthib@gmail.com', 'P002', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (3, 'Le Van C', 'Male', DATE '1985-08-10', '0903333333', 'levanc@gmail.com', 'P003', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (4, 'Pham Thi D', 'Female', DATE '1998-12-05', '0904444444', 'phamthid@gmail.com', 'P004', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (5, 'Hoang Van E', 'Male', DATE '2000-03-25', '0905555555', 'hoangvane@gmail.com', 'P005', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (6, 'Ngo Thi F', 'Female', DATE '1995-07-11', '0906666666', 'ngothif@gmail.com', 'P006', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (7, 'Vu Van G', 'Male', DATE '1988-11-30', '0907777777', 'vuvang@gmail.com', 'P007', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (8, 'Dang Thi H', 'Female', DATE '1993-02-14', '0908888888', 'dangthih@gmail.com', 'P008', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (9, 'Bui Van I', 'Male', DATE '1997-09-09', '0909999999', 'buivani@gmail.com', 'P009', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (10, 'Do Thi K', 'Female', DATE '1982-04-18', '0910000000', 'dothik@gmail.com', 'P010', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (11, 'Ly Van L', 'Male', DATE '1991-06-22', '0911111111', 'lyvanl@gmail.com', 'P011', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (12, 'Truong Thi M', 'Female', DATE '1996-10-15', '0912222222', 'truongthim@gmail.com', 'P012', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (13, 'Dinh Van N', 'Male', DATE '1989-01-08', '0913333333', 'dinhvann@gmail.com', 'P013', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (14, 'Phan Thi P', 'Female', DATE '1994-05-19', '0914444444', 'phanthip@gmail.com', 'P014', 'Vietnam')
    INTO CUSTOMER (AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber, Nationality) VALUES (15, 'Mai Van Q', 'Male', DATE '1987-12-25', '0915555555', 'maivanq@gmail.com', 'P015', 'Vietnam')
SELECT 1 FROM DUAL;

-- Thêm 5 Employees (Gắn với Account từ 16 đến 20)
INSERT ALL
    INTO EMPLOYEE (AccountID, FullName, Position, Phone, Email) VALUES (16, 'Admin Sys', 'System Administrator', '0981000001', 'admin@system.com')
    INTO EMPLOYEE (AccountID, FullName, Position, Phone, Email) VALUES (17, 'Staff One', 'Ticketing Staff', '0981000002', 'staff1@airline.com')
    INTO EMPLOYEE (AccountID, FullName, Position, Phone, Email) VALUES (18, 'Staff Two', 'Ticketing Staff', '0981000003', 'staff2@airline.com')
    INTO EMPLOYEE (AccountID, FullName, Position, Phone, Email) VALUES (19, 'Manager One', 'Branch Manager', '0981000004', 'manager1@airline.com')
    INTO EMPLOYEE (AccountID, FullName, Position, Phone, Email) VALUES (20, 'Manager Two', 'Sales Manager', '0981000005', 'manager2@airline.com')
SELECT 1 FROM DUAL;


/* =========================================================
   3. BẢNG GIAO DỊCH: FLIGHT, SEAT, PRICE, BOOKING, TICKET
   ========================================================= */

-- 1. Thêm 15 Chuyến bay (Đa dạng trạng thái thực tế)
INSERT ALL
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('VN101', 1, 1, 1, 2, 1, SYSDATE - 1, SYSDATE - 1 + (2/24), 'COMPLETED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('VN102', 1, 2, 2, 1, 2, SYSDATE + 2, SYSDATE + 2 + (2/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('VJ201', 2, 3, 1, 3, 3, SYSDATE + 3, SYSDATE + 3 + (1.5/24), 'DELAYED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('VJ202', 2, 4, 2, 3, 4, SYSDATE + 4, SYSDATE + 4 + (1.5/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('QH301', 3, 5, 1, 5, 5, SYSDATE + 5, SYSDATE + 5 + (1/24), 'CANCELLED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('QH302', 3, 6, 2, 5, 6, SYSDATE + 6, SYSDATE + 6 + (2.5/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('BL401', 4, 7, 1, 8, 7, SYSDATE - 0.5, SYSDATE - 0.5 + (2/24), 'LANDED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('VU501', 5, 8, 2, 8, 8, SYSDATE + 8, SYSDATE + 8 + (4/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('SQ601', 6, 9, 1, 9, 9, SYSDATE + 9, SYSDATE + 9 + (1.5/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('TG701', 7, 10, 2, 10, 10, SYSDATE + 10, SYSDATE + 10 + (4.5/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('EK801', 8, 11, 1, 10, 11, SYSDATE + 11, SYSDATE + 11 + (5/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('QR901', 9, 12, 2, 11, 12, SYSDATE + 12, SYSDATE + 12 + (5.5/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('KE001', 10, 13, 1, 11, 13, SYSDATE + 13, SYSDATE + 13 + (6/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('JL002', 11, 14, 1, 12, 14, SYSDATE + 14, SYSDATE + 14 + (8/24), 'SCHEDULED')
    INTO FLIGHT (FlightNumber, AirlineID, AircraftID, DepartureAirportID, ArrivalAirportID, RouteID, DepartureTime, ArrivalTime, FlightStatus) VALUES ('AK003', 12, 15, 2, 15, 15, SYSDATE + 15, SYSDATE + 15 + (12/24), 'SCHEDULED')
SELECT 1 FROM DUAL;

-- 2. Thêm 20 Ghế (Cho máy bay số 1 và 2 với 4 Hạng ghế)
INSERT ALL
    -- Máy bay 1 (ID 1 - 10 ghế): Có đủ 4 hạng ghế
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '1A', 'First Class')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '1B', 'First Class')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '2A', 'Business')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '2B', 'Business')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '10A', 'Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '10B', 'Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '10C', 'Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '11A', 'Premium Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '11B', 'Premium Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (1, '11C', 'Premium Economy')
    
    -- Máy bay 2 (ID 2 - 10 ghế): Chỉ có Business và Economy
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '1A', 'Business')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '1B', 'Business')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '2A', 'Business')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '2B', 'Business')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '15A', 'Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '15B', 'Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '15C', 'Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '16A', 'Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '16B', 'Economy')
    INTO SEAT (AircraftID, SeatNumber, Class) VALUES (2, '16C', 'Economy')
SELECT 1 FROM DUAL;

-- 3. Thêm Bảng giá vé (Đồng bộ với hạng ghế đã tạo ở trên)
INSERT ALL
    -- Flight 1 (Sử dụng Máy bay 1)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (1, 'Economy', 1500000)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (1, 'Premium Economy', 2200000)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (1, 'Business', 4500000)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (1, 'First Class', 9000000)
    
    -- Flight 2 (Sử dụng Máy bay 2)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (2, 'Economy', 1600000)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (2, 'Business', 3800000)
    
    -- Các Flight khác (Giá đa dạng)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (3, 'Economy', 1200000)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (3, 'Business', 2800000)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (4, 'Economy', 1300000)
    INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES (5, 'Economy', 1000000)
SELECT 1 FROM DUAL;

-- 4. Thêm 15 Booking (Để TotalAmount = 0 vì đã có Trigger tính)
INSERT ALL
    -- Nhóm 1: Đã xác nhận (CONFIRMED)
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (1, 2, SYSDATE - 5, 0, 'CONFIRMED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (2, 2, SYSDATE - 4, 0, 'CONFIRMED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (3, 3, SYSDATE - 3, 0, 'CONFIRMED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (4, 3, SYSDATE - 2, 0, 'CONFIRMED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (5, 2, SYSDATE - 1, 0, 'CONFIRMED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (6, 2, SYSDATE, 0, 'CONFIRMED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (7, 3, SYSDATE, 0, 'CONFIRMED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (8, 3, SYSDATE, 0, 'CONFIRMED')
    
    -- Nhóm 2: Chờ thanh toán (PENDING)
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (9, 2, SYSDATE, 0, 'PENDING')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (10, 2, SYSDATE, 0, 'PENDING')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (11, 3, SYSDATE, 0, 'PENDING')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (12, 3, SYSDATE, 0, 'PENDING')
    
    -- Nhóm 3: Đã hủy (CANCELLED)
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (13, 2, SYSDATE - 6, 0, 'CANCELLED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (14, 2, SYSDATE - 7, 0, 'CANCELLED')
    INTO BOOKING (CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES (15, 3, SYSDATE - 8, 0, 'CANCELLED')
SELECT 1 FROM DUAL;

-- 5. Thêm 15 Ticket (Khớp chặt chẽ với Flight 1 & 2 và SeatID)
INSERT ALL
    -- Flight 1 (SeatID 1 -> 10)
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (1, 1, 1, 9000000, 'PAID')      -- First Class
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (2, 1, 2, 9000000, 'PAID')      -- First Class
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (3, 1, 3, 4500000, 'PAID')      -- Business
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (4, 1, 5, 1500000, 'PAID')      -- Economy
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (5, 1, 8, 2200000, 'PAID')      -- Premium Economy
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (11, 1, 6, 1500000, 'BOOKED')   -- Economy (Chờ TT)
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (12, 1, 9, 2200000, 'BOOKED')   -- Prem Eco (Chờ TT)
    
    -- Flight 2 (SeatID 11 -> 20)
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (6, 2, 11, 3800000, 'PAID')     -- Business
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (7, 2, 12, 3800000, 'PAID')     -- Business
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (8, 2, 15, 1600000, 'PAID')     -- Economy
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (9, 2, 16, 1600000, 'BOOKED')   -- Economy (Chờ TT)
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (10, 2, 17, 1600000, 'BOOKED')  -- Economy (Chờ TT)
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (13, 2, 18, 1600000, 'CANCELLED')-- Bị hủy
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (14, 2, 19, 1600000, 'CANCELLED')-- Bị hủy
    INTO TICKET (BookingID, FlightID, SeatID, Price, TicketStatus) VALUES (15, 2, 20, 1600000, 'CANCELLED')-- Bị hủy
SELECT 1 FROM DUAL;

-- 6. Thêm 15 Lịch sử Thanh toán (Khớp Amount 100% với Ticket Price)
INSERT ALL
    -- Nhóm 1: Thanh toán thành công (SUCCESS)
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (1, SYSDATE - 5, 9000000, 'CREDIT CARD', 'SUCCESS')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (2, SYSDATE - 4, 9000000, 'BANK TRANSFER', 'SUCCESS')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (3, SYSDATE - 3, 4500000, 'CASH', 'SUCCESS')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (4, SYSDATE - 2, 1500000, 'MOMO', 'SUCCESS')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (5, SYSDATE - 1, 2200000, 'CREDIT CARD', 'SUCCESS')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (6, SYSDATE, 3800000, 'BANK TRANSFER', 'SUCCESS')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (7, SYSDATE, 3800000, 'CASH', 'SUCCESS')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (8, SYSDATE, 1600000, 'CREDIT CARD', 'SUCCESS')
    
    -- Nhóm 2: Đang chờ xử lý (PENDING)
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (9, SYSDATE, 1600000, 'ZALOPAY', 'PENDING')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (10, SYSDATE, 1600000, 'MOMO', 'PENDING')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (11, SYSDATE, 1500000, 'CREDIT CARD', 'PENDING')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (12, SYSDATE, 2200000, 'BANK TRANSFER', 'PENDING')
    
    -- Nhóm 3: Lỗi hoặc Hoàn tiền
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (13, SYSDATE - 6, 1600000, 'BANK TRANSFER', 'FAILED')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (14, SYSDATE - 7, 1600000, 'CREDIT CARD', 'FAILED')
    INTO PAYMENT (BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES (15, SYSDATE - 8, 1600000, 'MOMO', 'REFUNDED')
SELECT 1 FROM DUAL;

-- 7. Thêm 15 Hành lý (Đa dạng loại hình, khớp theo hạng vé)
INSERT ALL
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (1, 40, 'First Class Priority') -- Ghế First Class
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (2, 35, 'First Class Priority') -- Ghế First Class
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (3, 30, 'Checked')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (4, 15, 'Checked')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (5, 7, 'Carry-on')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (6, 30, 'Fragile')              -- Hàng dễ vỡ
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (7, 45, 'Oversized')            -- Hành lý quá khổ
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (8, 15, 'Checked')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (9, 20, 'Checked')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (10, 7, 'Carry-on')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (11, 25, 'Checked')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (12, 15, 'Checked')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (13, 7, 'Carry-on')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (14, 20, 'Checked')
    INTO BAGGAGE (TicketID, Weight, BaggageType) VALUES (15, 30, 'Checked')
SELECT 1 FROM DUAL;

/* =========================================================
   4. BẢNG PHÂN QUYỀN (Auth & Roles)
   ========================================================= */

-- Thêm Function (Chức năng hệ thống)
INSERT ALL
    INTO FUNCTION (NameFunction, IsDeleted) VALUES ('DASHBOARD', 0)
    INTO FUNCTION (NameFunction, IsDeleted) VALUES ('BOOKING_MANAGEMENT', 0)
    INTO FUNCTION (NameFunction, IsDeleted) VALUES ('FLIGHT_MANAGEMENT', 0)
    INTO FUNCTION (NameFunction, IsDeleted) VALUES ('CUSTOMER_MANAGEMENT', 0)
    INTO FUNCTION (NameFunction, IsDeleted) VALUES ('REPORTING', 0)
SELECT 1 FROM DUAL;

-- Thêm Roles (Quyền thao tác)
INSERT ALL
    INTO ROLE (FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (1, 0, 0, 0, 1, 1, 0) -- Chỉ xem Dashboard
    INTO ROLE (FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (2, 1, 1, 1, 1, 1, 0) -- Full quyền Booking
    INTO ROLE (FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (3, 1, 1, 0, 0, 1, 0) -- Sửa Flight, ko xóa
    INTO ROLE (FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (4, 1, 1, 1, 1, 1, 0) -- Full quyền Customer
    INTO ROLE (FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES (5, 0, 0, 0, 1, 1, 0) -- Quyền Report
SELECT 1 FROM DUAL;

-- Thêm Role Group (Nhóm quyền)
INSERT ALL
    INTO ROLE_GROUP (NameRoleGroup, IsDeleted) VALUES ('ADMIN', 0)
    INTO ROLE_GROUP (NameRoleGroup, IsDeleted) VALUES ('MANAGER', 0)
    INTO ROLE_GROUP (NameRoleGroup, IsDeleted) VALUES ('STAFF', 0)
SELECT 1 FROM DUAL;

-- Thêm Role_Group_Assign_Role (Gán quyền cho nhóm)
INSERT ALL
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (1, 2, 0) -- Admin có quyền Booking
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (1, 3, 0) -- Admin có quyền Flight
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (1, 4, 0) -- Admin có quyền Customer
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (2, 5, 0) -- Manager có quyền Report
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES (3, 2, 0) -- Staff có quyền Booking
SELECT 1 FROM DUAL;

-- Gán nhóm quyền cho Account (VD Account 16 là Admin, 19 là Manager, 17 là Staff)
INSERT ALL
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (16, 1, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (19, 2, 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES (17, 3, 0)
SELECT 1 FROM DUAL;

-- Gán quyền lẻ (nếu có) cho Account
INSERT ALL
    INTO ACCOUNT_ASSIGN_ROLE (AccountID, RoleID, IsDeleted) VALUES (16, 1, 0) -- Admin xem Dashboard
    INTO ACCOUNT_ASSIGN_ROLE (AccountID, RoleID, IsDeleted) VALUES (19, 1, 0) -- Manager xem Dashboard
SELECT 1 FROM DUAL;