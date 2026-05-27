/* =========================================================
   1. BẢNG DANH MỤC: AIRLINE, AIRPORT, ROUTE, AIRCRAFT
   ========================================================= */
-- BẢNG HÃNG HÀNG KHÔNG (AIRLINE)
INSERT ALL
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL01', 'Vietnam Airlines', 'Vietnam', '19001100', 'contact@vietnamairlines.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL02', 'VietJet Air', 'Vietnam', '19001886', 'contact@vietjetair.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL03', 'Bamboo Airways', 'Vietnam', '19001166', 'contact@bambooairways.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL04', 'Singapore Airlines', 'Singapore', '+6562238888', 'contact@singaporeairlines.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL05', 'Qatar Airways', 'Qatar', '+97440230000', 'contact@qatarairways.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL06', 'Emirates', 'UAE', '+971600555555', 'contact@emirates.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL07', 'Korean Air', 'South Korea', '+8215882001', 'contact@koreanair.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL08', 'Japan Airlines', 'Japan', '+81367333062', 'contact@japanairlines.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL09', 'Air France', 'France', '+33969393654', 'contact@airfrance.com')
    INTO AIRLINE (AirlineID, AirlineName, Country, Phone, Email) VALUES ('AL10', 'Delta', 'USA', '+18002211212', 'contact@delta.com')
SELECT 1 FROM DUAL;

-- BẢNG SÂN BAY (AIRPORT)
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

-- BẢNG TUYẾN BAY (ROUTE)
INSERT ALL
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT21', 'AP01', 'AP02', 3603, 380)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT01', 'AP04', 'AP10', 378, 57)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT02', 'AP07', 'AP09', 4082, 428)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT03', 'AP09', 'AP07', 2499, 269)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT04', 'AP09', 'AP10', 2324, 252)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT05', 'AP01', 'AP04', 1310, 151)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT06', 'AP06', 'AP04', 3124, 332)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT07', 'AP08', 'AP03', 3082, 328)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT08', 'AP08', 'AP01', 2712, 291)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT09', 'AP09', 'AP02', 1420, 162)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT10', 'AP02', 'AP01', 3603, 380)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT11', 'AP02', 'AP06', 3845, 404)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT12', 'AP02', 'AP07', 2214, 241)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT13', 'AP02', 'AP03', 1638, 183)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT14', 'AP09', 'AP02', 2077, 227)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT15', 'AP05', 'AP08', 1548, 174)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT16', 'AP06', 'AP02', 2688, 288)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT17', 'AP07', 'AP03', 936, 113)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT18', 'AP02', 'AP04', 408, 60)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT19', 'AP04', 'AP06', 2064, 226)
    INTO ROUTE (RouteID, DepartureAirportID, ArrivalAirportID, Distance, EstimatedTime) VALUES ('RT20', 'AP07', 'AP01', 1853, 205)
SELECT 1 FROM DUAL;

-- BẢNG MÁY BAY (AIRCRAFT)
INSERT ALL
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC01', 'AL01', 'Boeing 777', 150, 2021)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC02', 'AL06', 'Airbus A320', 300, 2022)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC03', 'AL10', 'Airbus A320', 250, 2019)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC04', 'AL08', 'Boeing 787', 150, 2022)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC05', 'AL09', 'Airbus A350', 300, 2017)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC06', 'AL06', 'Airbus A321', 200, 2016)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC07', 'AL02', 'Airbus A320', 300, 2019)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC08', 'AL02', 'Boeing 777', 300, 2021)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC09', 'AL03', 'Airbus A320', 150, 2021)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC10', 'AL07', 'Airbus A321', 200, 2015)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC11', 'AL02', 'Boeing 777', 250, 2023)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC12', 'AL09', 'Boeing 777', 200, 2020)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC13', 'AL07', 'Airbus A320', 300, 2024)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC14', 'AL08', 'Boeing 777', 200, 2023)
    INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES ('AC15', 'AL03', 'Boeing 777', 250, 2017)
SELECT 1 FROM DUAL;

/* =========================================================
   [TỐI ƯU HÓA] AUTO GENERATE GHẾ NGỒI (BẢNG SEAT) BẰNG PL/SQL
   ========================================================= */
DECLARE
  v_first INT; v_bus INT; v_prem INT; v_eco INT;
  v_colIdx INT; v_row INT; v_seatCounter INT;
  v_seatName VARCHAR2(10); v_seatId VARCHAR2(20);
  TYPE string_array IS TABLE OF VARCHAR2(1);
  v_cols string_array := string_array('A','B','C','D','E','F');
BEGIN
  FOR ac IN (SELECT AircraftID, Capacity FROM AIRCRAFT) LOOP
    IF MOD(TO_NUMBER(SUBSTR(ac.AircraftID, 3)), 3) = 0 THEN
      v_first := TRUNC(ac.Capacity * 0.1);
      v_bus := TRUNC(ac.Capacity * 0.2);
      v_prem := TRUNC(ac.Capacity * 0.1);
      v_eco := ac.Capacity - v_first - v_bus - v_prem;
    ELSIF MOD(TO_NUMBER(SUBSTR(ac.AircraftID, 3)), 3) = 1 THEN
      v_first := 0; v_prem := 0;
      v_bus := TRUNC(ac.Capacity * 0.2);
      v_eco := ac.Capacity - v_bus;
    ELSE
      v_first := 0; v_bus := 0; v_prem := 0;
      v_eco := ac.Capacity;
    END IF;
    v_row := 1; v_colIdx := 1; v_seatCounter := 1;
    FOR i IN 1..v_first LOOP
      v_seatName := v_row || v_cols(v_colIdx);
      v_seatId := ac.AircraftID || '_' || v_seatCounter;
      INSERT INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (v_seatId, ac.AircraftID, v_seatName, 'First Class');
      v_seatCounter := v_seatCounter + 1; v_colIdx := v_colIdx + 1;
      IF v_colIdx > 6 THEN v_colIdx := 1; v_row := v_row + 1; END IF;
    END LOOP;
    IF v_colIdx > 1 THEN v_row := v_row + 1; v_colIdx := 1; END IF;
    FOR i IN 1..v_bus LOOP
      v_seatName := v_row || v_cols(v_colIdx);
      v_seatId := ac.AircraftID || '_' || v_seatCounter;
      INSERT INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (v_seatId, ac.AircraftID, v_seatName, 'Business');
      v_seatCounter := v_seatCounter + 1; v_colIdx := v_colIdx + 1;
      IF v_colIdx > 6 THEN v_colIdx := 1; v_row := v_row + 1; END IF;
    END LOOP;
    IF v_colIdx > 1 THEN v_row := v_row + 1; v_colIdx := 1; END IF;
    FOR i IN 1..v_prem LOOP
      v_seatName := v_row || v_cols(v_colIdx);
      v_seatId := ac.AircraftID || '_' || v_seatCounter;
      INSERT INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (v_seatId, ac.AircraftID, v_seatName, 'Premium Economy');
      v_seatCounter := v_seatCounter + 1; v_colIdx := v_colIdx + 1;
      IF v_colIdx > 6 THEN v_colIdx := 1; v_row := v_row + 1; END IF;
    END LOOP;
    IF v_colIdx > 1 THEN v_row := v_row + 1; v_colIdx := 1; END IF;
    FOR i IN 1..v_eco LOOP
      v_seatName := v_row || v_cols(v_colIdx);
      v_seatId := ac.AircraftID || '_' || v_seatCounter;
      INSERT INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (v_seatId, ac.AircraftID, v_seatName, 'Economy');
      v_seatCounter := v_seatCounter + 1; v_colIdx := v_colIdx + 1;
      IF v_colIdx > 6 THEN v_colIdx := 1; v_row := v_row + 1; END IF;
    END LOOP;
  END LOOP;
  COMMIT;
END;
/

/* =========================================================
   2. BẢNG NGƯỜI DÙNG
   ========================================================= */
-- BẢNG NGƯỜI DÙNG CHUNG (USERS)
INSERT ALL
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US01', 'Admin He Thong', 'admin@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US02', 'Quan Ly Chi Nhanh 1', 'manager1@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US03', 'Quan Ly Chi Nhanh 2', 'manager2@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US04', 'Nhan Vien 1', 'staff1@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US05', 'Nhan Vien 2', 'staff2@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US06', 'Khach Hang 1', 'customer1@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US07', 'Khach Hang 2', 'customer2@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US08', 'Khach Hang 3', 'customer3@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US09', 'Khach Hang 4', 'customer4@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US10', 'Khach Hang 5', 'customer5@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US11', 'Khach Hang 6', 'customer6@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US12', 'Khach Hang 7', 'customer7@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US13', 'Khach Hang 8', 'customer8@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US14', 'Khach Hang 9', 'customer9@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US15', 'Khach Hang 10', 'customer10@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US16', 'Khach Hang 11', 'customer11@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US17', 'Khach Hang 12', 'customer12@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US18', 'Khach Hang 13', 'customer13@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US19', 'Khach Hang 14', 'customer14@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US20', 'Khach Hang 15', 'customer15@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US21', 'Khach Hang 16', 'customer16@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US22', 'Khach Hang 17', 'customer17@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US23', 'Khach Hang 18', 'customer18@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US24', 'Khach Hang 19', 'customer19@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US25', 'Khach Hang 20', 'customer20@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US26', 'Khach Hang 21', 'customer21@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US27', 'Khach Hang 22', 'customer22@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US28', 'Khach Hang 23', 'customer23@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US29', 'Khach Hang 24', 'customer24@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US30', 'Khach Hang 25', 'customer25@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US31', 'Khach Hang 26', 'customer26@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US32', 'Khach Hang 27', 'customer27@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US33', 'Khach Hang 28', 'customer28@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US34', 'Khach Hang 29', 'customer29@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US35', 'Khach Hang 30', 'customer30@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US36', 'Khach Hang 31', 'customer31@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US37', 'Khach Hang 32', 'customer32@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US38', 'Khach Hang 33', 'customer33@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US39', 'Khach Hang 34', 'customer34@mail.com', 0)
    INTO USERS (UserID, FullName, Email, IsDeleted) VALUES ('US40', 'Khach Hang 35', 'customer35@mail.com', 0)
SELECT 1 FROM DUAL;

-- BẢNG TÀI KHOẢN ĐĂNG NHẬP (ACCOUNT)
INSERT ALL
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC01', 'US01', 'admin', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC02', 'US02', 'manager1', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC03', 'US03', 'manager2', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC04', 'US04', 'staff1', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC05', 'US05', 'staff2', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC06', 'US06', 'customer1', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC07', 'US07', 'customer2', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC08', 'US08', 'customer3', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC09', 'US09', 'customer4', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC10', 'US10', 'customer5', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC11', 'US11', 'customer6', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC12', 'US12', 'customer7', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC13', 'US13', 'customer8', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC14', 'US14', 'customer9', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC15', 'US15', 'customer10', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC16', 'US16', 'customer11', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC17', 'US17', 'customer12', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC18', 'US18', 'customer13', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC19', 'US19', 'customer14', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC20', 'US20', 'customer15', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC21', 'US21', 'customer16', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC22', 'US22', 'customer17', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC23', 'US23', 'customer18', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC24', 'US24', 'customer19', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC25', 'US25', 'customer20', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC26', 'US26', 'customer21', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC27', 'US27', 'customer22', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC28', 'US28', 'customer23', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC29', 'US29', 'customer24', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC30', 'US30', 'customer25', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC31', 'US31', 'customer26', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC32', 'US32', 'customer27', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC33', 'US33', 'customer28', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC34', 'US34', 'customer29', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC35', 'US35', 'customer30', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC36', 'US36', 'customer31', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC37', 'US37', 'customer32', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC38', 'US38', 'customer33', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC39', 'US39', 'customer34', 'pass', 'ACTIVE', 0)
    INTO ACCOUNT (AccountID, UserID, UserName, Password, Status, IsDeleted) VALUES ('ACC40', 'US40', 'customer35', 'pass', 'ACTIVE', 0)
SELECT 1 FROM DUAL;

-- BẢNG NHÂN VIÊN (EMPLOYEE)
INSERT ALL
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP01', 'ACC01', 'Admin He Thong', 'System Admin', '099000001', 'admin@mail.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP02', 'ACC02', 'Quan Ly Chi Nhanh 1', 'Manager', '099000002', 'manager1@mail.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP03', 'ACC03', 'Quan Ly Chi Nhanh 2', 'Manager', '099000003', 'manager2@mail.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP04', 'ACC04', 'Nhan Vien 1', 'Ticketing Staff', '099000004', 'staff1@mail.com')
    INTO EMPLOYEE (EmployeeID, AccountID, FullName, Position, Phone, Email) VALUES ('EMP05', 'ACC05', 'Nhan Vien 2', 'Ticketing Staff', '099000005', 'staff2@mail.com')
SELECT 1 FROM DUAL;

-- BẢNG KHÁCH HÀNG THÀNH VIÊN (CUSTOMER)
INSERT ALL
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS01', 'ACC06', 'Khach Hang 1', 'Female', DATE '1991-01-01', '090000600', 'cus6@mail.com', 'P100006')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS02', 'ACC07', 'Khach Hang 2', 'Male', DATE '1976-01-01', '090000700', 'cus7@mail.com', 'P100007')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS03', 'ACC08', 'Khach Hang 3', 'Female', DATE '1970-01-01', '090000800', 'cus8@mail.com', 'P100008')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS04', 'ACC09', 'Khach Hang 4', 'Male', DATE '1974-01-01', '090000900', 'cus9@mail.com', 'P100009')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS05', 'ACC10', 'Khach Hang 5', 'Male', DATE '1979-01-01', '090001000', 'cus10@mail.com', 'P100010')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS06', 'ACC11', 'Khach Hang 6', 'Female', DATE '1975-01-01', '090001100', 'cus11@mail.com', 'P100011')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS07', 'ACC12', 'Khach Hang 7', 'Female', DATE '1973-01-01', '090001200', 'cus12@mail.com', 'P100012')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS08', 'ACC13', 'Khach Hang 8', 'Female', DATE '1976-01-01', '090001300', 'cus13@mail.com', 'P100013')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS09', 'ACC14', 'Khach Hang 9', 'Male', DATE '1995-01-01', '090001400', 'cus14@mail.com', 'P100014')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS10', 'ACC15', 'Khach Hang 10', 'Male', DATE '1997-01-01', '090001500', 'cus15@mail.com', 'P100015')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS11', 'ACC16', 'Khach Hang 11', 'Male', DATE '1996-01-01', '090001600', 'cus16@mail.com', 'P100016')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS12', 'ACC17', 'Khach Hang 12', 'Female', DATE '1985-01-01', '090001700', 'cus17@mail.com', 'P100017')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS13', 'ACC18', 'Khach Hang 13', 'Female', DATE '1997-01-01', '090001800', 'cus18@mail.com', 'P100018')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS14', 'ACC19', 'Khach Hang 14', 'Male', DATE '1985-01-01', '090001900', 'cus19@mail.com', 'P100019')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS15', 'ACC20', 'Khach Hang 15', 'Male', DATE '1981-01-01', '090002000', 'cus20@mail.com', 'P100020')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS16', 'ACC21', 'Khach Hang 16', 'Female', DATE '1987-01-01', '090002100', 'cus21@mail.com', 'P100021')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS17', 'ACC22', 'Khach Hang 17', 'Female', DATE '1994-01-01', '090002200', 'cus22@mail.com', 'P100022')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS18', 'ACC23', 'Khach Hang 18', 'Female', DATE '1985-01-01', '090002300', 'cus23@mail.com', 'P100023')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS19', 'ACC24', 'Khach Hang 19', 'Female', DATE '1989-01-01', '090002400', 'cus24@mail.com', 'P100024')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS20', 'ACC25', 'Khach Hang 20', 'Female', DATE '1970-01-01', '090002500', 'cus25@mail.com', 'P100025')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS21', 'ACC26', 'Khach Hang 21', 'Female', DATE '1979-01-01', '090002600', 'cus26@mail.com', 'P100026')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS22', 'ACC27', 'Khach Hang 22', 'Female', DATE '1973-01-01', '090002700', 'cus27@mail.com', 'P100027')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS23', 'ACC28', 'Khach Hang 23', 'Female', DATE '1998-01-01', '090002800', 'cus28@mail.com', 'P100028')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS24', 'ACC29', 'Khach Hang 24', 'Female', DATE '1987-01-01', '090002900', 'cus29@mail.com', 'P100029')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS25', 'ACC30', 'Khach Hang 25', 'Female', DATE '1998-01-01', '090003000', 'cus30@mail.com', 'P100030')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS26', 'ACC31', 'Khach Hang 26', 'Female', DATE '1985-01-01', '090003100', 'cus31@mail.com', 'P100031')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS27', 'ACC32', 'Khach Hang 27', 'Male', DATE '1978-01-01', '090003200', 'cus32@mail.com', 'P100032')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS28', 'ACC33', 'Khach Hang 28', 'Male', DATE '1982-01-01', '090003300', 'cus33@mail.com', 'P100033')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS29', 'ACC34', 'Khach Hang 29', 'Female', DATE '1982-01-01', '090003400', 'cus34@mail.com', 'P100034')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS30', 'ACC35', 'Khach Hang 30', 'Female', DATE '1997-01-01', '090003500', 'cus35@mail.com', 'P100035')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS31', 'ACC36', 'Khach Hang 31', 'Female', DATE '1974-01-01', '090003600', 'cus36@mail.com', 'P100036')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS32', 'ACC37', 'Khach Hang 32', 'Male', DATE '1973-01-01', '090003700', 'cus37@mail.com', 'P100037')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS33', 'ACC38', 'Khach Hang 33', 'Male', DATE '1983-01-01', '090003800', 'cus38@mail.com', 'P100038')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS34', 'ACC39', 'Khach Hang 34', 'Female', DATE '1985-01-01', '090003900', 'cus39@mail.com', 'P100039')
    INTO CUSTOMER (CustomerID, AccountID, FullName, Gender, DateOfBirth, Phone, Email, PassportNumber) VALUES ('CUS35', 'ACC40', 'Khach Hang 35', 'Male', DATE '1991-01-01', '090004000', 'cus40@mail.com', 'P100040')
SELECT 1 FROM DUAL;

-- BẢNG HÀNH KHÁCH BAY (PASSENGER)
INSERT ALL
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA001', 'Hanh Khach 1', 'Male', DATE '1992-05-05', 'PP200001')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA002', 'Hanh Khach 2', 'Male', DATE '1960-05-05', 'PP200002')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA003', 'Hanh Khach 3', 'Female', DATE '1975-05-05', 'PP200003')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA004', 'Hanh Khach 4', 'Female', DATE '2005-05-05', 'PP200004')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA005', 'Hanh Khach 5', 'Male', DATE '1972-05-05', 'PP200005')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA006', 'Hanh Khach 6', 'Male', DATE '1966-05-05', 'PP200006')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA007', 'Hanh Khach 7', 'Female', DATE '1968-05-05', 'PP200007')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA008', 'Hanh Khach 8', 'Male', DATE '1971-05-05', 'PP200008')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA009', 'Hanh Khach 9', 'Female', DATE '2001-05-05', 'PP200009')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA010', 'Hanh Khach 10', 'Female', DATE '1990-05-05', 'PP200010')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA011', 'Hanh Khach 11', 'Female', DATE '1997-05-05', 'PP200011')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA012', 'Hanh Khach 12', 'Male', DATE '1995-05-05', 'PP200012')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA013', 'Hanh Khach 13', 'Male', DATE '2005-05-05', 'PP200013')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA014', 'Hanh Khach 14', 'Male', DATE '1964-05-05', 'PP200014')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA015', 'Hanh Khach 15', 'Male', DATE '1976-05-05', 'PP200015')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA016', 'Hanh Khach 16', 'Female', DATE '1982-05-05', 'PP200016')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA017', 'Hanh Khach 17', 'Female', DATE '1970-05-05', 'PP200017')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA018', 'Hanh Khach 18', 'Male', DATE '1992-05-05', 'PP200018')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA019', 'Hanh Khach 19', 'Male', DATE '1968-05-05', 'PP200019')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA020', 'Hanh Khach 20', 'Male', DATE '2001-05-05', 'PP200020')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA021', 'Hanh Khach 21', 'Male', DATE '1962-05-05', 'PP200021')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA022', 'Hanh Khach 22', 'Male', DATE '1960-05-05', 'PP200022')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA023', 'Hanh Khach 23', 'Female', DATE '1977-05-05', 'PP200023')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA024', 'Hanh Khach 24', 'Male', DATE '2002-05-05', 'PP200024')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA025', 'Hanh Khach 25', 'Male', DATE '2001-05-05', 'PP200025')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA026', 'Hanh Khach 26', 'Male', DATE '1990-05-05', 'PP200026')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA027', 'Hanh Khach 27', 'Male', DATE '1964-05-05', 'PP200027')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA028', 'Hanh Khach 28', 'Female', DATE '1989-05-05', 'PP200028')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA029', 'Hanh Khach 29', 'Male', DATE '1997-05-05', 'PP200029')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA030', 'Hanh Khach 30', 'Male', DATE '1999-05-05', 'PP200030')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA031', 'Hanh Khach 31', 'Female', DATE '1967-05-05', 'PP200031')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA032', 'Hanh Khach 32', 'Male', DATE '1966-05-05', 'PP200032')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA033', 'Hanh Khach 33', 'Female', DATE '1966-05-05', 'PP200033')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA034', 'Hanh Khach 34', 'Male', DATE '1962-05-05', 'PP200034')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA035', 'Hanh Khach 35', 'Male', DATE '1977-05-05', 'PP200035')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA036', 'Hanh Khach 36', 'Female', DATE '1967-05-05', 'PP200036')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA037', 'Hanh Khach 37', 'Female', DATE '2000-05-05', 'PP200037')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA038', 'Hanh Khach 38', 'Male', DATE '1992-05-05', 'PP200038')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA039', 'Hanh Khach 39', 'Female', DATE '2007-05-05', 'PP200039')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA040', 'Hanh Khach 40', 'Male', DATE '1977-05-05', 'PP200040')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA041', 'Hanh Khach 41', 'Male', DATE '1960-05-05', 'PP200041')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA042', 'Hanh Khach 42', 'Female', DATE '1985-05-05', 'PP200042')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA043', 'Hanh Khach 43', 'Male', DATE '2005-05-05', 'PP200043')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA044', 'Hanh Khach 44', 'Female', DATE '2002-05-05', 'PP200044')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA045', 'Hanh Khach 45', 'Female', DATE '1976-05-05', 'PP200045')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA046', 'Hanh Khach 46', 'Male', DATE '1985-05-05', 'PP200046')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA047', 'Hanh Khach 47', 'Male', DATE '1996-05-05', 'PP200047')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA048', 'Hanh Khach 48', 'Female', DATE '2006-05-05', 'PP200048')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA049', 'Hanh Khach 49', 'Female', DATE '1996-05-05', 'PP200049')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA050', 'Hanh Khach 50', 'Female', DATE '1993-05-05', 'PP200050')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA051', 'Hanh Khach 51', 'Female', DATE '1973-05-05', 'PP200051')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA052', 'Hanh Khach 52', 'Female', DATE '1996-05-05', 'PP200052')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA053', 'Hanh Khach 53', 'Male', DATE '1974-05-05', 'PP200053')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA054', 'Hanh Khach 54', 'Male', DATE '1974-05-05', 'PP200054')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA055', 'Hanh Khach 55', 'Male', DATE '1995-05-05', 'PP200055')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA056', 'Hanh Khach 56', 'Female', DATE '1986-05-05', 'PP200056')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA057', 'Hanh Khach 57', 'Male', DATE '1996-05-05', 'PP200057')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA058', 'Hanh Khach 58', 'Male', DATE '2001-05-05', 'PP200058')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA059', 'Hanh Khach 59', 'Female', DATE '1989-05-05', 'PP200059')
    INTO PASSENGER (PassengerID, FullName, Gender, DateOfBirth, PassportNumber) VALUES ('PA060', 'Hanh Khach 60', 'Male', DATE '2006-05-05', 'PP200060')
SELECT 1 FROM DUAL;

/* =========================================================
   3. CHUYẾN BAY VÀ BẢNG GIÁ
   ========================================================= */


ALTER TRIGGER TRG_PREVENT_PAST_BOOKING DISABLE;
ALTER TRIGGER TRG_LOG_SUCCESSFUL_PAYMENT DISABLE;
ALTER TRIGGER TRG_CHECK_AIRCRAFT_OVERLAP DISABLE;
ALTER TRIGGER TRG_UPDATE_BOOKING_TOTAL DISABLE;
ALTER TRIGGER TRG_RB60_CHECK_PAYMENT_AMOUNT DISABLE;
ALTER TRIGGER TRG_RB64_CHECK_TICKET_PAYMENT DISABLE;
ALTER TRIGGER TRG_RB66_BOOKING_MUST_HAVE_TICKET DISABLE;

-- BẢNG CHUYẾN BAY (FLIGHT)
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL001', 'FLN1001', 'AL10', 'AC03', 'RT13', TO_DATE('2025-10-09 06:11:39', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-09 10:28:57', 'YYYY-MM-DD HH24:MI:SS'), '18', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL002', 'FLN1002', 'AL06', 'AC06', 'RT06', TO_DATE('2026-06-08 03:58:54', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-08 08:33:59', 'YYYY-MM-DD HH24:MI:SS'), '17', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL003', 'FLN1003', 'AL02', 'AC07', 'RT14', TO_DATE('2025-08-13 18:02:20', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-13 20:48:33', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL004', 'FLN1004', 'AL01', 'AC01', 'RT19', TO_DATE('2025-07-30 17:30:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-30 19:32:02', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL005', 'FLN1005', 'AL03', 'AC15', 'RT01', TO_DATE('2026-05-31 07:38:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-31 09:46:53', 'YYYY-MM-DD HH24:MI:SS'), '02', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL006', 'FLN1006', 'AL03', 'AC15', 'RT14', TO_DATE('2026-05-05 08:08:28', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-05 13:01:50', 'YYYY-MM-DD HH24:MI:SS'), '08', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL007', 'FLN1007', 'AL06', 'AC06', 'RT09', TO_DATE('2026-04-25 21:06:22', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-26 00:55:32', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL008', 'FLN1008', 'AL06', 'AC06', 'RT19', TO_DATE('2026-06-02 17:08:14', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-02 21:30:52', 'YYYY-MM-DD HH24:MI:SS'), '04', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL009', 'FLN1009', 'AL10', 'AC03', 'RT04', TO_DATE('2025-08-15 17:37:34', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-15 22:30:43', 'YYYY-MM-DD HH24:MI:SS'), '16', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL010', 'FLN1010', 'AL06', 'AC06', 'RT13', TO_DATE('2025-10-11 07:55:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-11 11:47:34', 'YYYY-MM-DD HH24:MI:SS'), '16', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL011', 'FLN1011', 'AL09', 'AC12', 'RT13', TO_DATE('2025-11-09 12:35:24', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-09 16:21:49', 'YYYY-MM-DD HH24:MI:SS'), '02', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL012', 'FLN1012', 'AL07', 'AC10', 'RT17', TO_DATE('2025-10-09 13:25:03', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-09 16:49:59', 'YYYY-MM-DD HH24:MI:SS'), '10', 'LANDED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL013', 'FLN1013', 'AL07', 'AC13', 'RT14', TO_DATE('2026-07-16 12:03:46', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-16 14:49:24', 'YYYY-MM-DD HH24:MI:SS'), '14', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL014', 'FLN1014', 'AL01', 'AC01', 'RT10', TO_DATE('2025-11-12 03:34:11', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-12 08:18:16', 'YYYY-MM-DD HH24:MI:SS'), '02', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL015', 'FLN1015', 'AL09', 'AC05', 'RT04', TO_DATE('2025-09-12 15:14:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-12 20:02:58', 'YYYY-MM-DD HH24:MI:SS'), '03', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL016', 'FLN1016', 'AL07', 'AC10', 'RT02', TO_DATE('2026-04-18 01:02:20', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-18 05:28:04', 'YYYY-MM-DD HH24:MI:SS'), '02', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL017', 'FLN1017', 'AL03', 'AC09', 'RT12', TO_DATE('2025-07-02 22:07:19', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-03 01:27:29', 'YYYY-MM-DD HH24:MI:SS'), '20', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL018', 'FLN1018', 'AL10', 'AC03', 'RT11', TO_DATE('2026-05-16 14:13:10', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-16 17:55:42', 'YYYY-MM-DD HH24:MI:SS'), '16', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL019', 'FLN1019', 'AL01', 'AC01', 'RT14', TO_DATE('2025-12-20 10:23:06', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-20 14:14:00', 'YYYY-MM-DD HH24:MI:SS'), '05', 'LANDED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL020', 'FLN1020', 'AL02', 'AC07', 'RT05', TO_DATE('2026-04-07 08:01:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-07 11:33:42', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL021', 'FLN1021', 'AL02', 'AC07', 'RT05', TO_DATE('2026-01-13 14:29:35', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-13 19:09:36', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL022', 'FLN1022', 'AL03', 'AC09', 'RT18', TO_DATE('2025-08-02 15:03:27', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-02 18:43:55', 'YYYY-MM-DD HH24:MI:SS'), '14', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL023', 'FLN1023', 'AL10', 'AC03', 'RT08', TO_DATE('2026-01-26 15:04:45', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-26 20:00:02', 'YYYY-MM-DD HH24:MI:SS'), '11', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL024', 'FLN1024', 'AL01', 'AC01', 'RT12', TO_DATE('2025-12-14 08:55:14', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-14 11:55:17', 'YYYY-MM-DD HH24:MI:SS'), '11', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL025', 'FLN1025', 'AL03', 'AC15', 'RT08', TO_DATE('2025-11-03 02:09:27', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-03 07:04:58', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL026', 'FLN1026', 'AL09', 'AC12', 'RT11', TO_DATE('2026-05-03 21:31:03', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-04 02:01:08', 'YYYY-MM-DD HH24:MI:SS'), '08', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL027', 'FLN1027', 'AL06', 'AC06', 'RT08', TO_DATE('2025-09-28 18:25:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-28 20:42:55', 'YYYY-MM-DD HH24:MI:SS'), '13', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL028', 'FLN1028', 'AL03', 'AC09', 'RT20', TO_DATE('2026-06-07 19:59:34', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-08 00:17:16', 'YYYY-MM-DD HH24:MI:SS'), '08', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL029', 'FLN1029', 'AL03', 'AC09', 'RT03', TO_DATE('2025-07-16 17:02:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-16 19:25:18', 'YYYY-MM-DD HH24:MI:SS'), '18', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL030', 'FLN1030', 'AL09', 'AC05', 'RT19', TO_DATE('2025-09-27 13:46:01', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-27 17:16:19', 'YYYY-MM-DD HH24:MI:SS'), '18', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL031', 'FLN1031', 'AL07', 'AC13', 'RT13', TO_DATE('2026-02-03 18:37:47', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-03 22:24:27', 'YYYY-MM-DD HH24:MI:SS'), '20', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL032', 'FLN1032', 'AL02', 'AC08', 'RT16', TO_DATE('2026-05-16 21:38:38', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-17 02:25:04', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL033', 'FLN1033', 'AL02', 'AC11', 'RT19', TO_DATE('2026-04-15 22:38:36', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-16 03:09:34', 'YYYY-MM-DD HH24:MI:SS'), '09', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL034', 'FLN1034', 'AL01', 'AC01', 'RT08', TO_DATE('2026-05-09 19:14:18', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-09 22:40:07', 'YYYY-MM-DD HH24:MI:SS'), '10', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL035', 'FLN1035', 'AL01', 'AC01', 'RT05', TO_DATE('2026-07-24 10:15:26', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-24 12:50:47', 'YYYY-MM-DD HH24:MI:SS'), '11', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL036', 'FLN1036', 'AL02', 'AC11', 'RT06', TO_DATE('2026-02-10 15:04:33', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-10 19:54:43', 'YYYY-MM-DD HH24:MI:SS'), '12', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL037', 'FLN1037', 'AL08', 'AC14', 'RT02', TO_DATE('2025-12-09 06:27:10', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-09 11:21:01', 'YYYY-MM-DD HH24:MI:SS'), '15', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL038', 'FLN1038', 'AL01', 'AC01', 'RT13', TO_DATE('2025-07-05 02:24:46', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-05 05:24:15', 'YYYY-MM-DD HH24:MI:SS'), '17', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL039', 'FLN1039', 'AL08', 'AC04', 'RT20', TO_DATE('2025-10-05 06:31:10', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-05 10:06:30', 'YYYY-MM-DD HH24:MI:SS'), '12', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL040', 'FLN1040', 'AL07', 'AC13', 'RT18', TO_DATE('2025-06-29 09:18:46', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-29 13:43:19', 'YYYY-MM-DD HH24:MI:SS'), '15', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL041', 'FLN1041', 'AL07', 'AC13', 'RT11', TO_DATE('2025-11-30 08:41:34', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-30 12:43:25', 'YYYY-MM-DD HH24:MI:SS'), '19', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL042', 'FLN1042', 'AL08', 'AC04', 'RT04', TO_DATE('2025-08-17 09:32:42', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-17 11:43:51', 'YYYY-MM-DD HH24:MI:SS'), '14', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL043', 'FLN1043', 'AL06', 'AC02', 'RT19', TO_DATE('2026-02-09 11:36:47', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-09 13:51:27', 'YYYY-MM-DD HH24:MI:SS'), '12', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL044', 'FLN1044', 'AL03', 'AC15', 'RT08', TO_DATE('2025-11-29 18:37:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-29 21:21:40', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL045', 'FLN1045', 'AL06', 'AC06', 'RT02', TO_DATE('2026-07-03 11:38:36', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-03 16:36:18', 'YYYY-MM-DD HH24:MI:SS'), '16', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL046', 'FLN1046', 'AL09', 'AC05', 'RT07', TO_DATE('2025-10-09 17:28:31', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-09 19:52:58', 'YYYY-MM-DD HH24:MI:SS'), '17', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL047', 'FLN1047', 'AL01', 'AC01', 'RT12', TO_DATE('2025-06-06 03:20:50', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-06 08:19:41', 'YYYY-MM-DD HH24:MI:SS'), '15', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL048', 'FLN1048', 'AL09', 'AC12', 'RT19', TO_DATE('2025-12-30 05:18:27', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-30 08:02:33', 'YYYY-MM-DD HH24:MI:SS'), '15', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL049', 'FLN1049', 'AL02', 'AC11', 'RT03', TO_DATE('2026-06-14 00:30:38', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-14 04:12:06', 'YYYY-MM-DD HH24:MI:SS'), '01', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL050', 'FLN1050', 'AL02', 'AC07', 'RT09', TO_DATE('2026-06-09 04:09:13', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-09 06:55:05', 'YYYY-MM-DD HH24:MI:SS'), '12', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL051', 'FLN1051', 'AL01', 'AC01', 'RT03', TO_DATE('2025-12-14 14:30:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-14 18:04:32', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL052', 'FLN1052', 'AL08', 'AC04', 'RT14', TO_DATE('2026-02-02 16:57:51', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-02 19:13:44', 'YYYY-MM-DD HH24:MI:SS'), '01', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL053', 'FLN1053', 'AL02', 'AC07', 'RT13', TO_DATE('2025-08-27 08:32:27', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-27 12:12:01', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL054', 'FLN1054', 'AL10', 'AC03', 'RT13', TO_DATE('2026-05-09 05:57:36', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-09 07:57:39', 'YYYY-MM-DD HH24:MI:SS'), '17', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL055', 'FLN1055', 'AL02', 'AC07', 'RT16', TO_DATE('2026-03-24 00:39:23', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-24 03:01:53', 'YYYY-MM-DD HH24:MI:SS'), '09', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL056', 'FLN1056', 'AL06', 'AC02', 'RT01', TO_DATE('2026-01-08 03:57:28', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-08 06:28:07', 'YYYY-MM-DD HH24:MI:SS'), '16', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL057', 'FLN1057', 'AL08', 'AC04', 'RT20', TO_DATE('2025-06-07 15:46:49', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-07 19:21:51', 'YYYY-MM-DD HH24:MI:SS'), '19', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL058', 'FLN1058', 'AL02', 'AC07', 'RT07', TO_DATE('2025-10-12 17:22:54', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-12 21:22:09', 'YYYY-MM-DD HH24:MI:SS'), '13', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL059', 'FLN1059', 'AL01', 'AC01', 'RT08', TO_DATE('2025-12-04 08:12:03', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-04 13:09:58', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL060', 'FLN1060', 'AL07', 'AC13', 'RT14', TO_DATE('2025-11-02 11:14:02', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-02 13:51:06', 'YYYY-MM-DD HH24:MI:SS'), '08', 'LANDED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL061', 'FLN1061', 'AL07', 'AC13', 'RT01', TO_DATE('2025-09-04 14:36:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-04 17:24:03', 'YYYY-MM-DD HH24:MI:SS'), '19', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL062', 'FLN1062', 'AL09', 'AC05', 'RT04', TO_DATE('2025-09-22 18:04:26', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-22 20:59:57', 'YYYY-MM-DD HH24:MI:SS'), '14', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL063', 'FLN1063', 'AL03', 'AC15', 'RT14', TO_DATE('2026-01-22 17:56:28', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-22 21:12:33', 'YYYY-MM-DD HH24:MI:SS'), '19', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL064', 'FLN1064', 'AL06', 'AC02', 'RT05', TO_DATE('2026-06-04 09:13:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-04 12:59:08', 'YYYY-MM-DD HH24:MI:SS'), '15', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL065', 'FLN1065', 'AL10', 'AC03', 'RT15', TO_DATE('2025-06-07 17:55:33', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-07 22:48:20', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL066', 'FLN1066', 'AL07', 'AC13', 'RT12', TO_DATE('2025-10-27 04:47:55', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-27 07:57:57', 'YYYY-MM-DD HH24:MI:SS'), '06', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL067', 'FLN1067', 'AL01', 'AC01', 'RT19', TO_DATE('2025-07-24 07:19:51', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-24 09:20:41', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL068', 'FLN1068', 'AL07', 'AC10', 'RT02', TO_DATE('2026-04-23 10:45:56', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-23 14:02:26', 'YYYY-MM-DD HH24:MI:SS'), '15', 'LANDED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL069', 'FLN1069', 'AL08', 'AC14', 'RT09', TO_DATE('2025-10-07 19:27:20', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-07 23:38:49', 'YYYY-MM-DD HH24:MI:SS'), '11', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL070', 'FLN1070', 'AL06', 'AC02', 'RT11', TO_DATE('2025-10-06 05:12:04', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-06 10:07:42', 'YYYY-MM-DD HH24:MI:SS'), '18', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL071', 'FLN1071', 'AL02', 'AC07', 'RT20', TO_DATE('2026-06-13 02:03:28', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-13 05:36:58', 'YYYY-MM-DD HH24:MI:SS'), '02', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL072', 'FLN1072', 'AL01', 'AC01', 'RT07', TO_DATE('2026-06-10 09:47:12', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-10 14:10:19', 'YYYY-MM-DD HH24:MI:SS'), '07', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL073', 'FLN1073', 'AL01', 'AC01', 'RT20', TO_DATE('2026-01-21 08:37:08', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-21 12:23:48', 'YYYY-MM-DD HH24:MI:SS'), '12', 'LANDED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL074', 'FLN1074', 'AL06', 'AC06', 'RT06', TO_DATE('2026-02-10 08:51:58', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-10 10:56:53', 'YYYY-MM-DD HH24:MI:SS'), '11', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL075', 'FLN1075', 'AL02', 'AC11', 'RT14', TO_DATE('2025-07-07 05:41:47', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-07 09:57:11', 'YYYY-MM-DD HH24:MI:SS'), '19', 'LANDED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL076', 'FLN1076', 'AL02', 'AC11', 'RT12', TO_DATE('2026-01-09 17:39:26', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-09 21:27:24', 'YYYY-MM-DD HH24:MI:SS'), '14', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL077', 'FLN1077', 'AL06', 'AC02', 'RT20', TO_DATE('2026-01-06 21:48:44', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-06 23:50:12', 'YYYY-MM-DD HH24:MI:SS'), '12', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL078', 'FLN1078', 'AL08', 'AC14', 'RT16', TO_DATE('2025-11-07 00:32:39', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-07 05:23:10', 'YYYY-MM-DD HH24:MI:SS'), '11', 'LANDED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL079', 'FLN1079', 'AL06', 'AC02', 'RT09', TO_DATE('2026-07-11 09:25:01', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-11 14:12:58', 'YYYY-MM-DD HH24:MI:SS'), '18', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL080', 'FLN1080', 'AL06', 'AC06', 'RT17', TO_DATE('2025-11-05 15:51:20', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-05 19:26:04', 'YYYY-MM-DD HH24:MI:SS'), '18', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL081', 'FLN1081', 'AL02', 'AC07', 'RT19', TO_DATE('2025-07-03 22:54:42', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-04 00:54:50', 'YYYY-MM-DD HH24:MI:SS'), '08', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL082', 'FLN1082', 'AL07', 'AC13', 'RT16', TO_DATE('2026-06-14 04:55:43', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-14 07:06:42', 'YYYY-MM-DD HH24:MI:SS'), '20', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL083', 'FLN1083', 'AL10', 'AC03', 'RT11', TO_DATE('2025-08-09 23:57:53', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-10 02:31:47', 'YYYY-MM-DD HH24:MI:SS'), '10', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL084', 'FLN1084', 'AL06', 'AC06', 'RT09', TO_DATE('2026-05-08 05:45:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-08 09:21:24', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL085', 'FLN1085', 'AL08', 'AC04', 'RT11', TO_DATE('2026-02-15 11:24:45', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-15 14:02:04', 'YYYY-MM-DD HH24:MI:SS'), '12', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL086', 'FLN1086', 'AL09', 'AC12', 'RT07', TO_DATE('2025-08-19 19:48:46', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-19 23:29:30', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL087', 'FLN1087', 'AL02', 'AC11', 'RT04', TO_DATE('2025-10-23 11:19:38', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-23 15:21:02', 'YYYY-MM-DD HH24:MI:SS'), '12', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL088', 'FLN1088', 'AL07', 'AC13', 'RT18', TO_DATE('2025-08-03 05:10:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-03 08:23:07', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL089', 'FLN1089', 'AL02', 'AC07', 'RT07', TO_DATE('2026-07-23 21:21:57', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-24 01:47:19', 'YYYY-MM-DD HH24:MI:SS'), '10', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL090', 'FLN1090', 'AL01', 'AC01', 'RT19', TO_DATE('2025-10-01 20:56:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-02 01:38:25', 'YYYY-MM-DD HH24:MI:SS'), '02', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL091', 'FLN1091', 'AL01', 'AC01', 'RT17', TO_DATE('2025-08-31 11:44:11', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-31 14:15:53', 'YYYY-MM-DD HH24:MI:SS'), '02', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL092', 'FLN1092', 'AL01', 'AC01', 'RT01', TO_DATE('2025-11-25 17:26:46', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-25 22:11:29', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL093', 'FLN1093', 'AL08', 'AC14', 'RT02', TO_DATE('2025-12-08 21:59:24', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-09 00:26:24', 'YYYY-MM-DD HH24:MI:SS'), '15', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL094', 'FLN1094', 'AL03', 'AC09', 'RT08', TO_DATE('2025-12-10 03:19:54', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-10 07:10:44', 'YYYY-MM-DD HH24:MI:SS'), '11', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL095', 'FLN1095', 'AL10', 'AC03', 'RT06', TO_DATE('2026-06-16 06:52:10', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-16 11:23:22', 'YYYY-MM-DD HH24:MI:SS'), '07', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL096', 'FLN1096', 'AL07', 'AC10', 'RT16', TO_DATE('2026-01-03 09:29:57', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-03 12:43:09', 'YYYY-MM-DD HH24:MI:SS'), '20', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL097', 'FLN1097', 'AL08', 'AC14', 'RT01', TO_DATE('2026-01-12 09:33:21', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-12 11:40:47', 'YYYY-MM-DD HH24:MI:SS'), '16', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL098', 'FLN1098', 'AL09', 'AC12', 'RT20', TO_DATE('2025-08-25 00:18:15', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-25 02:21:31', 'YYYY-MM-DD HH24:MI:SS'), '18', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL099', 'FLN1099', 'AL01', 'AC01', 'RT10', TO_DATE('2026-05-21 12:19:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-21 15:28:29', 'YYYY-MM-DD HH24:MI:SS'), '01', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL100', 'FLN1100', 'AL10', 'AC03', 'RT15', TO_DATE('2025-08-15 21:42:25', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-16 01:17:13', 'YYYY-MM-DD HH24:MI:SS'), '13', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL101', 'FLN1101', 'AL08', 'AC04', 'RT11', TO_DATE('2025-12-19 21:51:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-20 00:10:37', 'YYYY-MM-DD HH24:MI:SS'), '09', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL102', 'FLN1102', 'AL01', 'AC01', 'RT12', TO_DATE('2025-10-25 00:56:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-25 03:45:28', 'YYYY-MM-DD HH24:MI:SS'), '06', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL103', 'FLN1103', 'AL07', 'AC10', 'RT15', TO_DATE('2026-01-22 23:40:38', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-23 03:22:40', 'YYYY-MM-DD HH24:MI:SS'), '17', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL104', 'FLN1104', 'AL08', 'AC04', 'RT13', TO_DATE('2025-07-23 20:58:33', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-23 23:41:35', 'YYYY-MM-DD HH24:MI:SS'), '01', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL105', 'FLN1105', 'AL09', 'AC05', 'RT20', TO_DATE('2025-09-09 19:19:10', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-09 22:19:05', 'YYYY-MM-DD HH24:MI:SS'), '13', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL106', 'FLN1106', 'AL03', 'AC09', 'RT19', TO_DATE('2025-12-19 05:10:28', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-19 09:57:09', 'YYYY-MM-DD HH24:MI:SS'), '08', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL107', 'FLN1107', 'AL09', 'AC12', 'RT13', TO_DATE('2025-06-10 14:37:42', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-10 19:29:11', 'YYYY-MM-DD HH24:MI:SS'), '15', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL108', 'FLN1108', 'AL09', 'AC12', 'RT14', TO_DATE('2026-03-29 16:39:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-29 19:35:17', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL109', 'FLN1109', 'AL02', 'AC07', 'RT12', TO_DATE('2026-05-16 08:26:22', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-16 13:14:29', 'YYYY-MM-DD HH24:MI:SS'), '11', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL110', 'FLN1110', 'AL06', 'AC02', 'RT12', TO_DATE('2026-07-04 09:05:03', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-04 11:18:53', 'YYYY-MM-DD HH24:MI:SS'), '09', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL111', 'FLN1111', 'AL09', 'AC05', 'RT02', TO_DATE('2025-09-25 18:59:32', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-25 23:56:16', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL112', 'FLN1112', 'AL02', 'AC11', 'RT05', TO_DATE('2025-06-22 21:47:15', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-23 02:03:55', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL113', 'FLN1113', 'AL03', 'AC15', 'RT02', TO_DATE('2025-11-13 18:07:54', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-13 22:49:20', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL114', 'FLN1114', 'AL02', 'AC08', 'RT13', TO_DATE('2025-12-10 13:38:41', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-10 18:26:50', 'YYYY-MM-DD HH24:MI:SS'), '08', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL115', 'FLN1115', 'AL09', 'AC05', 'RT08', TO_DATE('2026-03-17 20:28:05', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-17 23:03:44', 'YYYY-MM-DD HH24:MI:SS'), '16', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL116', 'FLN1116', 'AL09', 'AC12', 'RT12', TO_DATE('2025-06-21 20:07:14', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-21 22:11:40', 'YYYY-MM-DD HH24:MI:SS'), '12', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL117', 'FLN1117', 'AL08', 'AC14', 'RT12', TO_DATE('2025-06-01 01:04:02', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-01 03:40:15', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL118', 'FLN1118', 'AL08', 'AC04', 'RT19', TO_DATE('2025-12-23 21:23:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-24 01:43:53', 'YYYY-MM-DD HH24:MI:SS'), '13', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL119', 'FLN1119', 'AL03', 'AC15', 'RT15', TO_DATE('2025-06-29 05:22:43', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-29 07:26:32', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL120', 'FLN1120', 'AL08', 'AC04', 'RT05', TO_DATE('2025-06-05 08:25:56', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-05 13:06:06', 'YYYY-MM-DD HH24:MI:SS'), '04', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL121', 'FLN1121', 'AL07', 'AC13', 'RT15', TO_DATE('2026-07-15 04:58:35', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-15 08:25:50', 'YYYY-MM-DD HH24:MI:SS'), '16', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL122', 'FLN1122', 'AL08', 'AC04', 'RT10', TO_DATE('2025-10-19 04:08:46', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-19 08:59:26', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL123', 'FLN1123', 'AL03', 'AC09', 'RT18', TO_DATE('2026-02-24 15:46:02', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-02-24 20:15:26', 'YYYY-MM-DD HH24:MI:SS'), '08', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL124', 'FLN1124', 'AL06', 'AC02', 'RT04', TO_DATE('2026-01-10 23:28:45', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-01-11 03:10:19', 'YYYY-MM-DD HH24:MI:SS'), '18', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL125', 'FLN1125', 'AL01', 'AC01', 'RT13', TO_DATE('2025-09-03 10:31:17', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-03 12:46:06', 'YYYY-MM-DD HH24:MI:SS'), '17', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL126', 'FLN1126', 'AL03', 'AC09', 'RT16', TO_DATE('2025-09-16 14:15:44', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-16 18:25:44', 'YYYY-MM-DD HH24:MI:SS'), '14', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL127', 'FLN1127', 'AL07', 'AC10', 'RT19', TO_DATE('2026-07-02 05:27:47', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-02 08:12:49', 'YYYY-MM-DD HH24:MI:SS'), '12', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL128', 'FLN1128', 'AL10', 'AC03', 'RT16', TO_DATE('2025-06-13 02:01:15', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-13 05:59:53', 'YYYY-MM-DD HH24:MI:SS'), '07', 'DELAYED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL129', 'FLN1129', 'AL03', 'AC15', 'RT01', TO_DATE('2026-05-18 23:05:32', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-19 03:21:29', 'YYYY-MM-DD HH24:MI:SS'), '07', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL130', 'FLN1130', 'AL07', 'AC13', 'RT02', TO_DATE('2025-11-17 12:27:44', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-17 16:43:38', 'YYYY-MM-DD HH24:MI:SS'), '06', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL131', 'FLN1131', 'AL02', 'AC11', 'RT09', TO_DATE('2025-10-19 13:56:59', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-10-19 17:20:40', 'YYYY-MM-DD HH24:MI:SS'), '17', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL132', 'FLN1132', 'AL09', 'AC12', 'RT13', TO_DATE('2025-07-19 08:15:01', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-19 10:52:08', 'YYYY-MM-DD HH24:MI:SS'), '08', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL133', 'FLN1133', 'AL09', 'AC12', 'RT07', TO_DATE('2025-06-06 15:35:15', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-06 17:57:00', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL134', 'FLN1134', 'AL09', 'AC12', 'RT09', TO_DATE('2025-11-04 20:39:27', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-11-05 01:30:35', 'YYYY-MM-DD HH24:MI:SS'), '13', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL135', 'FLN1135', 'AL08', 'AC04', 'RT19', TO_DATE('2025-06-23 16:04:55', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-23 18:16:14', 'YYYY-MM-DD HH24:MI:SS'), '05', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL136', 'FLN1136', 'AL01', 'AC01', 'RT20', TO_DATE('2025-06-21 11:57:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-21 14:49:58', 'YYYY-MM-DD HH24:MI:SS'), '09', 'CANCELLED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL137', 'FLN1137', 'AL03', 'AC09', 'RT13', TO_DATE('2025-09-08 11:57:52', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-08 16:12:57', 'YYYY-MM-DD HH24:MI:SS'), '12', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL138', 'FLN1138', 'AL10', 'AC03', 'RT08', TO_DATE('2025-06-07 14:43:28', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-06-07 18:18:54', 'YYYY-MM-DD HH24:MI:SS'), '04', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL139', 'FLN1139', 'AL03', 'AC09', 'RT12', TO_DATE('2025-12-19 03:55:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-19 07:11:33', 'YYYY-MM-DD HH24:MI:SS'), '19', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL140', 'FLN1140', 'AL08', 'AC04', 'RT04', TO_DATE('2026-07-16 04:43:28', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-16 07:42:51', 'YYYY-MM-DD HH24:MI:SS'), '17', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL141', 'FLN1141', 'AL01', 'AC01', 'RT14', TO_DATE('2025-12-09 01:04:01', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-09 03:32:20', 'YYYY-MM-DD HH24:MI:SS'), '13', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL142', 'FLN1142', 'AL10', 'AC03', 'RT20', TO_DATE('2026-06-24 13:37:43', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-24 16:43:08', 'YYYY-MM-DD HH24:MI:SS'), '03', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL143', 'FLN1143', 'AL02', 'AC11', 'RT18', TO_DATE('2025-12-12 18:12:21', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-12 22:52:22', 'YYYY-MM-DD HH24:MI:SS'), '19', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL144', 'FLN1144', 'AL09', 'AC12', 'RT09', TO_DATE('2025-08-30 16:23:33', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-08-30 19:53:54', 'YYYY-MM-DD HH24:MI:SS'), '04', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL145', 'FLN1145', 'AL08', 'AC04', 'RT04', TO_DATE('2026-06-18 20:56:32', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-19 00:12:06', 'YYYY-MM-DD HH24:MI:SS'), '03', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL146', 'FLN1146', 'AL10', 'AC03', 'RT17', TO_DATE('2025-09-22 17:45:55', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-22 21:22:10', 'YYYY-MM-DD HH24:MI:SS'), '15', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL147', 'FLN1147', 'AL06', 'AC06', 'RT05', TO_DATE('2025-12-04 19:03:17', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-12-04 21:14:06', 'YYYY-MM-DD HH24:MI:SS'), '14', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL148', 'FLN1148', 'AL02', 'AC11', 'RT01', TO_DATE('2026-07-13 04:03:46', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-07-13 07:14:01', 'YYYY-MM-DD HH24:MI:SS'), '20', 'SCHEDULED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL149', 'FLN1149', 'AL08', 'AC04', 'RT19', TO_DATE('2025-09-07 15:35:51', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-09-07 20:35:20', 'YYYY-MM-DD HH24:MI:SS'), '10', 'COMPLETED');
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) VALUES ('FL150', 'FLN1150', 'AL01', 'AC01', 'RT15', TO_DATE('2025-07-02 16:51:17', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2025-07-02 20:23:11', 'YYYY-MM-DD HH24:MI:SS'), '06', 'COMPLETED');

-- BẢNG GIÁ (SEATCLASSPRICE)
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL001_1', 'FL001', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL001_2', 'FL001', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL001_3', 'FL001', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL001_4', 'FL001', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL002_1', 'FL002', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL002_2', 'FL002', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL002_3', 'FL002', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL002_4', 'FL002', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL003_1', 'FL003', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL003_2', 'FL003', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL003_3', 'FL003', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL003_4', 'FL003', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL004_1', 'FL004', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL004_2', 'FL004', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL004_3', 'FL004', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL004_4', 'FL004', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL005_1', 'FL005', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL005_2', 'FL005', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL005_3', 'FL005', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL005_4', 'FL005', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL006_1', 'FL006', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL006_2', 'FL006', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL006_3', 'FL006', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL006_4', 'FL006', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL007_1', 'FL007', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL007_2', 'FL007', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL007_3', 'FL007', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL007_4', 'FL007', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL008_1', 'FL008', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL008_2', 'FL008', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL008_3', 'FL008', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL008_4', 'FL008', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL009_1', 'FL009', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL009_2', 'FL009', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL009_3', 'FL009', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL009_4', 'FL009', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL010_1', 'FL010', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL010_2', 'FL010', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL010_3', 'FL010', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL010_4', 'FL010', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL011_1', 'FL011', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL011_2', 'FL011', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL011_3', 'FL011', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL011_4', 'FL011', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL012_1', 'FL012', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL012_2', 'FL012', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL012_3', 'FL012', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL012_4', 'FL012', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL013_1', 'FL013', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL013_2', 'FL013', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL013_3', 'FL013', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL013_4', 'FL013', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL014_1', 'FL014', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL014_2', 'FL014', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL014_3', 'FL014', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL014_4', 'FL014', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL015_1', 'FL015', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL015_2', 'FL015', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL015_3', 'FL015', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL015_4', 'FL015', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL016_1', 'FL016', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL016_2', 'FL016', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL016_3', 'FL016', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL016_4', 'FL016', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL017_1', 'FL017', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL017_2', 'FL017', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL017_3', 'FL017', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL017_4', 'FL017', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL018_1', 'FL018', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL018_2', 'FL018', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL018_3', 'FL018', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL018_4', 'FL018', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL019_1', 'FL019', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL019_2', 'FL019', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL019_3', 'FL019', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL019_4', 'FL019', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL020_1', 'FL020', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL020_2', 'FL020', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL020_3', 'FL020', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL020_4', 'FL020', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL021_1', 'FL021', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL021_2', 'FL021', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL021_3', 'FL021', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL021_4', 'FL021', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL022_1', 'FL022', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL022_2', 'FL022', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL022_3', 'FL022', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL022_4', 'FL022', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL023_1', 'FL023', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL023_2', 'FL023', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL023_3', 'FL023', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL023_4', 'FL023', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL024_1', 'FL024', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL024_2', 'FL024', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL024_3', 'FL024', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL024_4', 'FL024', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL025_1', 'FL025', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL025_2', 'FL025', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL025_3', 'FL025', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL025_4', 'FL025', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL026_1', 'FL026', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL026_2', 'FL026', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL026_3', 'FL026', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL026_4', 'FL026', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL027_1', 'FL027', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL027_2', 'FL027', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL027_3', 'FL027', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL027_4', 'FL027', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL028_1', 'FL028', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL028_2', 'FL028', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL028_3', 'FL028', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL028_4', 'FL028', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL029_1', 'FL029', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL029_2', 'FL029', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL029_3', 'FL029', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL029_4', 'FL029', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL030_1', 'FL030', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL030_2', 'FL030', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL030_3', 'FL030', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL030_4', 'FL030', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL031_1', 'FL031', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL031_2', 'FL031', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL031_3', 'FL031', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL031_4', 'FL031', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL032_1', 'FL032', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL032_2', 'FL032', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL032_3', 'FL032', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL032_4', 'FL032', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL033_1', 'FL033', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL033_2', 'FL033', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL033_3', 'FL033', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL033_4', 'FL033', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL034_1', 'FL034', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL034_2', 'FL034', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL034_3', 'FL034', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL034_4', 'FL034', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL035_1', 'FL035', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL035_2', 'FL035', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL035_3', 'FL035', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL035_4', 'FL035', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL036_1', 'FL036', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL036_2', 'FL036', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL036_3', 'FL036', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL036_4', 'FL036', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL037_1', 'FL037', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL037_2', 'FL037', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL037_3', 'FL037', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL037_4', 'FL037', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL038_1', 'FL038', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL038_2', 'FL038', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL038_3', 'FL038', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL038_4', 'FL038', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL039_1', 'FL039', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL039_2', 'FL039', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL039_3', 'FL039', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL039_4', 'FL039', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL040_1', 'FL040', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL040_2', 'FL040', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL040_3', 'FL040', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL040_4', 'FL040', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL041_1', 'FL041', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL041_2', 'FL041', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL041_3', 'FL041', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL041_4', 'FL041', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL042_1', 'FL042', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL042_2', 'FL042', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL042_3', 'FL042', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL042_4', 'FL042', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL043_1', 'FL043', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL043_2', 'FL043', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL043_3', 'FL043', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL043_4', 'FL043', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL044_1', 'FL044', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL044_2', 'FL044', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL044_3', 'FL044', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL044_4', 'FL044', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL045_1', 'FL045', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL045_2', 'FL045', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL045_3', 'FL045', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL045_4', 'FL045', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL046_1', 'FL046', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL046_2', 'FL046', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL046_3', 'FL046', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL046_4', 'FL046', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL047_1', 'FL047', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL047_2', 'FL047', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL047_3', 'FL047', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL047_4', 'FL047', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL048_1', 'FL048', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL048_2', 'FL048', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL048_3', 'FL048', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL048_4', 'FL048', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL049_1', 'FL049', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL049_2', 'FL049', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL049_3', 'FL049', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL049_4', 'FL049', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL050_1', 'FL050', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL050_2', 'FL050', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL050_3', 'FL050', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL050_4', 'FL050', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL051_1', 'FL051', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL051_2', 'FL051', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL051_3', 'FL051', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL051_4', 'FL051', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL052_1', 'FL052', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL052_2', 'FL052', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL052_3', 'FL052', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL052_4', 'FL052', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL053_1', 'FL053', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL053_2', 'FL053', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL053_3', 'FL053', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL053_4', 'FL053', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL054_1', 'FL054', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL054_2', 'FL054', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL054_3', 'FL054', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL054_4', 'FL054', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL055_1', 'FL055', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL055_2', 'FL055', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL055_3', 'FL055', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL055_4', 'FL055', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL056_1', 'FL056', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL056_2', 'FL056', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL056_3', 'FL056', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL056_4', 'FL056', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL057_1', 'FL057', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL057_2', 'FL057', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL057_3', 'FL057', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL057_4', 'FL057', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL058_1', 'FL058', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL058_2', 'FL058', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL058_3', 'FL058', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL058_4', 'FL058', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL059_1', 'FL059', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL059_2', 'FL059', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL059_3', 'FL059', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL059_4', 'FL059', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL060_1', 'FL060', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL060_2', 'FL060', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL060_3', 'FL060', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL060_4', 'FL060', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL061_1', 'FL061', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL061_2', 'FL061', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL061_3', 'FL061', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL061_4', 'FL061', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL062_1', 'FL062', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL062_2', 'FL062', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL062_3', 'FL062', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL062_4', 'FL062', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL063_1', 'FL063', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL063_2', 'FL063', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL063_3', 'FL063', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL063_4', 'FL063', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL064_1', 'FL064', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL064_2', 'FL064', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL064_3', 'FL064', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL064_4', 'FL064', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL065_1', 'FL065', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL065_2', 'FL065', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL065_3', 'FL065', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL065_4', 'FL065', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL066_1', 'FL066', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL066_2', 'FL066', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL066_3', 'FL066', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL066_4', 'FL066', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL067_1', 'FL067', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL067_2', 'FL067', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL067_3', 'FL067', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL067_4', 'FL067', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL068_1', 'FL068', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL068_2', 'FL068', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL068_3', 'FL068', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL068_4', 'FL068', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL069_1', 'FL069', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL069_2', 'FL069', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL069_3', 'FL069', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL069_4', 'FL069', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL070_1', 'FL070', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL070_2', 'FL070', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL070_3', 'FL070', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL070_4', 'FL070', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL071_1', 'FL071', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL071_2', 'FL071', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL071_3', 'FL071', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL071_4', 'FL071', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL072_1', 'FL072', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL072_2', 'FL072', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL072_3', 'FL072', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL072_4', 'FL072', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL073_1', 'FL073', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL073_2', 'FL073', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL073_3', 'FL073', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL073_4', 'FL073', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL074_1', 'FL074', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL074_2', 'FL074', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL074_3', 'FL074', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL074_4', 'FL074', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL075_1', 'FL075', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL075_2', 'FL075', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL075_3', 'FL075', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL075_4', 'FL075', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL076_1', 'FL076', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL076_2', 'FL076', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL076_3', 'FL076', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL076_4', 'FL076', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL077_1', 'FL077', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL077_2', 'FL077', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL077_3', 'FL077', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL077_4', 'FL077', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL078_1', 'FL078', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL078_2', 'FL078', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL078_3', 'FL078', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL078_4', 'FL078', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL079_1', 'FL079', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL079_2', 'FL079', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL079_3', 'FL079', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL079_4', 'FL079', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL080_1', 'FL080', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL080_2', 'FL080', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL080_3', 'FL080', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL080_4', 'FL080', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL081_1', 'FL081', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL081_2', 'FL081', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL081_3', 'FL081', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL081_4', 'FL081', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL082_1', 'FL082', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL082_2', 'FL082', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL082_3', 'FL082', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL082_4', 'FL082', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL083_1', 'FL083', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL083_2', 'FL083', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL083_3', 'FL083', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL083_4', 'FL083', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL084_1', 'FL084', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL084_2', 'FL084', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL084_3', 'FL084', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL084_4', 'FL084', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL085_1', 'FL085', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL085_2', 'FL085', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL085_3', 'FL085', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL085_4', 'FL085', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL086_1', 'FL086', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL086_2', 'FL086', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL086_3', 'FL086', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL086_4', 'FL086', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL087_1', 'FL087', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL087_2', 'FL087', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL087_3', 'FL087', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL087_4', 'FL087', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL088_1', 'FL088', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL088_2', 'FL088', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL088_3', 'FL088', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL088_4', 'FL088', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL089_1', 'FL089', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL089_2', 'FL089', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL089_3', 'FL089', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL089_4', 'FL089', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL090_1', 'FL090', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL090_2', 'FL090', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL090_3', 'FL090', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL090_4', 'FL090', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL091_1', 'FL091', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL091_2', 'FL091', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL091_3', 'FL091', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL091_4', 'FL091', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL092_1', 'FL092', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL092_2', 'FL092', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL092_3', 'FL092', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL092_4', 'FL092', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL093_1', 'FL093', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL093_2', 'FL093', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL093_3', 'FL093', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL093_4', 'FL093', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL094_1', 'FL094', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL094_2', 'FL094', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL094_3', 'FL094', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL094_4', 'FL094', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL095_1', 'FL095', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL095_2', 'FL095', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL095_3', 'FL095', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL095_4', 'FL095', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL096_1', 'FL096', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL096_2', 'FL096', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL096_3', 'FL096', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL096_4', 'FL096', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL097_1', 'FL097', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL097_2', 'FL097', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL097_3', 'FL097', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL097_4', 'FL097', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL098_1', 'FL098', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL098_2', 'FL098', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL098_3', 'FL098', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL098_4', 'FL098', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL099_1', 'FL099', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL099_2', 'FL099', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL099_3', 'FL099', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL099_4', 'FL099', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL100_1', 'FL100', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL100_2', 'FL100', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL100_3', 'FL100', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL100_4', 'FL100', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL101_1', 'FL101', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL101_2', 'FL101', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL101_3', 'FL101', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL101_4', 'FL101', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL102_1', 'FL102', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL102_2', 'FL102', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL102_3', 'FL102', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL102_4', 'FL102', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL103_1', 'FL103', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL103_2', 'FL103', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL103_3', 'FL103', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL103_4', 'FL103', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL104_1', 'FL104', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL104_2', 'FL104', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL104_3', 'FL104', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL104_4', 'FL104', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL105_1', 'FL105', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL105_2', 'FL105', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL105_3', 'FL105', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL105_4', 'FL105', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL106_1', 'FL106', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL106_2', 'FL106', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL106_3', 'FL106', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL106_4', 'FL106', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL107_1', 'FL107', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL107_2', 'FL107', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL107_3', 'FL107', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL107_4', 'FL107', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL108_1', 'FL108', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL108_2', 'FL108', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL108_3', 'FL108', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL108_4', 'FL108', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL109_1', 'FL109', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL109_2', 'FL109', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL109_3', 'FL109', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL109_4', 'FL109', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL110_1', 'FL110', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL110_2', 'FL110', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL110_3', 'FL110', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL110_4', 'FL110', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL111_1', 'FL111', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL111_2', 'FL111', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL111_3', 'FL111', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL111_4', 'FL111', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL112_1', 'FL112', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL112_2', 'FL112', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL112_3', 'FL112', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL112_4', 'FL112', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL113_1', 'FL113', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL113_2', 'FL113', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL113_3', 'FL113', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL113_4', 'FL113', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL114_1', 'FL114', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL114_2', 'FL114', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL114_3', 'FL114', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL114_4', 'FL114', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL115_1', 'FL115', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL115_2', 'FL115', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL115_3', 'FL115', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL115_4', 'FL115', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL116_1', 'FL116', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL116_2', 'FL116', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL116_3', 'FL116', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL116_4', 'FL116', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL117_1', 'FL117', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL117_2', 'FL117', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL117_3', 'FL117', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL117_4', 'FL117', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL118_1', 'FL118', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL118_2', 'FL118', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL118_3', 'FL118', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL118_4', 'FL118', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL119_1', 'FL119', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL119_2', 'FL119', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL119_3', 'FL119', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL119_4', 'FL119', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL120_1', 'FL120', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL120_2', 'FL120', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL120_3', 'FL120', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL120_4', 'FL120', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL121_1', 'FL121', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL121_2', 'FL121', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL121_3', 'FL121', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL121_4', 'FL121', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL122_1', 'FL122', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL122_2', 'FL122', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL122_3', 'FL122', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL122_4', 'FL122', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL123_1', 'FL123', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL123_2', 'FL123', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL123_3', 'FL123', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL123_4', 'FL123', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL124_1', 'FL124', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL124_2', 'FL124', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL124_3', 'FL124', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL124_4', 'FL124', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL125_1', 'FL125', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL125_2', 'FL125', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL125_3', 'FL125', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL125_4', 'FL125', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL126_1', 'FL126', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL126_2', 'FL126', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL126_3', 'FL126', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL126_4', 'FL126', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL127_1', 'FL127', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL127_2', 'FL127', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL127_3', 'FL127', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL127_4', 'FL127', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL128_1', 'FL128', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL128_2', 'FL128', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL128_3', 'FL128', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL128_4', 'FL128', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL129_1', 'FL129', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL129_2', 'FL129', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL129_3', 'FL129', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL129_4', 'FL129', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL130_1', 'FL130', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL130_2', 'FL130', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL130_3', 'FL130', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL130_4', 'FL130', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL131_1', 'FL131', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL131_2', 'FL131', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL131_3', 'FL131', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL131_4', 'FL131', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL132_1', 'FL132', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL132_2', 'FL132', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL132_3', 'FL132', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL132_4', 'FL132', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL133_1', 'FL133', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL133_2', 'FL133', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL133_3', 'FL133', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL133_4', 'FL133', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL134_1', 'FL134', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL134_2', 'FL134', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL134_3', 'FL134', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL134_4', 'FL134', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL135_1', 'FL135', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL135_2', 'FL135', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL135_3', 'FL135', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL135_4', 'FL135', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL136_1', 'FL136', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL136_2', 'FL136', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL136_3', 'FL136', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL136_4', 'FL136', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL137_1', 'FL137', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL137_2', 'FL137', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL137_3', 'FL137', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL137_4', 'FL137', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL138_1', 'FL138', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL138_2', 'FL138', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL138_3', 'FL138', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL138_4', 'FL138', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL139_1', 'FL139', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL139_2', 'FL139', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL139_3', 'FL139', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL139_4', 'FL139', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL140_1', 'FL140', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL140_2', 'FL140', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL140_3', 'FL140', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL140_4', 'FL140', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL141_1', 'FL141', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL141_2', 'FL141', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL141_3', 'FL141', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL141_4', 'FL141', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL142_1', 'FL142', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL142_2', 'FL142', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL142_3', 'FL142', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL142_4', 'FL142', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL143_1', 'FL143', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL143_2', 'FL143', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL143_3', 'FL143', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL143_4', 'FL143', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL144_1', 'FL144', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL144_2', 'FL144', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL144_3', 'FL144', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL144_4', 'FL144', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL145_1', 'FL145', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL145_2', 'FL145', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL145_3', 'FL145', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL145_4', 'FL145', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL146_1', 'FL146', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL146_2', 'FL146', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL146_3', 'FL146', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL146_4', 'FL146', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL147_1', 'FL147', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL147_2', 'FL147', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL147_3', 'FL147', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL147_4', 'FL147', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL148_1', 'FL148', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL148_2', 'FL148', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL148_3', 'FL148', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL148_4', 'FL148', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL149_1', 'FL149', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL149_2', 'FL149', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL149_3', 'FL149', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL149_4', 'FL149', 'Economy', 3000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL150_1', 'FL150', 'First Class', 9000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL150_2', 'FL150', 'Business', 5000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL150_3', 'FL150', 'Premium Economy', 4000000);
INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES ('FL150_4', 'FL150', 'Economy', 3000000);

/* =========================================================
   4. ĐẶT VÉ VÀ THANH TOÁN (BOOKING & PAYMENT)
   ========================================================= */
-- BẢNG ĐẶT CHỖ (BOOKING)
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0001', 'CUS30', 'EMP01', TO_DATE('2026-06-21 19:25:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0002', 'CUS17', 'EMP02', TO_DATE('2026-01-25 22:43:54', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0003', 'CUS06', 'EMP03', TO_DATE('2025-09-21 19:29:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0004', 'CUS29', 'EMP03', TO_DATE('2025-09-11 23:04:51', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0005', 'CUS35', 'EMP04', TO_DATE('2025-10-04 22:01:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0006', 'CUS01', 'EMP03', TO_DATE('2026-05-19 02:22:37', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0007', 'CUS07', 'EMP02', TO_DATE('2025-12-26 22:58:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0008', 'CUS07', 'EMP03', TO_DATE('2026-01-05 20:39:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0009', 'CUS21', 'EMP02', TO_DATE('2025-07-07 05:31:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0010', 'CUS05', 'EMP04', TO_DATE('2025-05-11 00:15:38', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0011', 'CUS16', 'EMP05', TO_DATE('2026-05-27 22:51:02', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0012', 'CUS01', 'EMP05', TO_DATE('2026-07-02 11:56:04', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0013', 'CUS15', 'EMP02', TO_DATE('2026-07-04 22:31:19', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0014', 'CUS31', 'EMP03', TO_DATE('2025-12-11 02:31:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0015', 'CUS01', 'EMP02', TO_DATE('2025-12-10 10:12:28', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0016', 'CUS07', 'EMP01', TO_DATE('2026-04-26 01:54:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0017', 'CUS09', 'EMP04', TO_DATE('2025-10-10 15:48:46', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0018', 'CUS28', 'EMP03', TO_DATE('2025-09-04 08:05:34', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0019', 'CUS23', 'EMP01', TO_DATE('2025-10-28 23:07:40', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0020', 'CUS25', 'EMP05', TO_DATE('2025-06-28 09:55:22', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0021', 'CUS20', 'EMP02', TO_DATE('2025-10-06 06:07:09', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0022', 'CUS29', 'EMP02', TO_DATE('2026-03-22 16:48:05', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0023', 'CUS33', 'EMP03', TO_DATE('2026-05-09 12:35:08', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0024', 'CUS06', 'EMP01', TO_DATE('2025-06-04 11:47:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0025', 'CUS16', 'EMP05', TO_DATE('2026-07-11 13:15:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0026', 'CUS25', 'EMP03', TO_DATE('2026-02-27 09:49:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0027', 'CUS33', 'EMP01', TO_DATE('2025-09-21 23:33:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0028', 'CUS01', 'EMP02', TO_DATE('2025-12-14 04:07:55', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0029', 'CUS15', 'EMP03', TO_DATE('2026-02-12 22:27:40', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0030', 'CUS16', 'EMP04', TO_DATE('2025-08-25 07:11:35', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0031', 'CUS33', 'EMP01', TO_DATE('2025-09-01 10:46:11', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0032', 'CUS17', 'EMP03', TO_DATE('2025-06-03 19:14:53', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0033', 'CUS22', 'EMP05', TO_DATE('2026-02-14 10:44:54', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0034', 'CUS13', 'EMP05', TO_DATE('2025-11-28 08:21:46', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0035', 'CUS30', 'EMP01', TO_DATE('2025-09-22 23:22:09', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0036', 'CUS03', 'EMP01', TO_DATE('2025-08-23 09:36:04', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0037', 'CUS26', 'EMP04', TO_DATE('2026-05-16 20:14:20', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0038', 'CUS26', 'EMP01', TO_DATE('2025-11-12 07:20:30', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0039', 'CUS33', 'EMP04', TO_DATE('2025-09-26 01:59:39', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0040', 'CUS29', 'EMP01', TO_DATE('2026-05-10 17:06:59', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0041', 'CUS13', 'EMP04', TO_DATE('2026-04-30 11:37:49', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0042', 'CUS29', 'EMP02', TO_DATE('2025-11-20 17:29:22', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0043', 'CUS25', 'EMP05', TO_DATE('2026-05-13 09:47:18', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0044', 'CUS04', 'EMP03', TO_DATE('2025-08-16 20:16:31', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0045', 'CUS19', 'EMP01', TO_DATE('2025-07-30 05:09:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0046', 'CUS23', 'EMP01', TO_DATE('2025-08-21 13:00:59', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0047', 'CUS07', 'EMP04', TO_DATE('2026-05-01 05:02:34', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0048', 'CUS10', 'EMP01', TO_DATE('2026-06-07 09:45:24', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0049', 'CUS06', 'EMP02', TO_DATE('2025-11-16 00:24:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0050', 'CUS31', 'EMP04', TO_DATE('2025-09-21 02:31:36', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0051', 'CUS18', 'EMP02', TO_DATE('2025-07-29 12:56:13', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0052', 'CUS04', 'EMP01', TO_DATE('2026-01-02 22:28:19', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0053', 'CUS31', 'EMP02', TO_DATE('2026-04-04 07:06:53', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0054', 'CUS27', 'EMP05', TO_DATE('2025-11-08 08:53:02', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0055', 'CUS11', 'EMP01', TO_DATE('2026-05-20 05:27:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0056', 'CUS12', 'EMP04', TO_DATE('2026-01-12 20:50:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0057', 'CUS15', 'EMP04', TO_DATE('2026-05-10 20:46:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0058', 'CUS25', 'EMP01', TO_DATE('2026-03-26 03:49:59', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0059', 'CUS03', 'EMP05', TO_DATE('2025-08-11 04:32:18', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0060', 'CUS20', 'EMP03', TO_DATE('2025-09-19 18:18:48', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0061', 'CUS33', 'EMP02', TO_DATE('2025-11-25 15:33:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0062', 'CUS07', 'EMP01', TO_DATE('2026-04-23 02:01:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0063', 'CUS02', 'EMP04', TO_DATE('2025-10-02 15:03:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0064', 'CUS30', 'EMP01', TO_DATE('2026-06-15 05:52:55', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0065', 'CUS19', 'EMP05', TO_DATE('2026-07-02 07:07:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'PENDING');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0066', 'CUS10', 'EMP03', TO_DATE('2025-09-03 02:54:01', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0067', 'CUS11', 'EMP02', TO_DATE('2025-06-20 11:14:24', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0068', 'CUS30', 'EMP04', TO_DATE('2025-08-17 16:06:20', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0069', 'CUS06', 'EMP03', TO_DATE('2025-06-18 01:05:05', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0070', 'CUS08', 'EMP05', TO_DATE('2025-08-18 19:28:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0071', 'CUS02', 'EMP01', TO_DATE('2025-07-25 20:59:38', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0072', 'CUS09', 'EMP01', TO_DATE('2025-07-29 03:14:50', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0073', 'CUS07', 'EMP05', TO_DATE('2026-05-13 06:28:22', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0074', 'CUS21', 'EMP04', TO_DATE('2025-10-25 08:49:18', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0075', 'CUS09', 'EMP05', TO_DATE('2025-08-10 03:56:11', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0076', 'CUS20', 'EMP02', TO_DATE('2026-06-26 21:36:14', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0077', 'CUS31', 'EMP01', TO_DATE('2026-04-21 07:12:29', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0078', 'CUS07', 'EMP02', TO_DATE('2025-08-23 13:23:05', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0079', 'CUS13', 'EMP02', TO_DATE('2025-11-29 15:24:15', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0080', 'CUS04', 'EMP04', TO_DATE('2026-04-25 14:10:21', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0081', 'CUS17', 'EMP02', TO_DATE('2026-06-01 14:07:38', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0082', 'CUS03', 'EMP04', TO_DATE('2025-06-19 18:11:46', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0083', 'CUS01', 'EMP03', TO_DATE('2025-09-19 17:04:09', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0084', 'CUS14', 'EMP04', TO_DATE('2025-12-16 10:16:54', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0085', 'CUS28', 'EMP02', TO_DATE('2026-05-12 14:01:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0086', 'CUS33', 'EMP03', TO_DATE('2025-09-28 01:40:31', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0087', 'CUS32', 'EMP05', TO_DATE('2025-09-17 03:33:04', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0088', 'CUS25', 'EMP05', TO_DATE('2025-10-06 06:49:00', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0089', 'CUS30', 'EMP05', TO_DATE('2025-06-30 18:28:21', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0090', 'CUS25', 'EMP01', TO_DATE('2025-09-16 17:40:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0091', 'CUS04', 'EMP05', TO_DATE('2025-05-28 21:06:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0092', 'CUS16', 'EMP04', TO_DATE('2025-08-26 20:57:02', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0093', 'CUS19', 'EMP05', TO_DATE('2025-08-16 02:25:52', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0094', 'CUS15', 'EMP03', TO_DATE('2026-04-17 01:49:10', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0095', 'CUS23', 'EMP02', TO_DATE('2025-10-01 08:47:44', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0096', 'CUS30', 'EMP01', TO_DATE('2026-02-24 11:04:57', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0097', 'CUS21', 'EMP02', TO_DATE('2025-08-13 03:03:19', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0098', 'CUS01', 'EMP04', TO_DATE('2025-12-18 19:25:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0099', 'CUS20', 'EMP01', TO_DATE('2025-08-04 00:30:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0100', 'CUS23', 'EMP01', TO_DATE('2025-10-18 19:42:00', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0101', 'CUS13', 'EMP05', TO_DATE('2026-06-27 15:42:59', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'PENDING');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0102', 'CUS28', 'EMP05', TO_DATE('2026-04-06 00:14:41', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0103', 'CUS34', 'EMP02', TO_DATE('2026-01-01 15:31:34', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0104', 'CUS02', 'EMP02', TO_DATE('2025-12-10 20:50:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0105', 'CUS26', 'EMP02', TO_DATE('2025-09-13 00:33:46', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0106', 'CUS23', 'EMP03', TO_DATE('2026-05-17 08:22:50', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0107', 'CUS32', 'EMP05', TO_DATE('2025-12-14 05:51:08', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0108', 'CUS34', 'EMP04', TO_DATE('2026-07-09 08:23:40', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'PENDING');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0109', 'CUS12', 'EMP03', TO_DATE('2026-02-05 04:49:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0110', 'CUS27', 'EMP04', TO_DATE('2025-05-14 04:24:59', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0111', 'CUS13', 'EMP01', TO_DATE('2026-02-26 17:11:47', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0112', 'CUS09', 'EMP03', TO_DATE('2025-08-21 23:13:05', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0113', 'CUS11', 'EMP03', TO_DATE('2026-04-11 09:40:10', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0114', 'CUS28', 'EMP03', TO_DATE('2025-12-23 04:14:49', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0115', 'CUS09', 'EMP01', TO_DATE('2026-05-11 01:07:08', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0116', 'CUS17', 'EMP05', TO_DATE('2025-10-21 11:56:29', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0117', 'CUS16', 'EMP05', TO_DATE('2026-01-02 14:33:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0118', 'CUS09', 'EMP03', TO_DATE('2026-04-20 14:12:26', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0119', 'CUS07', 'EMP05', TO_DATE('2026-05-18 16:11:18', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0120', 'CUS19', 'EMP05', TO_DATE('2025-07-05 21:09:33', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0121', 'CUS22', 'EMP01', TO_DATE('2026-06-11 03:17:35', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0122', 'CUS35', 'EMP01', TO_DATE('2025-12-13 09:51:23', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0123', 'CUS22', 'EMP02', TO_DATE('2026-05-31 12:28:15', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0124', 'CUS20', 'EMP02', TO_DATE('2025-10-14 08:56:44', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0125', 'CUS06', 'EMP03', TO_DATE('2025-06-03 17:06:50', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0126', 'CUS06', 'EMP05', TO_DATE('2025-08-03 02:22:37', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0127', 'CUS25', 'EMP02', TO_DATE('2026-04-14 02:17:31', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0128', 'CUS14', 'EMP02', TO_DATE('2025-10-16 11:55:43', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0129', 'CUS33', 'EMP03', TO_DATE('2025-12-17 02:35:07', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0130', 'CUS17', 'EMP03', TO_DATE('2025-05-24 03:06:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0131', 'CUS31', 'EMP05', TO_DATE('2025-06-30 22:00:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0132', 'CUS20', 'EMP01', TO_DATE('2025-11-28 19:04:23', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0133', 'CUS22', 'EMP04', TO_DATE('2026-04-29 21:08:19', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0134', 'CUS10', 'EMP05', TO_DATE('2026-03-31 00:02:46', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0135', 'CUS31', 'EMP05', TO_DATE('2025-12-03 11:02:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0136', 'CUS10', 'EMP02', TO_DATE('2026-01-19 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0137', 'CUS04', 'EMP05', TO_DATE('2025-09-27 19:42:51', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0138', 'CUS20', 'EMP04', TO_DATE('2026-06-19 00:54:15', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0139', 'CUS10', 'EMP03', TO_DATE('2025-11-16 12:02:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0140', 'CUS33', 'EMP05', TO_DATE('2025-09-02 13:18:58', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0141', 'CUS24', 'EMP05', TO_DATE('2025-07-05 23:10:28', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0142', 'CUS29', 'EMP03', TO_DATE('2025-06-19 21:56:47', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0143', 'CUS20', 'EMP04', TO_DATE('2025-12-09 17:48:28', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0144', 'CUS18', 'EMP03', TO_DATE('2026-05-01 10:29:58', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0145', 'CUS13', 'EMP04', TO_DATE('2026-05-04 18:20:08', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0146', 'CUS26', 'EMP02', TO_DATE('2025-12-28 04:20:39', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0147', 'CUS19', 'EMP01', TO_DATE('2025-12-29 21:24:44', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0148', 'CUS28', 'EMP04', TO_DATE('2025-10-27 19:18:16', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0149', 'CUS06', 'EMP03', TO_DATE('2025-11-28 09:39:19', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0150', 'CUS16', 'EMP05', TO_DATE('2026-06-27 12:41:36', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0151', 'CUS07', 'EMP05', TO_DATE('2026-01-10 01:23:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0152', 'CUS28', 'EMP01', TO_DATE('2026-05-29 06:01:59', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0153', 'CUS32', 'EMP05', TO_DATE('2026-05-30 05:12:13', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0154', 'CUS17', 'EMP03', TO_DATE('2025-12-03 20:39:43', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0155', 'CUS28', 'EMP04', TO_DATE('2026-02-11 20:58:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0156', 'CUS35', 'EMP02', TO_DATE('2026-06-22 00:52:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0157', 'CUS24', 'EMP04', TO_DATE('2025-05-29 05:19:43', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0158', 'CUS32', 'EMP02', TO_DATE('2025-09-21 22:48:56', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0159', 'CUS21', 'EMP01', TO_DATE('2025-05-26 16:35:11', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0160', 'CUS16', 'EMP04', TO_DATE('2025-09-03 01:27:55', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0161', 'CUS16', 'EMP05', TO_DATE('2026-04-15 19:36:03', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0162', 'CUS26', 'EMP02', TO_DATE('2026-04-05 02:51:47', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0163', 'CUS02', 'EMP04', TO_DATE('2026-01-20 04:59:01', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0164', 'CUS17', 'EMP05', TO_DATE('2026-06-04 12:59:02', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0165', 'CUS06', 'EMP03', TO_DATE('2025-05-29 20:57:29', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0166', 'CUS20', 'EMP01', TO_DATE('2026-06-09 21:55:26', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0167', 'CUS07', 'EMP01', TO_DATE('2026-05-20 20:23:56', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0168', 'CUS31', 'EMP02', TO_DATE('2026-05-02 11:20:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0169', 'CUS01', 'EMP01', TO_DATE('2025-10-24 03:58:50', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0170', 'CUS15', 'EMP01', TO_DATE('2025-11-08 05:30:25', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0171', 'CUS05', 'EMP05', TO_DATE('2025-06-22 06:42:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0172', 'CUS02', 'EMP02', TO_DATE('2025-06-08 20:25:25', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0173', 'CUS17', 'EMP02', TO_DATE('2025-06-05 00:05:23', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0174', 'CUS23', 'EMP01', TO_DATE('2026-05-29 08:34:10', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0175', 'CUS08', 'EMP02', TO_DATE('2025-09-07 15:47:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0176', 'CUS34', 'EMP04', TO_DATE('2026-04-19 18:22:07', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0177', 'CUS12', 'EMP03', TO_DATE('2025-12-31 23:27:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0178', 'CUS33', 'EMP01', TO_DATE('2026-01-14 22:48:12', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0179', 'CUS11', 'EMP04', TO_DATE('2025-06-27 10:13:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0180', 'CUS15', 'EMP05', TO_DATE('2025-11-02 23:12:01', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0181', 'CUS01', 'EMP03', TO_DATE('2025-05-25 19:48:19', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0182', 'CUS04', 'EMP02', TO_DATE('2025-10-21 13:15:28', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0183', 'CUS04', 'EMP03', TO_DATE('2025-11-20 19:55:08', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0184', 'CUS15', 'EMP03', TO_DATE('2025-09-01 01:29:46', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0185', 'CUS35', 'EMP03', TO_DATE('2026-06-10 09:44:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0186', 'CUS19', 'EMP02', TO_DATE('2025-08-20 04:58:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0187', 'CUS30', 'EMP03', TO_DATE('2025-12-21 10:31:45', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0188', 'CUS18', 'EMP05', TO_DATE('2026-01-08 07:19:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0189', 'CUS22', 'EMP03', TO_DATE('2026-06-04 23:37:54', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0190', 'CUS14', 'EMP05', TO_DATE('2025-06-22 04:50:45', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0191', 'CUS02', 'EMP02', TO_DATE('2025-09-14 11:54:05', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0192', 'CUS16', 'EMP05', TO_DATE('2025-10-14 01:48:06', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0193', 'CUS30', 'EMP05', TO_DATE('2026-01-26 00:23:09', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0194', 'CUS13', 'EMP01', TO_DATE('2025-08-26 20:51:00', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0195', 'CUS01', 'EMP02', TO_DATE('2025-12-08 19:39:47', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0196', 'CUS09', 'EMP03', TO_DATE('2026-07-08 15:22:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'PENDING');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0197', 'CUS14', 'EMP04', TO_DATE('2025-10-01 01:00:36', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0198', 'CUS16', 'EMP02', TO_DATE('2026-07-08 14:21:07', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0199', 'CUS13', 'EMP04', TO_DATE('2025-12-18 19:51:19', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0200', 'CUS21', 'EMP04', TO_DATE('2025-07-26 00:55:36', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0201', 'CUS12', 'EMP03', TO_DATE('2025-07-05 07:48:13', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0202', 'CUS33', 'EMP03', TO_DATE('2025-08-01 19:33:02', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0203', 'CUS34', 'EMP02', TO_DATE('2025-08-08 00:02:54', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0204', 'CUS20', 'EMP05', TO_DATE('2026-01-21 00:34:25', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0205', 'CUS17', 'EMP04', TO_DATE('2026-07-09 23:29:30', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0206', 'CUS05', 'EMP04', TO_DATE('2025-06-19 02:42:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0207', 'CUS18', 'EMP02', TO_DATE('2025-12-05 23:18:46', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0208', 'CUS10', 'EMP02', TO_DATE('2025-06-25 08:36:56', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0209', 'CUS30', 'EMP04', TO_DATE('2026-01-24 01:57:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0210', 'CUS03', 'EMP02', TO_DATE('2025-05-14 11:50:29', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0211', 'CUS12', 'EMP03', TO_DATE('2025-11-13 21:09:03', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0212', 'CUS18', 'EMP05', TO_DATE('2026-06-23 13:04:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0213', 'CUS14', 'EMP04', TO_DATE('2026-07-08 00:07:27', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0214', 'CUS04', 'EMP03', TO_DATE('2025-06-08 02:24:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0215', 'CUS17', 'EMP01', TO_DATE('2026-05-07 01:07:07', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0216', 'CUS15', 'EMP04', TO_DATE('2026-06-03 18:52:51', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0217', 'CUS16', 'EMP05', TO_DATE('2026-01-14 11:00:32', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0218', 'CUS08', 'EMP01', TO_DATE('2025-05-27 14:47:19', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0219', 'CUS18', 'EMP05', TO_DATE('2026-07-01 21:25:20', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0220', 'CUS29', 'EMP01', TO_DATE('2026-03-24 14:21:01', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0221', 'CUS07', 'EMP02', TO_DATE('2025-09-14 14:21:19', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0222', 'CUS16', 'EMP01', TO_DATE('2025-07-22 19:37:18', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0223', 'CUS32', 'EMP02', TO_DATE('2025-08-25 20:45:34', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0224', 'CUS20', 'EMP05', TO_DATE('2025-10-13 17:56:08', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0225', 'CUS22', 'EMP03', TO_DATE('2026-01-20 16:45:06', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0226', 'CUS27', 'EMP05', TO_DATE('2025-06-19 01:55:18', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0227', 'CUS10', 'EMP05', TO_DATE('2026-03-13 10:14:07', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0228', 'CUS33', 'EMP02', TO_DATE('2025-06-01 16:57:16', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0229', 'CUS13', 'EMP05', TO_DATE('2026-03-19 13:52:02', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0230', 'CUS21', 'EMP02', TO_DATE('2025-12-29 16:09:20', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0231', 'CUS29', 'EMP03', TO_DATE('2026-06-03 23:46:10', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0232', 'CUS25', 'EMP04', TO_DATE('2025-10-24 13:02:38', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0233', 'CUS06', 'EMP05', TO_DATE('2025-09-25 00:25:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0234', 'CUS23', 'EMP01', TO_DATE('2026-04-25 15:40:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0235', 'CUS12', 'EMP03', TO_DATE('2026-04-20 10:21:56', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0236', 'CUS07', 'EMP04', TO_DATE('2026-05-14 12:12:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0237', 'CUS23', 'EMP01', TO_DATE('2025-06-26 09:06:15', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0238', 'CUS22', 'EMP04', TO_DATE('2025-06-27 13:31:53', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0239', 'CUS05', 'EMP03', TO_DATE('2025-11-20 04:47:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0240', 'CUS14', 'EMP03', TO_DATE('2026-07-07 02:02:15', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0241', 'CUS30', 'EMP05', TO_DATE('2025-11-30 01:20:45', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0242', 'CUS30', 'EMP03', TO_DATE('2026-06-28 11:50:30', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0243', 'CUS14', 'EMP02', TO_DATE('2025-12-01 02:51:40', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0244', 'CUS10', 'EMP03', TO_DATE('2025-11-04 07:49:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0245', 'CUS07', 'EMP01', TO_DATE('2025-06-05 14:14:12', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0246', 'CUS08', 'EMP02', TO_DATE('2025-07-22 11:29:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0247', 'CUS29', 'EMP01', TO_DATE('2025-08-13 04:58:59', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0248', 'CUS15', 'EMP04', TO_DATE('2025-06-04 12:09:52', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0249', 'CUS11', 'EMP04', TO_DATE('2025-06-13 14:15:34', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0250', 'CUS27', 'EMP05', TO_DATE('2026-06-18 01:37:43', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0251', 'CUS27', 'EMP03', TO_DATE('2025-09-21 06:15:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0252', 'CUS24', 'EMP05', TO_DATE('2025-11-17 15:02:57', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0253', 'CUS33', 'EMP03', TO_DATE('2025-10-22 04:57:50', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0254', 'CUS09', 'EMP03', TO_DATE('2025-08-21 04:45:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0255', 'CUS25', 'EMP02', TO_DATE('2025-12-07 08:28:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0256', 'CUS02', 'EMP01', TO_DATE('2025-12-02 00:38:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0257', 'CUS02', 'EMP01', TO_DATE('2025-10-19 19:55:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0258', 'CUS05', 'EMP04', TO_DATE('2025-05-25 08:26:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0259', 'CUS07', 'EMP05', TO_DATE('2026-01-07 07:44:29', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0260', 'CUS17', 'EMP05', TO_DATE('2025-06-18 14:12:26', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0261', 'CUS26', 'EMP04', TO_DATE('2025-06-19 13:38:17', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0262', 'CUS02', 'EMP01', TO_DATE('2025-08-26 04:49:02', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0263', 'CUS20', 'EMP03', TO_DATE('2025-06-16 16:43:30', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0264', 'CUS34', 'EMP03', TO_DATE('2025-06-23 18:06:33', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0265', 'CUS28', 'EMP05', TO_DATE('2025-08-12 02:33:40', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0266', 'CUS28', 'EMP03', TO_DATE('2025-06-22 02:29:45', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0267', 'CUS35', 'EMP04', TO_DATE('2026-04-17 23:44:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0268', 'CUS20', 'EMP04', TO_DATE('2026-05-15 16:41:35', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0269', 'CUS25', 'EMP05', TO_DATE('2025-10-04 20:12:11', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0270', 'CUS01', 'EMP01', TO_DATE('2026-02-03 13:29:09', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0271', 'CUS03', 'EMP02', TO_DATE('2026-05-17 01:17:48', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0272', 'CUS29', 'EMP01', TO_DATE('2025-08-04 13:21:09', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0273', 'CUS31', 'EMP02', TO_DATE('2025-10-04 12:33:29', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0274', 'CUS20', 'EMP04', TO_DATE('2026-04-19 07:56:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0275', 'CUS22', 'EMP01', TO_DATE('2025-09-16 13:04:44', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0276', 'CUS09', 'EMP04', TO_DATE('2025-05-27 02:02:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0277', 'CUS14', 'EMP02', TO_DATE('2026-05-11 06:19:30', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0278', 'CUS01', 'EMP02', TO_DATE('2026-04-13 10:25:12', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0279', 'CUS23', 'EMP01', TO_DATE('2025-11-26 12:14:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0280', 'CUS15', 'EMP03', TO_DATE('2026-06-13 06:37:20', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0281', 'CUS20', 'EMP01', TO_DATE('2025-09-15 17:02:26', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0282', 'CUS10', 'EMP01', TO_DATE('2026-05-09 12:22:46', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0283', 'CUS11', 'EMP02', TO_DATE('2025-10-18 00:07:44', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0284', 'CUS02', 'EMP03', TO_DATE('2025-08-26 04:10:39', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0285', 'CUS15', 'EMP01', TO_DATE('2025-10-29 13:33:09', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0286', 'CUS12', 'EMP01', TO_DATE('2025-11-23 05:09:39', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0287', 'CUS14', 'EMP04', TO_DATE('2025-07-13 20:18:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0288', 'CUS21', 'EMP03', TO_DATE('2025-06-17 18:49:51', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0289', 'CUS20', 'EMP04', TO_DATE('2025-09-26 22:12:54', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0290', 'CUS30', 'EMP04', TO_DATE('2025-10-02 21:59:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0291', 'CUS19', 'EMP02', TO_DATE('2026-06-15 12:30:38', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0292', 'CUS11', 'EMP03', TO_DATE('2025-05-25 18:09:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0293', 'CUS11', 'EMP02', TO_DATE('2025-12-07 03:17:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0294', 'CUS28', 'EMP04', TO_DATE('2025-06-02 06:35:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0295', 'CUS12', 'EMP02', TO_DATE('2025-08-03 12:27:05', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0296', 'CUS13', 'EMP04', TO_DATE('2025-06-28 21:02:58', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0297', 'CUS15', 'EMP03', TO_DATE('2025-05-27 16:05:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0298', 'CUS34', 'EMP04', TO_DATE('2026-07-10 10:12:45', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0299', 'CUS02', 'EMP01', TO_DATE('2025-12-15 07:04:46', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0300', 'CUS35', 'EMP02', TO_DATE('2025-08-15 19:16:48', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0301', 'CUS09', 'EMP03', TO_DATE('2026-01-12 16:39:06', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0302', 'CUS15', 'EMP01', TO_DATE('2026-03-09 10:58:07', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0303', 'CUS06', 'EMP01', TO_DATE('2025-12-14 15:29:40', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0304', 'CUS12', 'EMP05', TO_DATE('2025-05-22 08:58:28', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0305', 'CUS04', 'EMP05', TO_DATE('2025-08-15 01:41:30', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0306', 'CUS08', 'EMP04', TO_DATE('2025-12-13 04:57:09', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0307', 'CUS19', 'EMP05', TO_DATE('2026-01-02 15:30:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0308', 'CUS27', 'EMP01', TO_DATE('2025-10-28 08:10:36', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0309', 'CUS22', 'EMP03', TO_DATE('2026-04-08 13:08:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0310', 'CUS14', 'EMP05', TO_DATE('2025-11-19 18:01:45', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0311', 'CUS03', 'EMP02', TO_DATE('2025-07-09 22:12:52', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0312', 'CUS14', 'EMP03', TO_DATE('2025-07-29 15:16:07', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0313', 'CUS11', 'EMP01', TO_DATE('2026-03-17 21:36:55', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0314', 'CUS31', 'EMP05', TO_DATE('2026-05-23 18:35:35', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0315', 'CUS12', 'EMP03', TO_DATE('2025-08-28 22:28:03', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0316', 'CUS32', 'EMP04', TO_DATE('2025-09-02 23:54:45', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0317', 'CUS30', 'EMP05', TO_DATE('2026-05-28 01:41:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0318', 'CUS10', 'EMP04', TO_DATE('2026-05-14 23:36:42', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0319', 'CUS34', 'EMP01', TO_DATE('2025-07-18 01:52:15', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0320', 'CUS23', 'EMP01', TO_DATE('2025-08-06 21:40:13', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0321', 'CUS11', 'EMP03', TO_DATE('2026-06-07 20:47:47', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0322', 'CUS15', 'EMP04', TO_DATE('2025-12-29 18:50:40', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0323', 'CUS14', 'EMP04', TO_DATE('2025-06-23 16:49:14', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0324', 'CUS17', 'EMP01', TO_DATE('2026-04-12 20:16:29', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0325', 'CUS08', 'EMP05', TO_DATE('2025-05-27 10:37:40', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0326', 'CUS12', 'EMP01', TO_DATE('2025-11-25 18:30:12', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0327', 'CUS27', 'EMP04', TO_DATE('2025-07-12 16:58:06', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0328', 'CUS35', 'EMP02', TO_DATE('2025-12-13 19:44:59', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0329', 'CUS26', 'EMP03', TO_DATE('2025-05-14 06:37:06', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0330', 'CUS33', 'EMP04', TO_DATE('2025-07-29 02:52:24', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0331', 'CUS02', 'EMP03', TO_DATE('2025-06-22 11:16:26', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0332', 'CUS23', 'EMP03', TO_DATE('2025-08-11 03:59:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0333', 'CUS01', 'EMP03', TO_DATE('2025-06-11 19:30:44', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0334', 'CUS16', 'EMP03', TO_DATE('2025-08-23 10:40:18', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0335', 'CUS04', 'EMP01', TO_DATE('2026-04-05 11:08:13', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0336', 'CUS11', 'EMP04', TO_DATE('2025-12-26 04:30:15', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0337', 'CUS12', 'EMP04', TO_DATE('2025-06-29 10:47:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0338', 'CUS05', 'EMP01', TO_DATE('2025-07-06 08:28:59', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0339', 'CUS32', 'EMP02', TO_DATE('2025-07-17 04:06:41', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0340', 'CUS29', 'EMP05', TO_DATE('2026-05-09 13:49:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0341', 'CUS25', 'EMP04', TO_DATE('2026-01-28 16:08:00', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0342', 'CUS28', 'EMP01', TO_DATE('2025-10-14 08:47:07', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0343', 'CUS21', 'EMP02', TO_DATE('2025-10-16 12:53:19', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0344', 'CUS14', 'EMP03', TO_DATE('2026-05-17 05:05:00', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0345', 'CUS11', 'EMP02', TO_DATE('2026-04-13 02:16:41', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0346', 'CUS28', 'EMP03', TO_DATE('2026-07-09 21:57:37', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'PENDING');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0347', 'CUS12', 'EMP05', TO_DATE('2025-11-15 15:16:10', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0348', 'CUS17', 'EMP05', TO_DATE('2025-09-03 11:15:37', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0349', 'CUS15', 'EMP01', TO_DATE('2025-06-23 22:31:34', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0350', 'CUS11', 'EMP03', TO_DATE('2025-07-02 04:48:06', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0351', 'CUS29', 'EMP04', TO_DATE('2025-11-20 04:02:43', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0352', 'CUS27', 'EMP01', TO_DATE('2025-12-02 17:11:07', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0353', 'CUS10', 'EMP04', TO_DATE('2025-08-07 11:58:00', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0354', 'CUS30', 'EMP03', TO_DATE('2025-07-26 09:33:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0355', 'CUS11', 'EMP04', TO_DATE('2026-04-09 12:05:45', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0356', 'CUS09', 'EMP04', TO_DATE('2025-11-14 19:04:26', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0357', 'CUS19', 'EMP01', TO_DATE('2025-09-20 21:34:44', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0358', 'CUS08', 'EMP01', TO_DATE('2026-02-02 03:52:58', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0359', 'CUS31', 'EMP02', TO_DATE('2025-12-14 17:06:12', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0360', 'CUS18', 'EMP05', TO_DATE('2025-07-01 19:04:20', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0361', 'CUS24', 'EMP02', TO_DATE('2026-01-09 19:01:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0362', 'CUS04', 'EMP01', TO_DATE('2026-04-18 09:48:21', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0363', 'CUS26', 'EMP01', TO_DATE('2025-08-05 14:14:38', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0364', 'CUS05', 'EMP02', TO_DATE('2025-08-03 07:32:57', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0365', 'CUS20', 'EMP03', TO_DATE('2026-05-07 22:35:22', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0366', 'CUS21', 'EMP04', TO_DATE('2025-12-15 02:34:53', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0367', 'CUS33', 'EMP05', TO_DATE('2025-12-13 01:49:16', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0368', 'CUS13', 'EMP04', TO_DATE('2026-06-01 09:19:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0369', 'CUS23', 'EMP03', TO_DATE('2025-05-10 17:29:57', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0370', 'CUS08', 'EMP02', TO_DATE('2026-04-12 16:11:12', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0371', 'CUS22', 'EMP04', TO_DATE('2025-08-16 11:03:59', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0372', 'CUS30', 'EMP02', TO_DATE('2026-01-27 21:34:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0373', 'CUS06', 'EMP01', TO_DATE('2025-12-25 00:09:18', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0374', 'CUS16', 'EMP05', TO_DATE('2025-12-08 23:35:54', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0375', 'CUS20', 'EMP04', TO_DATE('2025-07-26 08:57:01', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0376', 'CUS02', 'EMP05', TO_DATE('2025-11-05 08:59:56', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0377', 'CUS02', 'EMP01', TO_DATE('2025-12-02 03:45:16', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0378', 'CUS10', 'EMP02', TO_DATE('2025-10-21 15:14:49', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0379', 'CUS04', 'EMP01', TO_DATE('2026-06-12 22:48:54', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0380', 'CUS14', 'EMP02', TO_DATE('2026-01-12 09:00:36', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0381', 'CUS12', 'EMP03', TO_DATE('2026-05-16 07:26:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0382', 'CUS16', 'EMP03', TO_DATE('2026-04-24 06:46:12', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0383', 'CUS03', 'EMP04', TO_DATE('2026-01-19 22:19:51', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0384', 'CUS08', 'EMP01', TO_DATE('2026-04-09 01:11:03', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0385', 'CUS33', 'EMP03', TO_DATE('2025-09-16 10:08:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0386', 'CUS12', 'EMP04', TO_DATE('2026-06-20 16:38:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0387', 'CUS25', 'EMP05', TO_DATE('2025-09-02 14:26:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0388', 'CUS04', 'EMP05', TO_DATE('2025-10-17 13:11:56', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0389', 'CUS05', 'EMP04', TO_DATE('2025-07-14 21:41:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0390', 'CUS21', 'EMP01', TO_DATE('2026-02-07 22:30:41', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0391', 'CUS21', 'EMP05', TO_DATE('2025-09-13 10:50:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0392', 'CUS02', 'EMP05', TO_DATE('2025-06-28 16:07:54', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0393', 'CUS01', 'EMP04', TO_DATE('2026-01-07 16:50:14', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0394', 'CUS02', 'EMP01', TO_DATE('2025-10-09 15:16:35', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0395', 'CUS30', 'EMP03', TO_DATE('2026-01-25 23:36:40', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0396', 'CUS09', 'EMP05', TO_DATE('2025-05-16 04:24:05', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0397', 'CUS24', 'EMP02', TO_DATE('2025-10-06 10:00:32', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0398', 'CUS30', 'EMP02', TO_DATE('2025-06-25 18:01:53', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0399', 'CUS29', 'EMP04', TO_DATE('2025-07-03 05:31:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0400', 'CUS25', 'EMP04', TO_DATE('2026-01-10 18:10:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0401', 'CUS27', 'EMP05', TO_DATE('2026-06-06 05:45:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0402', 'CUS16', 'EMP01', TO_DATE('2025-06-27 06:49:19', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0403', 'CUS32', 'EMP04', TO_DATE('2025-06-24 16:04:46', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0404', 'CUS32', 'EMP02', TO_DATE('2026-04-28 13:47:28', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0405', 'CUS11', 'EMP02', TO_DATE('2026-01-27 00:14:21', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0406', 'CUS33', 'EMP05', TO_DATE('2025-09-20 16:04:12', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0407', 'CUS30', 'EMP02', TO_DATE('2025-10-29 11:28:02', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0408', 'CUS04', 'EMP02', TO_DATE('2026-01-24 18:24:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0409', 'CUS02', 'EMP03', TO_DATE('2025-06-05 22:10:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0410', 'CUS03', 'EMP05', TO_DATE('2025-10-14 12:24:16', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0411', 'CUS24', 'EMP04', TO_DATE('2026-01-15 03:34:07', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0412', 'CUS06', 'EMP02', TO_DATE('2025-08-07 17:31:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0413', 'CUS27', 'EMP05', TO_DATE('2026-05-19 21:15:50', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0414', 'CUS12', 'EMP03', TO_DATE('2026-05-07 22:31:45', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0415', 'CUS09', 'EMP01', TO_DATE('2025-12-31 07:50:06', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0416', 'CUS27', 'EMP03', TO_DATE('2025-05-09 11:46:18', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0417', 'CUS06', 'EMP01', TO_DATE('2025-10-28 16:30:39', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0418', 'CUS05', 'EMP01', TO_DATE('2026-01-14 04:10:25', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0419', 'CUS06', 'EMP01', TO_DATE('2025-06-21 23:40:49', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0420', 'CUS24', 'EMP02', TO_DATE('2026-05-10 09:34:16', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0421', 'CUS09', 'EMP04', TO_DATE('2026-05-26 19:51:00', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0422', 'CUS17', 'EMP04', TO_DATE('2025-11-25 17:09:20', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0423', 'CUS19', 'EMP01', TO_DATE('2026-01-14 00:38:23', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0424', 'CUS10', 'EMP02', TO_DATE('2025-12-12 18:13:39', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0425', 'CUS29', 'EMP03', TO_DATE('2025-08-20 10:44:38', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0426', 'CUS24', 'EMP05', TO_DATE('2026-05-31 02:32:33', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0427', 'CUS09', 'EMP02', TO_DATE('2026-05-11 17:36:55', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0428', 'CUS07', 'EMP03', TO_DATE('2025-12-23 18:11:58', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0429', 'CUS33', 'EMP02', TO_DATE('2025-12-05 07:24:46', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0430', 'CUS29', 'EMP02', TO_DATE('2025-06-18 19:37:55', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0431', 'CUS18', 'EMP05', TO_DATE('2025-09-08 23:33:52', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0432', 'CUS07', 'EMP03', TO_DATE('2025-10-03 13:51:05', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0433', 'CUS25', 'EMP04', TO_DATE('2025-06-12 19:56:36', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0434', 'CUS15', 'EMP04', TO_DATE('2026-05-02 16:03:13', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0435', 'CUS11', 'EMP04', TO_DATE('2025-11-29 10:22:05', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0436', 'CUS07', 'EMP01', TO_DATE('2026-04-09 11:18:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0437', 'CUS15', 'EMP04', TO_DATE('2026-01-27 23:37:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0438', 'CUS03', 'EMP05', TO_DATE('2025-10-07 13:22:11', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0439', 'CUS01', 'EMP02', TO_DATE('2026-06-30 20:19:49', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0440', 'CUS08', 'EMP05', TO_DATE('2025-05-19 05:41:26', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0441', 'CUS09', 'EMP04', TO_DATE('2025-09-17 13:38:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0442', 'CUS29', 'EMP04', TO_DATE('2026-05-18 06:08:29', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0443', 'CUS35', 'EMP02', TO_DATE('2025-11-09 20:08:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0444', 'CUS09', 'EMP03', TO_DATE('2025-09-26 11:49:38', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0445', 'CUS11', 'EMP02', TO_DATE('2026-01-16 23:49:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0446', 'CUS11', 'EMP03', TO_DATE('2025-06-23 02:47:19', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0447', 'CUS20', 'EMP01', TO_DATE('2025-05-23 05:09:00', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0448', 'CUS19', 'EMP03', TO_DATE('2025-09-08 07:03:46', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0449', 'CUS23', 'EMP03', TO_DATE('2025-06-23 03:25:44', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0450', 'CUS03', 'EMP05', TO_DATE('2025-08-13 22:14:35', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0451', 'CUS06', 'EMP05', TO_DATE('2026-02-01 00:15:46', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0452', 'CUS08', 'EMP01', TO_DATE('2025-10-06 05:33:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0453', 'CUS11', 'EMP02', TO_DATE('2025-06-10 02:58:48', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0454', 'CUS22', 'EMP01', TO_DATE('2026-05-31 07:03:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0455', 'CUS23', 'EMP03', TO_DATE('2025-08-06 18:11:33', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0456', 'CUS24', 'EMP04', TO_DATE('2026-05-16 00:08:54', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0457', 'CUS18', 'EMP05', TO_DATE('2025-08-05 02:37:32', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0458', 'CUS22', 'EMP01', TO_DATE('2026-03-12 20:46:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0459', 'CUS34', 'EMP05', TO_DATE('2025-05-28 03:11:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0460', 'CUS12', 'EMP04', TO_DATE('2026-06-07 11:59:30', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0461', 'CUS02', 'EMP03', TO_DATE('2025-12-08 15:15:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0462', 'CUS20', 'EMP02', TO_DATE('2025-07-27 15:30:12', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0463', 'CUS11', 'EMP05', TO_DATE('2025-11-18 19:24:34', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0464', 'CUS31', 'EMP04', TO_DATE('2025-08-28 11:51:39', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0465', 'CUS02', 'EMP01', TO_DATE('2025-10-12 01:01:20', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0466', 'CUS14', 'EMP01', TO_DATE('2026-02-01 23:54:33', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0467', 'CUS03', 'EMP05', TO_DATE('2025-07-21 19:05:29', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0468', 'CUS21', 'EMP02', TO_DATE('2025-07-14 01:51:40', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0469', 'CUS35', 'EMP01', TO_DATE('2026-05-07 07:45:11', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0470', 'CUS12', 'EMP03', TO_DATE('2025-10-06 00:39:46', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0471', 'CUS09', 'EMP03', TO_DATE('2026-05-25 00:21:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0472', 'CUS28', 'EMP02', TO_DATE('2026-01-10 13:18:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0473', 'CUS29', 'EMP02', TO_DATE('2025-11-05 21:16:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0474', 'CUS29', 'EMP05', TO_DATE('2025-09-23 02:43:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0475', 'CUS24', 'EMP05', TO_DATE('2026-01-06 08:46:16', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0476', 'CUS30', 'EMP01', TO_DATE('2026-01-12 14:40:01', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0477', 'CUS28', 'EMP05', TO_DATE('2026-03-28 19:03:02', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0478', 'CUS04', 'EMP05', TO_DATE('2026-01-11 11:43:16', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0479', 'CUS25', 'EMP05', TO_DATE('2025-11-21 13:45:09', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0480', 'CUS16', 'EMP01', TO_DATE('2025-10-20 16:36:05', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0481', 'CUS08', 'EMP01', TO_DATE('2026-06-04 22:00:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0482', 'CUS05', 'EMP02', TO_DATE('2025-05-30 07:37:43', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0483', 'CUS22', 'EMP04', TO_DATE('2025-12-24 06:55:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0484', 'CUS30', 'EMP01', TO_DATE('2025-06-07 15:48:28', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0485', 'CUS01', 'EMP03', TO_DATE('2025-11-02 10:45:41', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0486', 'CUS09', 'EMP02', TO_DATE('2026-05-18 07:38:00', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0487', 'CUS27', 'EMP03', TO_DATE('2026-02-03 03:03:45', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0488', 'CUS10', 'EMP01', TO_DATE('2025-11-22 09:36:04', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0489', 'CUS11', 'EMP03', TO_DATE('2025-06-10 20:56:22', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0490', 'CUS12', 'EMP01', TO_DATE('2025-08-08 00:44:49', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0491', 'CUS26', 'EMP03', TO_DATE('2026-01-06 21:00:43', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0492', 'CUS28', 'EMP03', TO_DATE('2025-05-06 09:32:38', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0493', 'CUS10', 'EMP05', TO_DATE('2026-06-09 15:55:44', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CONFIRMED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0494', 'CUS12', 'EMP01', TO_DATE('2026-06-10 23:44:12', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0495', 'CUS16', 'EMP02', TO_DATE('2025-11-22 22:54:49', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0496', 'CUS03', 'EMP03', TO_DATE('2025-12-07 09:14:54', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0497', 'CUS14', 'EMP01', TO_DATE('2025-10-28 07:51:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0498', 'CUS22', 'EMP05', TO_DATE('2025-08-19 11:17:03', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CANCELLED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0499', 'CUS07', 'EMP02', TO_DATE('2025-06-16 07:54:40', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'COMPLETED');
INSERT INTO BOOKING (BookingID, CustomerID, EmployeeID, BookingDate, TotalAmount, Status) VALUES ('BK0500', 'CUS14', 'EMP04', TO_DATE('2025-05-26 00:22:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CANCELLED');

-- BẢNG VÉ BAY (TICKET)
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00001', 'BK0001', 'FL127', 'AC10_81', 'PA033', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00002', 'BK0002', 'FL031', 'AC13_68', 'PA052', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00003', 'BK0002', 'FL031', 'AC13_50', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00004', 'BK0003', 'FL012', 'AC10_58', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00005', 'BK0003', 'FL012', 'AC10_99', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00006', 'BK0003', 'FL012', 'AC10_104', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00007', 'BK0004', 'FL058', 'AC07_48', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00008', 'BK0004', 'FL058', 'AC07_89', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00009', 'BK0004', 'FL058', 'AC07_92', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00010', 'BK0005', 'FL058', 'AC07_61', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00011', 'BK0005', 'FL058', 'AC07_100', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00012', 'BK0006', 'FL095', 'AC03_84', 'PA058', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00013', 'BK0006', 'FL095', 'AC03_117', 'PA024', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00014', 'BK0007', 'FL021', 'AC07_47', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00015', 'BK0007', 'FL021', 'AC07_21', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00016', 'BK0007', 'FL021', 'AC07_137', 'PA052', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00017', 'BK0008', 'FL076', 'AC11_39', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00018', 'BK0009', 'FL104', 'AC04_74', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00019', 'BK0010', 'FL138', 'AC03_76', 'PA005', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00020', 'BK0010', 'FL138', 'AC03_29', 'PA031', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00021', 'BK0010', 'FL138', 'AC03_45', 'PA035', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00022', 'BK0011', 'FL028', 'AC09_41', 'PA018', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00023', 'BK0012', 'FL079', 'AC02_130', 'PA035', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00024', 'BK0012', 'FL079', 'AC02_118', 'PA007', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00025', 'BK0013', 'FL148', 'AC11_120', 'PA005', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00026', 'BK0014', 'FL106', 'AC09_95', 'PA014', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00027', 'BK0014', 'FL106', 'AC09_98', 'PA035', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00028', 'BK0014', 'FL106', 'AC09_115', 'PA029', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00029', 'BK0015', 'FL106', 'AC09_56', 'PA052', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00030', 'BK0015', 'FL106', 'AC09_30', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00031', 'BK0016', 'FL006', 'AC15_149', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00032', 'BK0017', 'FL087', 'AC11_67', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00033', 'BK0017', 'FL087', 'AC11_113', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00034', 'BK0018', 'FL105', 'AC05_96', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00035', 'BK0018', 'FL105', 'AC05_48', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00036', 'BK0018', 'FL105', 'AC05_63', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00037', 'BK0019', 'FL113', 'AC15_129', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00038', 'BK0020', 'FL104', 'AC04_16', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00039', 'BK0021', 'FL025', 'AC15_18', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00040', 'BK0021', 'FL025', 'AC15_66', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00041', 'BK0021', 'FL025', 'AC15_114', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00042', 'BK0022', 'FL108', 'AC12_86', 'PA005', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00043', 'BK0023', 'FL099', 'AC01_6', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00044', 'BK0023', 'FL099', 'AC01_61', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00045', 'BK0023', 'FL099', 'AC01_92', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00046', 'BK0024', 'FL038', 'AC01_147', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00047', 'BK0024', 'FL038', 'AC01_136', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00048', 'BK0025', 'FL121', 'AC13_125', 'PA013', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00049', 'BK0025', 'FL121', 'AC13_115', 'PA041', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00050', 'BK0025', 'FL121', 'AC13_49', 'PA056', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00051', 'BK0026', 'FL055', 'AC07_96', 'PA036', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00052', 'BK0026', 'FL055', 'AC07_111', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00053', 'BK0027', 'FL058', 'AC07_44', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00054', 'BK0028', 'FL118', 'AC04_7', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00055', 'BK0029', 'FL123', 'AC09_127', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00056', 'BK0030', 'FL125', 'AC01_27', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00057', 'BK0030', 'FL125', 'AC01_100', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00058', 'BK0030', 'FL125', 'AC01_25', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00059', 'BK0031', 'FL149', 'AC04_58', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00060', 'BK0031', 'FL149', 'AC04_12', 'PA036', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00061', 'BK0032', 'FL136', 'AC01_33', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00062', 'BK0032', 'FL136', 'AC01_129', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00063', 'BK0032', 'FL136', 'AC01_90', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00064', 'BK0033', 'FL123', 'AC09_67', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00065', 'BK0034', 'FL141', 'AC01_128', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00066', 'BK0034', 'FL141', 'AC01_124', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00067', 'BK0035', 'FL027', 'AC06_3', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00068', 'BK0035', 'FL027', 'AC06_58', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00069', 'BK0035', 'FL027', 'AC06_76', 'PA052', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00070', 'BK0036', 'FL125', 'AC01_51', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00071', 'BK0036', 'FL125', 'AC01_26', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00072', 'BK0036', 'FL125', 'AC01_66', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00073', 'BK0037', 'FL129', 'AC15_113', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00074', 'BK0038', 'FL143', 'AC11_91', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00075', 'BK0038', 'FL143', 'AC11_54', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00076', 'BK0039', 'FL027', 'AC06_63', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00077', 'BK0040', 'FL129', 'AC15_33', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00078', 'BK0040', 'FL129', 'AC15_20', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00079', 'BK0040', 'FL129', 'AC15_6', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00080', 'BK0041', 'FL005', 'AC15_33', 'PA040', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00081', 'BK0041', 'FL005', 'AC15_20', 'PA033', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00082', 'BK0042', 'FL106', 'AC09_127', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00083', 'BK0043', 'FL018', 'AC03_8', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00084', 'BK0043', 'FL018', 'AC03_112', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00085', 'BK0043', 'FL018', 'AC03_50', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00086', 'BK0044', 'FL105', 'AC05_118', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00087', 'BK0044', 'FL105', 'AC05_31', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00088', 'BK0044', 'FL105', 'AC05_49', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00089', 'BK0045', 'FL053', 'AC07_136', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00090', 'BK0046', 'FL125', 'AC01_15', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00091', 'BK0046', 'FL125', 'AC01_79', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00092', 'BK0047', 'FL006', 'AC15_3', 'PA058', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00093', 'BK0047', 'FL006', 'AC15_68', 'PA004', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00094', 'BK0047', 'FL006', 'AC15_2', 'PA029', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00095', 'BK0048', 'FL050', 'AC07_18', 'PA047', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00096', 'BK0048', 'FL050', 'AC07_135', 'PA035', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00097', 'BK0049', 'FL092', 'AC01_5', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00098', 'BK0050', 'FL070', 'AC02_112', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00099', 'BK0050', 'FL070', 'AC02_13', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00100', 'BK0051', 'FL003', 'AC07_51', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00101', 'BK0051', 'FL003', 'AC07_121', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00102', 'BK0052', 'FL052', 'AC04_61', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00103', 'BK0052', 'FL052', 'AC04_33', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00104', 'BK0053', 'FL020', 'AC07_11', 'PA003', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00105', 'BK0053', 'FL020', 'AC07_43', 'PA008', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00106', 'BK0054', 'FL147', 'AC06_15', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00107', 'BK0054', 'FL147', 'AC06_35', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00108', 'BK0054', 'FL147', 'AC06_52', 'PA004', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00109', 'BK0055', 'FL099', 'AC01_86', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00110', 'BK0056', 'FL052', 'AC04_1', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00111', 'BK0056', 'FL052', 'AC04_82', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00112', 'BK0056', 'FL052', 'AC04_37', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00113', 'BK0057', 'FL008', 'AC06_32', 'PA049', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00114', 'BK0058', 'FL007', 'AC06_150', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00115', 'BK0058', 'FL007', 'AC06_148', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00116', 'BK0058', 'FL007', 'AC06_26', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00117', 'BK0059', 'FL105', 'AC05_33', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00118', 'BK0060', 'FL010', 'AC06_42', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00119', 'BK0060', 'FL010', 'AC06_32', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00120', 'BK0060', 'FL010', 'AC06_105', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00121', 'BK0061', 'FL051', 'AC01_17', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00122', 'BK0062', 'FL099', 'AC01_21', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00123', 'BK0062', 'FL099', 'AC01_20', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00124', 'BK0063', 'FL046', 'AC05_19', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00125', 'BK0063', 'FL046', 'AC05_96', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00126', 'BK0063', 'FL046', 'AC05_32', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00127', 'BK0064', 'FL121', 'AC13_80', 'PA039', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00128', 'BK0064', 'FL121', 'AC13_95', 'PA048', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00129', 'BK0065', 'FL089', 'AC07_105', 'PA025', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00130', 'BK0066', 'FL105', 'AC05_106', 'PA017', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00131', 'BK0067', 'FL017', 'AC09_46', 'PA056', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00132', 'BK0068', 'FL137', 'AC09_125', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00133', 'BK0068', 'FL137', 'AC09_122', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00134', 'BK0068', 'FL137', 'AC09_75', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00135', 'BK0069', 'FL075', 'AC11_16', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00136', 'BK0070', 'FL137', 'AC09_11', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00137', 'BK0071', 'FL088', 'AC13_22', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00138', 'BK0071', 'FL088', 'AC13_78', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00139', 'BK0071', 'FL088', 'AC13_93', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00140', 'BK0072', 'FL083', 'AC03_83', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00141', 'BK0072', 'FL083', 'AC03_74', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00142', 'BK0072', 'FL083', 'AC03_144', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00143', 'BK0073', 'FL032', 'AC08_147', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00144', 'BK0073', 'FL032', 'AC08_128', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00145', 'BK0073', 'FL032', 'AC08_23', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00146', 'BK0074', 'FL080', 'AC06_10', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00147', 'BK0074', 'FL080', 'AC06_100', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00148', 'BK0075', 'FL149', 'AC04_65', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00149', 'BK0076', 'FL110', 'AC02_134', 'PA010', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00150', 'BK0077', 'FL054', 'AC03_97', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00151', 'BK0077', 'FL054', 'AC03_9', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00152', 'BK0077', 'FL054', 'AC03_39', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00153', 'BK0078', 'FL053', 'AC07_80', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00154', 'BK0078', 'FL053', 'AC07_28', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00155', 'BK0079', 'FL024', 'AC01_33', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00156', 'BK0079', 'FL024', 'AC01_12', 'PA036', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00157', 'BK0080', 'FL032', 'AC08_116', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00158', 'BK0080', 'FL032', 'AC08_133', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00159', 'BK0080', 'FL032', 'AC08_141', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00160', 'BK0081', 'FL071', 'AC07_148', 'PA055', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00161', 'BK0081', 'FL071', 'AC07_113', 'PA040', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00162', 'BK0082', 'FL150', 'AC01_26', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00163', 'BK0082', 'FL150', 'AC01_70', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00164', 'BK0082', 'FL150', 'AC01_102', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00165', 'BK0083', 'FL027', 'AC06_34', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00166', 'BK0084', 'FL118', 'AC04_8', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00167', 'BK0084', 'FL118', 'AC04_39', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00168', 'BK0085', 'FL050', 'AC07_142', 'PA007', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00169', 'BK0086', 'FL066', 'AC13_143', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00170', 'BK0086', 'FL066', 'AC13_74', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00171', 'BK0086', 'FL066', 'AC13_41', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00172', 'BK0087', 'FL058', 'AC07_126', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00173', 'BK0087', 'FL058', 'AC07_26', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00174', 'BK0087', 'FL058', 'AC07_59', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00175', 'BK0088', 'FL058', 'AC07_33', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00176', 'BK0089', 'FL132', 'AC12_23', 'PA037', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00177', 'BK0089', 'FL132', 'AC12_4', 'PA054', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00178', 'BK0089', 'FL132', 'AC12_104', 'PA008', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00179', 'BK0090', 'FL030', 'AC05_141', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00180', 'BK0091', 'FL120', 'AC04_33', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00181', 'BK0092', 'FL144', 'AC12_81', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00182', 'BK0093', 'FL137', 'AC09_114', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00183', 'BK0093', 'FL137', 'AC09_76', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00184', 'BK0094', 'FL006', 'AC15_93', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00185', 'BK0094', 'FL006', 'AC15_44', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00186', 'BK0095', 'FL039', 'AC04_118', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00187', 'BK0096', 'FL055', 'AC07_53', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00188', 'BK0096', 'FL055', 'AC07_5', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00189', 'BK0096', 'FL055', 'AC07_121', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00190', 'BK0097', 'FL009', 'AC03_133', 'PA018', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00191', 'BK0097', 'FL009', 'AC03_40', 'PA019', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00192', 'BK0098', 'FL124', 'AC02_9', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00193', 'BK0098', 'FL124', 'AC02_50', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00194', 'BK0099', 'FL100', 'AC03_120', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00195', 'BK0099', 'FL100', 'AC03_35', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00196', 'BK0099', 'FL100', 'AC03_37', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00197', 'BK0100', 'FL078', 'AC14_142', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00198', 'BK0100', 'FL078', 'AC14_53', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00199', 'BK0101', 'FL045', 'AC06_125', 'PA013', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00200', 'BK0101', 'FL045', 'AC06_53', 'PA038', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00201', 'BK0102', 'FL033', 'AC11_112', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00202', 'BK0102', 'FL033', 'AC11_133', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00203', 'BK0103', 'FL076', 'AC11_119', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00204', 'BK0103', 'FL076', 'AC11_138', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00205', 'BK0103', 'FL076', 'AC11_46', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00206', 'BK0104', 'FL024', 'AC01_129', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00207', 'BK0104', 'FL024', 'AC01_124', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00208', 'BK0104', 'FL024', 'AC01_101', 'PA005', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00209', 'BK0105', 'FL046', 'AC05_118', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00210', 'BK0105', 'FL046', 'AC05_39', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00211', 'BK0106', 'FL050', 'AC07_147', 'PA043', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00212', 'BK0107', 'FL101', 'AC04_21', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00213', 'BK0107', 'FL101', 'AC04_87', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00214', 'BK0108', 'FL079', 'AC02_54', 'PA051', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00215', 'BK0108', 'FL079', 'AC02_108', 'PA050', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00216', 'BK0109', 'FL085', 'AC04_113', 'PA036', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00217', 'BK0110', 'FL057', 'AC04_52', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00218', 'BK0110', 'FL057', 'AC04_16', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00219', 'BK0110', 'FL057', 'AC04_48', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00220', 'BK0111', 'FL108', 'AC12_75', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00221', 'BK0111', 'FL108', 'AC12_146', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00222', 'BK0112', 'FL053', 'AC07_37', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00223', 'BK0112', 'FL053', 'AC07_20', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00224', 'BK0112', 'FL053', 'AC07_2', 'PA005', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00225', 'BK0113', 'FL054', 'AC03_28', 'PA051', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00226', 'BK0113', 'FL054', 'AC03_112', 'PA001', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00227', 'BK0113', 'FL054', 'AC03_29', 'PA032', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00228', 'BK0114', 'FL063', 'AC15_33', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00229', 'BK0114', 'FL063', 'AC15_142', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00230', 'BK0115', 'FL109', 'AC07_106', 'PA001', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00231', 'BK0115', 'FL109', 'AC07_99', 'PA008', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00232', 'BK0116', 'FL011', 'AC12_117', 'PA047', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00233', 'BK0116', 'FL011', 'AC12_132', 'PA023', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00234', 'BK0117', 'FL077', 'AC02_17', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00235', 'BK0117', 'FL077', 'AC02_137', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00236', 'BK0117', 'FL077', 'AC02_117', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00237', 'BK0118', 'FL109', 'AC07_91', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00238', 'BK0118', 'FL109', 'AC07_6', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00239', 'BK0118', 'FL109', 'AC07_61', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00240', 'BK0119', 'FL082', 'AC13_29', 'PA033', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00241', 'BK0119', 'FL082', 'AC13_72', 'PA040', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00242', 'BK0120', 'FL104', 'AC04_105', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00243', 'BK0120', 'FL104', 'AC04_76', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00244', 'BK0121', 'FL049', 'AC11_129', 'PA041', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00245', 'BK0122', 'FL139', 'AC09_17', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00246', 'BK0122', 'FL139', 'AC09_51', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00247', 'BK0123', 'FL095', 'AC03_147', 'PA009', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00248', 'BK0123', 'FL095', 'AC03_100', 'PA056', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00249', 'BK0124', 'FL131', 'AC11_130', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00250', 'BK0124', 'FL131', 'AC11_113', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00251', 'BK0124', 'FL131', 'AC11_129', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00252', 'BK0125', 'FL047', 'AC01_100', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00253', 'BK0126', 'FL003', 'AC07_117', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00254', 'BK0126', 'FL003', 'AC07_74', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00255', 'BK0126', 'FL003', 'AC07_37', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00256', 'BK0127', 'FL016', 'AC10_142', 'PA002', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00257', 'BK0127', 'FL016', 'AC10_38', 'PA004', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00258', 'BK0127', 'FL016', 'AC10_3', 'PA032', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00259', 'BK0128', 'FL102', 'AC01_62', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00260', 'BK0128', 'FL102', 'AC01_150', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00261', 'BK0128', 'FL102', 'AC01_36', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00262', 'BK0129', 'FL056', 'AC02_19', 'PA005', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00263', 'BK0130', 'FL138', 'AC03_56', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00264', 'BK0131', 'FL067', 'AC01_1', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00265', 'BK0132', 'FL041', 'AC13_2', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00266', 'BK0133', 'FL084', 'AC06_121', 'PA001', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00267', 'BK0134', 'FL033', 'AC11_89', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00268', 'BK0135', 'FL143', 'AC11_92', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00269', 'BK0135', 'FL143', 'AC11_70', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00270', 'BK0136', 'FL063', 'AC15_70', 'PA036', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00271', 'BK0137', 'FL069', 'AC14_96', 'PA006', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00272', 'BK0137', 'FL069', 'AC14_61', 'PA054', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00273', 'BK0137', 'FL069', 'AC14_66', 'PA001', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00274', 'BK0138', 'FL110', 'AC02_75', 'PA024', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00275', 'BK0138', 'FL110', 'AC02_54', 'PA015', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00276', 'BK0138', 'FL110', 'AC02_36', 'PA028', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00277', 'BK0139', 'FL143', 'AC11_98', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00278', 'BK0139', 'FL143', 'AC11_114', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00279', 'BK0140', 'FL015', 'AC05_93', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00280', 'BK0140', 'FL015', 'AC05_55', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00281', 'BK0141', 'FL004', 'AC01_111', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00282', 'BK0142', 'FL150', 'AC01_21', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00283', 'BK0143', 'FL096', 'AC10_107', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00284', 'BK0143', 'FL096', 'AC10_136', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00285', 'BK0143', 'FL096', 'AC10_73', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00286', 'BK0144', 'FL099', 'AC01_66', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00287', 'BK0145', 'FL129', 'AC15_148', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00288', 'BK0145', 'FL129', 'AC15_102', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00289', 'BK0145', 'FL129', 'AC15_116', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00290', 'BK0146', 'FL076', 'AC11_92', 'PA012', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00291', 'BK0147', 'FL124', 'AC02_52', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00292', 'BK0148', 'FL025', 'AC15_68', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00293', 'BK0148', 'FL025', 'AC15_106', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00294', 'BK0148', 'FL025', 'AC15_120', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00295', 'BK0149', 'FL093', 'AC14_81', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00296', 'BK0149', 'FL093', 'AC14_57', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00297', 'BK0149', 'FL093', 'AC14_84', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00298', 'BK0150', 'FL140', 'AC04_147', 'PA002', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00299', 'BK0151', 'FL031', 'AC13_76', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00300', 'BK0151', 'FL031', 'AC13_67', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00301', 'BK0151', 'FL031', 'AC13_42', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00302', 'BK0152', 'FL072', 'AC01_86', 'PA049', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00303', 'BK0153', 'FL005', 'AC15_140', 'PA009', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00304', 'BK0154', 'FL114', 'AC08_112', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00305', 'BK0155', 'FL085', 'AC04_128', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00306', 'BK0156', 'FL079', 'AC02_34', 'PA049', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00307', 'BK0157', 'FL135', 'AC04_88', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00308', 'BK0157', 'FL135', 'AC04_68', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00309', 'BK0157', 'FL135', 'AC04_35', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00310', 'BK0158', 'FL027', 'AC06_119', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00311', 'BK0158', 'FL027', 'AC06_104', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00312', 'BK0158', 'FL027', 'AC06_127', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00313', 'BK0159', 'FL133', 'AC12_94', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00314', 'BK0159', 'FL133', 'AC12_106', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00315', 'BK0159', 'FL133', 'AC12_121', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00316', 'BK0160', 'FL030', 'AC05_68', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00317', 'BK0160', 'FL030', 'AC05_131', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00318', 'BK0160', 'FL030', 'AC05_37', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00319', 'BK0161', 'FL006', 'AC15_87', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00320', 'BK0161', 'FL006', 'AC15_72', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00321', 'BK0161', 'FL006', 'AC15_113', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00322', 'BK0162', 'FL016', 'AC10_50', 'PA013', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00323', 'BK0163', 'FL036', 'AC11_114', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00324', 'BK0163', 'FL036', 'AC11_68', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00325', 'BK0163', 'FL036', 'AC11_124', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00326', 'BK0164', 'FL082', 'AC13_26', 'PA016', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00327', 'BK0164', 'FL082', 'AC13_24', 'PA051', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00328', 'BK0165', 'FL136', 'AC01_130', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00329', 'BK0166', 'FL071', 'AC07_3', 'PA010', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00330', 'BK0167', 'FL071', 'AC07_72', 'PA043', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00331', 'BK0167', 'FL071', 'AC07_120', 'PA057', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00332', 'BK0168', 'FL026', 'AC12_71', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00333', 'BK0169', 'FL134', 'AC12_77', 'PA026', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00334', 'BK0169', 'FL134', 'AC12_88', 'PA033', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00335', 'BK0170', 'FL147', 'AC06_111', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00336', 'BK0171', 'FL029', 'AC09_118', 'PA017', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00337', 'BK0172', 'FL150', 'AC01_38', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00338', 'BK0173', 'FL128', 'AC03_62', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00339', 'BK0173', 'FL128', 'AC03_124', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00340', 'BK0173', 'FL128', 'AC03_89', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00341', 'BK0174', 'FL050', 'AC07_150', 'PA059', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00342', 'BK0175', 'FL126', 'AC09_2', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00343', 'BK0176', 'FL034', 'AC01_95', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00344', 'BK0176', 'FL034', 'AC01_5', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00345', 'BK0176', 'FL034', 'AC01_73', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00346', 'BK0177', 'FL063', 'AC15_48', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00347', 'BK0177', 'FL063', 'AC15_5', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00348', 'BK0178', 'FL074', 'AC06_138', 'PA022', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00349', 'BK0179', 'FL038', 'AC01_104', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00350', 'BK0179', 'FL038', 'AC01_8', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00351', 'BK0180', 'FL041', 'AC13_88', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00352', 'BK0180', 'FL041', 'AC13_104', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00353', 'BK0180', 'FL041', 'AC13_61', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00354', 'BK0181', 'FL112', 'AC11_56', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00355', 'BK0182', 'FL087', 'AC11_80', 'PA002', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00356', 'BK0183', 'FL019', 'AC01_18', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00357', 'BK0183', 'FL019', 'AC01_86', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00358', 'BK0183', 'FL019', 'AC01_65', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00359', 'BK0184', 'FL146', 'AC03_32', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00360', 'BK0184', 'FL146', 'AC03_69', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00361', 'BK0184', 'FL146', 'AC03_34', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00362', 'BK0185', 'FL127', 'AC10_17', 'PA040', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00363', 'BK0186', 'FL061', 'AC13_30', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00364', 'BK0186', 'FL061', 'AC13_112', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00365', 'BK0187', 'FL056', 'AC02_26', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00366', 'BK0187', 'FL056', 'AC02_141', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00367', 'BK0188', 'FL103', 'AC10_117', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00368', 'BK0189', 'FL145', 'AC04_128', 'PA006', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00369', 'BK0189', 'FL145', 'AC04_40', 'PA054', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00370', 'BK0189', 'FL145', 'AC04_131', 'PA053', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00371', 'BK0190', 'FL040', 'AC13_36', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00372', 'BK0190', 'FL040', 'AC13_130', 'PA004', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00373', 'BK0191', 'FL012', 'AC10_8', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00374', 'BK0191', 'FL012', 'AC10_143', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00375', 'BK0191', 'FL012', 'AC10_145', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00376', 'BK0192', 'FL113', 'AC15_87', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00377', 'BK0192', 'FL113', 'AC15_99', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00378', 'BK0193', 'FL074', 'AC06_142', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00379', 'BK0193', 'FL074', 'AC06_70', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00380', 'BK0194', 'FL061', 'AC13_117', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00381', 'BK0195', 'FL096', 'AC10_120', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00382', 'BK0195', 'FL096', 'AC10_17', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00383', 'BK0195', 'FL096', 'AC10_86', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00384', 'BK0196', 'FL121', 'AC13_29', 'PA054', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00385', 'BK0197', 'FL102', 'AC01_105', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00386', 'BK0197', 'FL102', 'AC01_116', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00387', 'BK0197', 'FL102', 'AC01_93', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00388', 'BK0198', 'FL079', 'AC02_94', 'PA044', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00389', 'BK0198', 'FL079', 'AC02_90', 'PA045', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00390', 'BK0198', 'FL079', 'AC02_1', 'PA027', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00391', 'BK0199', 'FL118', 'AC04_87', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00392', 'BK0199', 'FL118', 'AC04_140', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00393', 'BK0200', 'FL009', 'AC03_16', 'PA013', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00394', 'BK0200', 'FL009', 'AC03_22', 'PA020', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00395', 'BK0201', 'FL022', 'AC09_135', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00396', 'BK0201', 'FL022', 'AC09_40', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00397', 'BK0202', 'FL091', 'AC01_2', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00398', 'BK0203', 'FL098', 'AC12_102', 'PA003', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00399', 'BK0203', 'FL098', 'AC12_117', 'PA059', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00400', 'BK0203', 'FL098', 'AC12_98', 'PA041', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00401', 'BK0204', 'FL085', 'AC04_110', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00402', 'BK0204', 'FL085', 'AC04_1', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00403', 'BK0204', 'FL085', 'AC04_137', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00404', 'BK0205', 'FL089', 'AC07_27', 'PA045', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00405', 'BK0206', 'FL081', 'AC07_38', 'PA029', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00406', 'BK0207', 'FL024', 'AC01_22', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00407', 'BK0208', 'FL104', 'AC04_92', 'PA002', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00408', 'BK0208', 'FL104', 'AC04_58', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00409', 'BK0209', 'FL036', 'AC11_26', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00410', 'BK0210', 'FL047', 'AC01_142', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00411', 'BK0210', 'FL047', 'AC01_134', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00412', 'BK0210', 'FL047', 'AC01_117', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00413', 'BK0211', 'FL024', 'AC01_114', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00414', 'BK0211', 'FL024', 'AC01_88', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00415', 'BK0211', 'FL024', 'AC01_105', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00416', 'BK0212', 'FL079', 'AC02_52', 'PA028', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00417', 'BK0213', 'FL079', 'AC02_26', 'PA040', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00418', 'BK0213', 'FL079', 'AC02_70', 'PA003', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00419', 'BK0213', 'FL079', 'AC02_95', 'PA053', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00420', 'BK0214', 'FL040', 'AC13_136', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00421', 'BK0215', 'FL018', 'AC03_36', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00422', 'BK0216', 'FL050', 'AC07_95', 'PA008', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00423', 'BK0216', 'FL050', 'AC07_34', 'PA029', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00424', 'BK0217', 'FL074', 'AC06_11', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00425', 'BK0218', 'FL107', 'AC12_6', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00426', 'BK0218', 'FL107', 'AC12_21', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00427', 'BK0219', 'FL035', 'AC01_137', 'PA060', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00428', 'BK0219', 'FL035', 'AC01_81', 'PA051', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00429', 'BK0220', 'FL016', 'AC10_12', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00430', 'BK0220', 'FL016', 'AC10_71', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00431', 'BK0220', 'FL016', 'AC10_62', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00432', 'BK0221', 'FL111', 'AC05_41', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00433', 'BK0221', 'FL111', 'AC05_54', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00434', 'BK0221', 'FL111', 'AC05_72', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00435', 'BK0222', 'FL088', 'AC13_38', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00436', 'BK0223', 'FL149', 'AC04_121', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00437', 'BK0224', 'FL131', 'AC11_81', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00438', 'BK0224', 'FL131', 'AC11_1', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00439', 'BK0224', 'FL131', 'AC11_11', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00440', 'BK0225', 'FL074', 'AC06_45', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00441', 'BK0225', 'FL074', 'AC06_115', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00442', 'BK0226', 'FL119', 'AC15_149', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00443', 'BK0226', 'FL119', 'AC15_99', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00444', 'BK0227', 'FL055', 'AC07_48', 'PA039', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00445', 'BK0227', 'FL055', 'AC07_124', 'PA008', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00446', 'BK0227', 'FL055', 'AC07_86', 'PA006', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00447', 'BK0228', 'FL040', 'AC13_146', 'PA059', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00448', 'BK0228', 'FL040', 'AC13_84', 'PA018', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00449', 'BK0228', 'FL040', 'AC13_67', 'PA011', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00450', 'BK0229', 'FL033', 'AC11_30', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00451', 'BK0229', 'FL033', 'AC11_136', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00452', 'BK0229', 'FL033', 'AC11_56', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00453', 'BK0230', 'FL073', 'AC01_88', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00454', 'BK0230', 'FL073', 'AC01_127', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00455', 'BK0230', 'FL073', 'AC01_23', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00456', 'BK0231', 'FL028', 'AC09_30', 'PA009', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00457', 'BK0232', 'FL130', 'AC13_12', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00458', 'BK0233', 'FL131', 'AC11_77', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00459', 'BK0234', 'FL129', 'AC15_74', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00460', 'BK0234', 'FL129', 'AC15_61', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00461', 'BK0235', 'FL026', 'AC12_109', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00462', 'BK0235', 'FL026', 'AC12_25', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00463', 'BK0235', 'FL026', 'AC12_13', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00464', 'BK0236', 'FL005', 'AC15_42', 'PA015', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00465', 'BK0236', 'FL005', 'AC15_143', 'PA038', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00466', 'BK0237', 'FL132', 'AC12_122', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00467', 'BK0237', 'FL132', 'AC12_38', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00468', 'BK0237', 'FL132', 'AC12_67', 'PA005', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00469', 'BK0238', 'FL017', 'AC09_20', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00470', 'BK0238', 'FL017', 'AC09_130', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00471', 'BK0238', 'FL017', 'AC09_85', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00472', 'BK0239', 'FL106', 'AC09_60', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00473', 'BK0239', 'FL106', 'AC09_59', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00474', 'BK0239', 'FL106', 'AC09_16', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00475', 'BK0240', 'FL035', 'AC01_2', 'PA033', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00476', 'BK0240', 'FL035', 'AC01_57', 'PA029', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00477', 'BK0241', 'FL059', 'AC01_78', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00478', 'BK0241', 'FL059', 'AC01_24', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00479', 'BK0241', 'FL059', 'AC01_60', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00480', 'BK0242', 'FL148', 'AC11_94', 'PA014', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00481', 'BK0242', 'FL148', 'AC11_113', 'PA054', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00482', 'BK0243', 'FL048', 'AC12_126', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00483', 'BK0243', 'FL048', 'AC12_135', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00484', 'BK0243', 'FL048', 'AC12_48', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00485', 'BK0244', 'FL147', 'AC06_118', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00486', 'BK0244', 'FL147', 'AC06_53', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00487', 'BK0244', 'FL147', 'AC06_29', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00488', 'BK0245', 'FL017', 'AC09_95', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00489', 'BK0245', 'FL017', 'AC09_65', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00490', 'BK0246', 'FL009', 'AC03_99', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00491', 'BK0246', 'FL009', 'AC03_123', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00492', 'BK0246', 'FL009', 'AC03_149', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00493', 'BK0247', 'FL098', 'AC12_21', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00494', 'BK0248', 'FL150', 'AC01_123', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00495', 'BK0248', 'FL150', 'AC01_100', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00496', 'BK0248', 'FL150', 'AC01_132', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00497', 'BK0249', 'FL038', 'AC01_127', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00498', 'BK0250', 'FL148', 'AC11_32', 'PA018', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00499', 'BK0250', 'FL148', 'AC11_7', 'PA033', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00500', 'BK0251', 'FL010', 'AC06_110', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00501', 'BK0251', 'FL010', 'AC06_60', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00502', 'BK0251', 'FL010', 'AC06_137', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00503', 'BK0252', 'FL024', 'AC01_128', 'PA002', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00504', 'BK0252', 'FL024', 'AC01_95', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00505', 'BK0253', 'FL102', 'AC01_127', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00506', 'BK0253', 'FL102', 'AC01_60', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00507', 'BK0254', 'FL137', 'AC09_147', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00508', 'BK0254', 'FL137', 'AC09_86', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00509', 'BK0255', 'FL096', 'AC10_137', 'PA035', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00510', 'BK0255', 'FL096', 'AC10_33', 'PA057', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00511', 'BK0255', 'FL096', 'AC10_30', 'PA012', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00512', 'BK0256', 'FL024', 'AC01_44', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00513', 'BK0257', 'FL066', 'AC13_112', 'PA024', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00514', 'BK0258', 'FL057', 'AC04_105', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00515', 'BK0259', 'FL052', 'AC04_140', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00516', 'BK0259', 'FL052', 'AC04_95', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00517', 'BK0260', 'FL132', 'AC12_43', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00518', 'BK0261', 'FL029', 'AC09_23', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00519', 'BK0261', 'FL029', 'AC09_74', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00520', 'BK0262', 'FL015', 'AC05_109', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00521', 'BK0262', 'FL015', 'AC05_74', 'PA036', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00522', 'BK0262', 'FL015', 'AC05_20', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00523', 'BK0263', 'FL119', 'AC15_18', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00524', 'BK0264', 'FL119', 'AC15_67', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00525', 'BK0264', 'FL119', 'AC15_96', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00526', 'BK0265', 'FL061', 'AC13_67', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00527', 'BK0266', 'FL135', 'AC04_71', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00528', 'BK0266', 'FL135', 'AC04_79', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00529', 'BK0266', 'FL135', 'AC04_122', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00530', 'BK0267', 'FL026', 'AC12_60', 'PA036', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00531', 'BK0268', 'FL064', 'AC02_85', 'PA026', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00532', 'BK0268', 'FL064', 'AC02_91', 'PA010', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00533', 'BK0268', 'FL064', 'AC02_9', 'PA006', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00534', 'BK0269', 'FL069', 'AC14_141', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00535', 'BK0270', 'FL036', 'AC11_107', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00536', 'BK0270', 'FL036', 'AC11_105', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00537', 'BK0270', 'FL036', 'AC11_5', 'PA052', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00538', 'BK0271', 'FL082', 'AC13_36', 'PA002', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00539', 'BK0272', 'FL091', 'AC01_54', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00540', 'BK0272', 'FL091', 'AC01_68', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00541', 'BK0272', 'FL091', 'AC01_147', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00542', 'BK0273', 'FL102', 'AC01_70', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00543', 'BK0273', 'FL102', 'AC01_65', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00544', 'BK0274', 'FL084', 'AC06_123', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00545', 'BK0275', 'FL027', 'AC06_25', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00546', 'BK0275', 'FL027', 'AC06_99', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00547', 'BK0276', 'FL136', 'AC01_32', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00548', 'BK0276', 'FL136', 'AC01_133', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00549', 'BK0277', 'FL018', 'AC03_4', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00550', 'BK0278', 'FL068', 'AC10_5', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00551', 'BK0279', 'FL141', 'AC01_94', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00552', 'BK0280', 'FL110', 'AC02_17', 'PA018', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00553', 'BK0280', 'FL110', 'AC02_26', 'PA027', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00554', 'BK0281', 'FL046', 'AC05_82', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00555', 'BK0282', 'FL005', 'AC15_68', 'PA024', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00556', 'BK0282', 'FL005', 'AC15_22', 'PA022', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00557', 'BK0283', 'FL078', 'AC14_78', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00558', 'BK0283', 'FL078', 'AC14_62', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00559', 'BK0284', 'FL144', 'AC12_70', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00560', 'BK0285', 'FL134', 'AC12_105', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00561', 'BK0285', 'FL134', 'AC12_7', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00562', 'BK0285', 'FL134', 'AC12_41', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00563', 'BK0286', 'FL139', 'AC09_148', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00564', 'BK0287', 'FL083', 'AC03_57', 'PA015', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00565', 'BK0288', 'FL081', 'AC07_95', 'PA002', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00566', 'BK0288', 'FL081', 'AC07_48', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00567', 'BK0289', 'FL102', 'AC01_20', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00568', 'BK0289', 'FL102', 'AC01_144', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00569', 'BK0289', 'FL102', 'AC01_135', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00570', 'BK0290', 'FL039', 'AC04_2', 'PA051', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00571', 'BK0291', 'FL045', 'AC06_35', 'PA060', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00572', 'BK0292', 'FL107', 'AC12_111', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00573', 'BK0292', 'FL107', 'AC12_32', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00574', 'BK0292', 'FL107', 'AC12_66', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00575', 'BK0293', 'FL096', 'AC10_41', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00576', 'BK0294', 'FL107', 'AC12_16', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00577', 'BK0295', 'FL091', 'AC01_57', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00578', 'BK0296', 'FL132', 'AC12_8', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00579', 'BK0297', 'FL128', 'AC03_27', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00580', 'BK0297', 'FL128', 'AC03_113', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00581', 'BK0297', 'FL128', 'AC03_100', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00582', 'BK0298', 'FL035', 'AC01_113', 'PA043', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00583', 'BK0299', 'FL096', 'AC10_149', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00584', 'BK0299', 'FL096', 'AC10_125', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00585', 'BK0299', 'FL096', 'AC10_118', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00586', 'BK0300', 'FL091', 'AC01_50', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00587', 'BK0300', 'FL091', 'AC01_1', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00588', 'BK0300', 'FL091', 'AC01_123', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00589', 'BK0301', 'FL074', 'AC06_107', 'PA008', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00590', 'BK0301', 'FL074', 'AC06_6', 'PA031', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00591', 'BK0301', 'FL074', 'AC06_150', 'PA009', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00592', 'BK0302', 'FL020', 'AC07_51', 'PA002', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00593', 'BK0302', 'FL020', 'AC07_49', 'PA041', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00594', 'BK0302', 'FL020', 'AC07_99', 'PA055', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00595', 'BK0303', 'FL106', 'AC09_128', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00596', 'BK0304', 'FL057', 'AC04_88', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00597', 'BK0304', 'FL057', 'AC04_43', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00598', 'BK0304', 'FL057', 'AC04_45', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00599', 'BK0305', 'FL061', 'AC13_105', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00600', 'BK0305', 'FL061', 'AC13_29', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00601', 'BK0306', 'FL077', 'AC02_60', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00602', 'BK0307', 'FL073', 'AC01_89', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00603', 'BK0308', 'FL130', 'AC13_34', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00604', 'BK0309', 'FL007', 'AC06_24', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00605', 'BK0310', 'FL106', 'AC09_140', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00606', 'BK0311', 'FL029', 'AC09_84', 'PA011', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00607', 'BK0311', 'FL029', 'AC09_100', 'PA014', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00608', 'BK0312', 'FL086', 'AC12_17', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00609', 'BK0313', 'FL055', 'AC07_94', 'PA004', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00610', 'BK0313', 'FL055', 'AC07_78', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00611', 'BK0313', 'FL055', 'AC07_31', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00612', 'BK0314', 'FL072', 'AC01_31', 'PA043', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00613', 'BK0314', 'FL072', 'AC01_52', 'PA027', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00614', 'BK0315', 'FL149', 'AC04_122', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00615', 'BK0315', 'FL149', 'AC04_61', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00616', 'BK0315', 'FL149', 'AC04_141', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00617', 'BK0316', 'FL137', 'AC09_116', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00618', 'BK0316', 'FL137', 'AC09_31', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00619', 'BK0317', 'FL002', 'AC06_28', 'PA016', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00620', 'BK0318', 'FL018', 'AC03_49', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00621', 'BK0318', 'FL018', 'AC03_60', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00622', 'BK0318', 'FL018', 'AC03_116', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00623', 'BK0319', 'FL100', 'AC03_116', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00624', 'BK0319', 'FL100', 'AC03_73', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00625', 'BK0319', 'FL100', 'AC03_135', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00626', 'BK0320', 'FL003', 'AC07_67', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00627', 'BK0320', 'FL003', 'AC07_108', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00628', 'BK0321', 'FL082', 'AC13_44', 'PA029', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00629', 'BK0321', 'FL082', 'AC13_135', 'PA049', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00630', 'BK0322', 'FL056', 'AC02_25', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00631', 'BK0323', 'FL119', 'AC15_24', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00632', 'BK0323', 'FL119', 'AC15_128', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00633', 'BK0323', 'FL119', 'AC15_117', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00634', 'BK0324', 'FL084', 'AC06_136', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00635', 'BK0324', 'FL084', 'AC06_106', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00636', 'BK0325', 'FL138', 'AC03_74', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00637', 'BK0326', 'FL139', 'AC09_15', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00638', 'BK0326', 'FL139', 'AC09_40', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00639', 'BK0326', 'FL139', 'AC09_18', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00640', 'BK0327', 'FL022', 'AC09_120', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00641', 'BK0327', 'FL022', 'AC09_89', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00642', 'BK0327', 'FL022', 'AC09_126', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00643', 'BK0328', 'FL139', 'AC09_133', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00644', 'BK0329', 'FL047', 'AC01_87', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00645', 'BK0329', 'FL047', 'AC01_74', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00646', 'BK0330', 'FL003', 'AC07_109', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00647', 'BK0331', 'FL017', 'AC09_62', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00648', 'BK0331', 'FL017', 'AC09_52', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00649', 'BK0331', 'FL017', 'AC09_141', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00650', 'BK0332', 'FL042', 'AC04_138', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00651', 'BK0332', 'FL042', 'AC04_3', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00652', 'BK0332', 'FL042', 'AC04_86', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00653', 'BK0333', 'FL135', 'AC04_12', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00654', 'BK0333', 'FL135', 'AC04_67', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00655', 'BK0333', 'FL135', 'AC04_74', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00656', 'BK0334', 'FL053', 'AC07_9', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00657', 'BK0335', 'FL026', 'AC12_53', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00658', 'BK0335', 'FL026', 'AC12_31', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00659', 'BK0336', 'FL056', 'AC02_15', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00660', 'BK0336', 'FL056', 'AC02_28', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00661', 'BK0336', 'FL056', 'AC02_11', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00662', 'BK0337', 'FL104', 'AC04_80', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00663', 'BK0338', 'FL004', 'AC01_120', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00664', 'BK0338', 'FL004', 'AC01_42', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00665', 'BK0339', 'FL003', 'AC07_18', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00666', 'BK0339', 'FL003', 'AC07_8', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00667', 'BK0340', 'FL002', 'AC06_141', 'PA010', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00668', 'BK0341', 'FL085', 'AC04_130', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00669', 'BK0342', 'FL131', 'AC11_60', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00670', 'BK0343', 'FL102', 'AC01_55', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00671', 'BK0344', 'FL028', 'AC09_2', 'PA058', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00672', 'BK0344', 'FL028', 'AC09_126', 'PA012', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00673', 'BK0344', 'FL028', 'AC09_113', 'PA017', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00674', 'BK0345', 'FL007', 'AC06_139', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00675', 'BK0345', 'FL007', 'AC06_137', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00676', 'BK0346', 'FL013', 'AC13_84', 'PA002', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00677', 'BK0346', 'FL013', 'AC13_76', 'PA012', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00678', 'BK0346', 'FL013', 'AC13_131', 'PA006', 3000000, 'BOOKED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00679', 'BK0347', 'FL044', 'AC15_63', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00680', 'BK0348', 'FL111', 'AC05_44', 'PA005', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00681', 'BK0348', 'FL111', 'AC05_119', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00682', 'BK0348', 'FL111', 'AC05_23', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00683', 'BK0349', 'FL150', 'AC01_134', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00684', 'BK0349', 'FL150', 'AC01_87', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00685', 'BK0349', 'FL150', 'AC01_66', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00686', 'BK0350', 'FL081', 'AC07_33', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00687', 'BK0350', 'FL081', 'AC07_109', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00688', 'BK0351', 'FL059', 'AC01_129', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00689', 'BK0352', 'FL048', 'AC12_42', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00690', 'BK0352', 'FL048', 'AC12_10', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00691', 'BK0352', 'FL048', 'AC12_96', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00692', 'BK0353', 'FL003', 'AC07_62', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00693', 'BK0353', 'FL003', 'AC07_21', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00694', 'BK0353', 'FL003', 'AC07_142', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00695', 'BK0354', 'FL086', 'AC12_55', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00696', 'BK0354', 'FL086', 'AC12_136', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00697', 'BK0355', 'FL026', 'AC12_80', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00698', 'BK0355', 'FL026', 'AC12_48', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00699', 'BK0356', 'FL093', 'AC14_40', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00700', 'BK0356', 'FL093', 'AC14_68', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00701', 'BK0357', 'FL062', 'AC05_7', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00702', 'BK0358', 'FL043', 'AC02_127', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00703', 'BK0359', 'FL076', 'AC11_7', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00704', 'BK0359', 'FL076', 'AC11_148', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00705', 'BK0360', 'FL132', 'AC12_141', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00706', 'BK0361', 'FL043', 'AC02_12', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00707', 'BK0362', 'FL006', 'AC15_42', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00708', 'BK0362', 'FL006', 'AC15_55', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00709', 'BK0362', 'FL006', 'AC15_92', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00710', 'BK0363', 'FL061', 'AC13_26', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00711', 'BK0364', 'FL100', 'AC03_107', 'PA041', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00712', 'BK0364', 'FL100', 'AC03_119', 'PA031', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00713', 'BK0364', 'FL100', 'AC03_99', 'PA024', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00714', 'BK0365', 'FL054', 'AC03_49', 'PA004', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00715', 'BK0365', 'FL054', 'AC03_12', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00716', 'BK0366', 'FL021', 'AC07_74', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00717', 'BK0367', 'FL024', 'AC01_108', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00718', 'BK0367', 'FL024', 'AC01_121', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00719', 'BK0367', 'FL024', 'AC01_29', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00720', 'BK0368', 'FL142', 'AC03_16', 'PA039', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00721', 'BK0368', 'FL142', 'AC03_37', 'PA003', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00722', 'BK0369', 'FL065', 'AC03_136', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00723', 'BK0370', 'FL007', 'AC06_110', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00724', 'BK0371', 'FL125', 'AC01_52', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00725', 'BK0371', 'FL125', 'AC01_33', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00726', 'BK0371', 'FL125', 'AC01_106', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00727', 'BK0372', 'FL052', 'AC04_89', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00728', 'BK0372', 'FL052', 'AC04_94', 'PA005', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00729', 'BK0372', 'FL052', 'AC04_78', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00730', 'BK0373', 'FL076', 'AC11_71', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00731', 'BK0374', 'FL114', 'AC08_89', 'PA004', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00732', 'BK0374', 'FL114', 'AC08_140', 'PA026', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00733', 'BK0374', 'FL114', 'AC08_118', 'PA033', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00734', 'BK0375', 'FL100', 'AC03_123', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00735', 'BK0376', 'FL078', 'AC14_27', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00736', 'BK0376', 'FL078', 'AC14_12', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00737', 'BK0377', 'FL024', 'AC01_138', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00738', 'BK0378', 'FL113', 'AC15_126', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00739', 'BK0378', 'FL113', 'AC15_141', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00740', 'BK0379', 'FL145', 'AC04_137', 'PA026', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00741', 'BK0380', 'FL031', 'AC13_59', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00742', 'BK0380', 'FL031', 'AC13_128', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00743', 'BK0381', 'FL002', 'AC06_37', 'PA040', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00744', 'BK0382', 'FL109', 'AC07_100', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00745', 'BK0382', 'FL109', 'AC07_65', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00746', 'BK0382', 'FL109', 'AC07_15', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00747', 'BK0383', 'FL036', 'AC11_98', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00748', 'BK0383', 'FL036', 'AC11_106', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00749', 'BK0384', 'FL026', 'AC12_116', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00750', 'BK0384', 'FL026', 'AC12_110', 'PA005', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00751', 'BK0384', 'FL026', 'AC12_92', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00752', 'BK0385', 'FL001', 'AC03_106', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00753', 'BK0385', 'FL001', 'AC03_97', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00754', 'BK0385', 'FL001', 'AC03_113', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00755', 'BK0386', 'FL140', 'AC04_26', 'PA047', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00756', 'BK0386', 'FL140', 'AC04_115', 'PA013', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00757', 'BK0387', 'FL149', 'AC04_102', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00758', 'BK0388', 'FL080', 'AC06_56', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00759', 'BK0388', 'FL080', 'AC06_88', 'PA023', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00760', 'BK0388', 'FL080', 'AC06_93', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00761', 'BK0389', 'FL029', 'AC09_53', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00762', 'BK0389', 'FL029', 'AC09_83', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00763', 'BK0389', 'FL029', 'AC09_36', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00764', 'BK0390', 'FL043', 'AC02_78', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00765', 'BK0390', 'FL043', 'AC02_1', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00766', 'BK0391', 'FL039', 'AC04_34', 'PA052', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00767', 'BK0391', 'FL039', 'AC04_75', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00768', 'BK0391', 'FL039', 'AC04_100', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00769', 'BK0392', 'FL067', 'AC01_144', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00770', 'BK0392', 'FL067', 'AC01_116', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00771', 'BK0393', 'FL052', 'AC04_41', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00772', 'BK0393', 'FL052', 'AC04_36', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00773', 'BK0393', 'FL052', 'AC04_38', 'PA029', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00774', 'BK0394', 'FL060', 'AC13_114', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00775', 'BK0394', 'FL060', 'AC13_107', 'PA004', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00776', 'BK0395', 'FL085', 'AC04_106', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00777', 'BK0395', 'FL085', 'AC04_143', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00778', 'BK0395', 'FL085', 'AC04_71', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00779', 'BK0396', 'FL117', 'AC14_102', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00780', 'BK0396', 'FL117', 'AC14_50', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00781', 'BK0397', 'FL001', 'AC03_81', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00782', 'BK0398', 'FL017', 'AC09_67', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00783', 'BK0398', 'FL017', 'AC09_142', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00784', 'BK0399', 'FL132', 'AC12_82', 'PA030', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00785', 'BK0400', 'FL097', 'AC14_12', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00786', 'BK0400', 'FL097', 'AC14_11', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00787', 'BK0401', 'FL050', 'AC07_58', 'PA005', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00788', 'BK0402', 'FL029', 'AC09_21', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00789', 'BK0402', 'FL029', 'AC09_8', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00790', 'BK0403', 'FL104', 'AC04_150', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00791', 'BK0403', 'FL104', 'AC04_18', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00792', 'BK0403', 'FL104', 'AC04_39', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00793', 'BK0404', 'FL032', 'AC08_130', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00794', 'BK0404', 'FL032', 'AC08_129', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00795', 'BK0404', 'FL032', 'AC08_122', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00796', 'BK0405', 'FL036', 'AC11_80', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00797', 'BK0406', 'FL039', 'AC04_132', 'PA009', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00798', 'BK0406', 'FL039', 'AC04_101', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00799', 'BK0406', 'FL039', 'AC04_125', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00800', 'BK0407', 'FL025', 'AC15_124', 'PA004', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00801', 'BK0407', 'FL025', 'AC15_79', 'PA048', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00802', 'BK0407', 'FL025', 'AC15_139', 'PA010', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00803', 'BK0408', 'FL074', 'AC06_120', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00804', 'BK0409', 'FL116', 'AC12_108', 'PA050', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00805', 'BK0409', 'FL116', 'AC12_32', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00806', 'BK0410', 'FL080', 'AC06_2', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00807', 'BK0411', 'FL043', 'AC02_147', 'PA058', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00808', 'BK0411', 'FL043', 'AC02_14', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00809', 'BK0411', 'FL043', 'AC02_105', 'PA012', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00810', 'BK0412', 'FL009', 'AC03_132', 'PA011', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00811', 'BK0413', 'FL028', 'AC09_102', 'PA023', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00812', 'BK0413', 'FL028', 'AC09_37', 'PA026', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00813', 'BK0414', 'FL064', 'AC02_69', 'PA035', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00814', 'BK0414', 'FL064', 'AC02_116', 'PA051', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00815', 'BK0414', 'FL064', 'AC02_90', 'PA019', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00816', 'BK0415', 'FL023', 'AC03_113', 'PA042', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00817', 'BK0415', 'FL023', 'AC03_31', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00818', 'BK0415', 'FL023', 'AC03_20', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00819', 'BK0416', 'FL057', 'AC04_54', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00820', 'BK0416', 'FL057', 'AC04_75', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00821', 'BK0417', 'FL011', 'AC12_5', 'PA040', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00822', 'BK0417', 'FL011', 'AC12_84', 'PA057', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00823', 'BK0418', 'FL063', 'AC15_125', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00824', 'BK0419', 'FL038', 'AC01_42', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00825', 'BK0419', 'FL038', 'AC01_16', 'PA035', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00826', 'BK0419', 'FL038', 'AC01_7', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00827', 'BK0420', 'FL050', 'AC07_6', 'PA030', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00828', 'BK0421', 'FL145', 'AC04_121', 'PA034', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00829', 'BK0421', 'FL145', 'AC04_116', 'PA013', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00830', 'BK0421', 'FL145', 'AC04_14', 'PA040', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00831', 'BK0422', 'FL101', 'AC04_25', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00832', 'BK0423', 'FL031', 'AC13_119', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00833', 'BK0424', 'FL124', 'AC02_44', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00834', 'BK0424', 'FL124', 'AC02_97', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00835', 'BK0424', 'FL124', 'AC02_130', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00836', 'BK0425', 'FL015', 'AC05_137', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00837', 'BK0425', 'FL015', 'AC05_73', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00838', 'BK0426', 'FL028', 'AC09_45', 'PA042', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00839', 'BK0426', 'FL028', 'AC09_118', 'PA003', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00840', 'BK0426', 'FL028', 'AC09_6', 'PA013', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00841', 'BK0427', 'FL129', 'AC15_59', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00842', 'BK0427', 'FL129', 'AC15_96', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00843', 'BK0427', 'FL129', 'AC15_127', 'PA038', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00844', 'BK0428', 'FL076', 'AC11_108', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00845', 'BK0428', 'FL076', 'AC11_55', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00846', 'BK0429', 'FL051', 'AC01_76', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00847', 'BK0430', 'FL136', 'AC01_73', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00848', 'BK0431', 'FL070', 'AC02_86', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00849', 'BK0431', 'FL070', 'AC02_61', 'PA059', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00850', 'BK0432', 'FL039', 'AC04_135', 'PA002', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00851', 'BK0432', 'FL039', 'AC04_62', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00852', 'BK0432', 'FL039', 'AC04_112', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00853', 'BK0433', 'FL040', 'AC13_6', 'PA037', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00854', 'BK0434', 'FL032', 'AC08_143', 'PA052', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00855', 'BK0434', 'FL032', 'AC08_109', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00856', 'BK0435', 'FL094', 'AC09_16', 'PA017', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00857', 'BK0436', 'FL068', 'AC10_92', 'PA004', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00858', 'BK0436', 'FL068', 'AC10_89', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00859', 'BK0437', 'FL043', 'AC02_2', 'PA053', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00860', 'BK0437', 'FL043', 'AC02_31', 'PA021', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00861', 'BK0438', 'FL012', 'AC10_82', 'PA041', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00862', 'BK0439', 'FL127', 'AC10_57', 'PA031', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00863', 'BK0439', 'FL127', 'AC10_103', 'PA049', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00864', 'BK0439', 'FL127', 'AC10_102', 'PA057', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00865', 'BK0440', 'FL047', 'AC01_15', 'PA003', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00866', 'BK0440', 'FL047', 'AC01_126', 'PA040', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00867', 'BK0440', 'FL047', 'AC01_65', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00868', 'BK0441', 'FL070', 'AC02_59', 'PA031', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00869', 'BK0442', 'FL095', 'AC03_109', 'PA046', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00870', 'BK0442', 'FL095', 'AC03_134', 'PA052', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00871', 'BK0442', 'FL095', 'AC03_61', 'PA032', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00872', 'BK0443', 'FL094', 'AC09_95', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00873', 'BK0444', 'FL058', 'AC07_137', 'PA015', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00874', 'BK0444', 'FL058', 'AC07_27', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00875', 'BK0444', 'FL058', 'AC07_69', 'PA014', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00876', 'BK0445', 'FL036', 'AC11_36', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00877', 'BK0446', 'FL038', 'AC01_28', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00878', 'BK0446', 'FL038', 'AC01_50', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00879', 'BK0447', 'FL136', 'AC01_23', 'PA027', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00880', 'BK0447', 'FL136', 'AC01_92', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00881', 'BK0448', 'FL015', 'AC05_98', 'PA043', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00882', 'BK0448', 'FL015', 'AC05_142', 'PA015', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00883', 'BK0448', 'FL015', 'AC05_27', 'PA028', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00884', 'BK0449', 'FL017', 'AC09_80', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00885', 'BK0450', 'FL091', 'AC01_10', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00886', 'BK0450', 'FL091', 'AC01_78', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00887', 'BK0450', 'FL091', 'AC01_79', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00888', 'BK0451', 'FL074', 'AC06_99', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00889', 'BK0451', 'FL074', 'AC06_21', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00890', 'BK0451', 'FL074', 'AC06_148', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00891', 'BK0452', 'FL025', 'AC15_135', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00892', 'BK0453', 'FL075', 'AC11_56', 'PA030', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00893', 'BK0453', 'FL075', 'AC11_7', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00894', 'BK0453', 'FL075', 'AC11_127', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00895', 'BK0454', 'FL072', 'AC01_127', 'PA019', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00896', 'BK0455', 'FL100', 'AC03_69', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00897', 'BK0455', 'FL100', 'AC03_91', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00898', 'BK0455', 'FL100', 'AC03_103', 'PA055', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00899', 'BK0456', 'FL049', 'AC11_116', 'PA033', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00900', 'BK0456', 'FL049', 'AC11_31', 'PA037', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00901', 'BK0456', 'FL049', 'AC11_37', 'PA060', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00902', 'BK0457', 'FL083', 'AC03_131', 'PA016', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00903', 'BK0458', 'FL020', 'AC07_93', 'PA011', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00904', 'BK0458', 'FL020', 'AC07_95', 'PA037', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00905', 'BK0459', 'FL120', 'AC04_92', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00906', 'BK0460', 'FL082', 'AC13_8', 'PA026', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00907', 'BK0461', 'FL056', 'AC02_53', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00908', 'BK0461', 'FL056', 'AC02_97', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00909', 'BK0462', 'FL022', 'AC09_142', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00910', 'BK0462', 'FL022', 'AC09_93', 'PA045', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00911', 'BK0463', 'FL106', 'AC09_149', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00912', 'BK0463', 'FL106', 'AC09_87', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00913', 'BK0463', 'FL106', 'AC09_13', 'PA006', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00914', 'BK0464', 'FL062', 'AC05_74', 'PA002', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00915', 'BK0465', 'FL025', 'AC15_97', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00916', 'BK0465', 'FL025', 'AC15_20', 'PA022', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00917', 'BK0465', 'FL025', 'AC15_5', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00918', 'BK0466', 'FL031', 'AC13_72', 'PA048', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00919', 'BK0466', 'FL031', 'AC13_22', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00920', 'BK0466', 'FL031', 'AC13_84', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00921', 'BK0467', 'FL104', 'AC04_106', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00922', 'BK0467', 'FL104', 'AC04_15', 'PA004', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00923', 'BK0467', 'FL104', 'AC04_45', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00924', 'BK0468', 'FL083', 'AC03_3', 'PA049', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00925', 'BK0468', 'FL083', 'AC03_136', 'PA001', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00926', 'BK0469', 'FL054', 'AC03_35', 'PA024', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00927', 'BK0469', 'FL054', 'AC03_122', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00928', 'BK0470', 'FL001', 'AC03_44', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00929', 'BK0471', 'FL064', 'AC02_123', 'PA040', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00930', 'BK0472', 'FL021', 'AC07_100', 'PA056', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00931', 'BK0472', 'FL021', 'AC07_127', 'PA025', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00932', 'BK0473', 'FL059', 'AC01_4', 'PA050', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00933', 'BK0474', 'FL058', 'AC07_56', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00934', 'BK0475', 'FL063', 'AC15_52', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00935', 'BK0475', 'FL063', 'AC15_83', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00936', 'BK0475', 'FL063', 'AC15_61', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00937', 'BK0476', 'FL036', 'AC11_120', 'PA051', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00938', 'BK0476', 'FL036', 'AC11_45', 'PA031', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00939', 'BK0476', 'FL036', 'AC11_53', 'PA047', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00940', 'BK0477', 'FL020', 'AC07_138', 'PA013', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00941', 'BK0478', 'FL043', 'AC02_144', 'PA054', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00942', 'BK0479', 'FL101', 'AC04_96', 'PA016', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00943', 'BK0479', 'FL101', 'AC04_129', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00944', 'BK0480', 'FL130', 'AC13_10', 'PA039', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00945', 'BK0480', 'FL130', 'AC13_115', 'PA040', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00946', 'BK0481', 'FL145', 'AC04_114', 'PA039', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00947', 'BK0481', 'FL145', 'AC04_124', 'PA015', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00948', 'BK0481', 'FL145', 'AC04_141', 'PA024', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00949', 'BK0482', 'FL135', 'AC04_144', 'PA033', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00950', 'BK0482', 'FL135', 'AC04_44', 'PA019', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00951', 'BK0482', 'FL135', 'AC04_128', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00952', 'BK0483', 'FL103', 'AC10_62', 'PA043', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00953', 'BK0483', 'FL103', 'AC10_41', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00954', 'BK0484', 'FL038', 'AC01_114', 'PA026', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00955', 'BK0484', 'FL038', 'AC01_56', 'PA007', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00956', 'BK0485', 'FL130', 'AC13_89', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00957', 'BK0485', 'FL130', 'AC13_23', 'PA028', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00958', 'BK0486', 'FL002', 'AC06_82', 'PA048', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00959', 'BK0486', 'FL002', 'AC06_19', 'PA015', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00960', 'BK0487', 'FL074', 'AC06_67', 'PA018', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00961', 'BK0487', 'FL074', 'AC06_94', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00962', 'BK0487', 'FL074', 'AC06_29', 'PA034', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00963', 'BK0488', 'FL106', 'AC09_120', 'PA036', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00964', 'BK0488', 'FL106', 'AC09_36', 'PA032', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00965', 'BK0489', 'FL112', 'AC11_52', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00966', 'BK0489', 'FL112', 'AC11_23', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00967', 'BK0490', 'FL042', 'AC04_63', 'PA008', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00968', 'BK0491', 'FL124', 'AC02_7', 'PA052', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00969', 'BK0492', 'FL117', 'AC14_135', 'PA039', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00970', 'BK0492', 'FL117', 'AC14_11', 'PA046', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00971', 'BK0493', 'FL071', 'AC07_89', 'PA015', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00972', 'BK0493', 'FL071', 'AC07_116', 'PA024', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00973', 'BK0493', 'FL071', 'AC07_70', 'PA028', 3000000, 'PAID');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00974', 'BK0494', 'FL127', 'AC10_36', 'PA060', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00975', 'BK0495', 'FL092', 'AC01_4', 'PA054', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00976', 'BK0496', 'FL048', 'AC12_33', 'PA057', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00977', 'BK0497', 'FL080', 'AC06_49', 'PA060', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00978', 'BK0497', 'FL080', 'AC06_19', 'PA010', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00979', 'BK0498', 'FL149', 'AC04_60', 'PA018', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00980', 'BK0498', 'FL149', 'AC04_132', 'PA056', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00981', 'BK0498', 'FL149', 'AC04_6', 'PA015', 3000000, 'CANCELLED');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00982', 'BK0499', 'FL040', 'AC13_133', 'PA044', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00983', 'BK0499', 'FL040', 'AC13_29', 'PA020', 3000000, 'CHECKED-IN');
INSERT INTO TICKET (TicketID, BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES ('TK00984', 'BK0500', 'FL135', 'AC04_29', 'PA036', 3000000, 'CANCELLED');

-- BẢNG THANH TOÁN (PAYMENT) VÀ LỊCH SỬ GIAO DỊCH (TRANSACTION_HISTORY)
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00001', 'BK0001', TO_DATE('2026-06-21 20:19:09', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00001', 'CUS07', 'BK0001', 'PAY00001', 'PAYMENT', 3000000, TO_DATE('2026-06-21 20:19:09', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00002', 'BK0002', TO_DATE('2026-01-25 23:35:33', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00002', 'CUS01', 'BK0002', 'PAY00002', 'PAYMENT', 6000000, TO_DATE('2026-01-25 23:35:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00003', 'BK0003', TO_DATE('2025-09-21 20:12:51', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00003', 'CUS34', 'BK0003', 'PAY00003', 'PAYMENT', 9000000, TO_DATE('2025-09-21 20:12:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00004', 'BK0004', TO_DATE('2025-09-11 23:48:57', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00004', 'CUS26', 'BK0004', 'PAY00004', 'PAYMENT', 9000000, TO_DATE('2025-09-11 23:48:57', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00005', 'BK0005', TO_DATE('2025-10-04 22:03:57', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00005', 'CUS29', 'BK0005', 'PAY00005', 'PAYMENT', 6000000, TO_DATE('2025-10-04 22:03:57', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00006', 'BK0006', TO_DATE('2026-05-19 02:52:49', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00006', 'CUS23', 'BK0006', 'PAY00006', 'PAYMENT', 6000000, TO_DATE('2026-05-19 02:52:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00007', 'BK0007', TO_DATE('2025-12-26 23:33:16', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00007', 'CUS17', 'BK0007', 'PAY00007', 'PAYMENT', 9000000, TO_DATE('2025-12-26 23:33:16', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00008', 'BK0008', TO_DATE('2026-01-05 20:41:35', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00008', 'CUS11', 'BK0008', 'PAY00008', 'PAYMENT', 3000000, TO_DATE('2026-01-05 20:41:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00009', 'BK0009', TO_DATE('2025-07-07 06:16:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00009', 'CUS17', 'BK0009', 'PAY00009', 'PAYMENT', 3000000, TO_DATE('2025-07-07 06:16:31', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00010', 'BK0010', TO_DATE('2025-05-11 00:23:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00010', 'CUS29', 'BK0010', 'PAY00010', 'PAYMENT', 9000000, TO_DATE('2025-05-11 00:23:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00011', 'BK0011', TO_DATE('2026-05-27 23:26:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00011', 'CUS35', 'BK0011', 'PAY00011', 'PAYMENT', 3000000, TO_DATE('2026-05-27 23:26:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00012', 'BK0012', TO_DATE('2026-07-02 12:14:47', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00012', 'CUS29', 'BK0012', 'PAY00012', 'PAYMENT', 6000000, TO_DATE('2026-07-02 12:14:47', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00013', 'BK0013', TO_DATE('2026-07-04 23:12:01', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00013', 'CUS19', 'BK0013', 'PAY00013', 'PAYMENT', 3000000, TO_DATE('2026-07-04 23:12:01', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00014', 'BK0014', TO_DATE('2025-12-11 03:09:16', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00014', 'CUS25', 'BK0014', 'PAY00014', 'PAYMENT', 9000000, TO_DATE('2025-12-11 03:09:16', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00015', 'BK0015', TO_DATE('2025-12-10 10:14:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00015', 'CUS29', 'BK0015', 'PAY00015', 'PAYMENT', 6000000, TO_DATE('2025-12-10 10:14:25', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00016', 'BK0016', TO_DATE('2026-04-26 02:02:21', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00016', 'CUS03', 'BK0016', 'PAY00016', 'PAYMENT', 3000000, TO_DATE('2026-04-26 02:02:21', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00017', 'BK0017', TO_DATE('2025-10-10 16:21:52', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00017', 'CUS31', 'BK0017', 'PAY00017', 'PAYMENT', 6000000, TO_DATE('2025-10-10 16:21:52', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00018', 'BK0018', TO_DATE('2025-09-04 08:57:12', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00018', 'CUS13', 'BK0018', 'PAY00018', 'PAYMENT', 9000000, TO_DATE('2025-09-04 08:57:12', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00019', 'BK0019', TO_DATE('2025-10-28 23:43:05', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00019', 'CUS19', 'BK0019', 'PAY00019', 'PAYMENT', 3000000, TO_DATE('2025-10-28 23:43:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00020', 'BK0020', TO_DATE('2025-06-28 10:52:41', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00020', 'CUS09', 'BK0020', 'PAY00020', 'PAYMENT', 3000000, TO_DATE('2025-06-28 10:52:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00021', 'BK0021', TO_DATE('2025-10-06 06:09:18', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00021', 'CUS08', 'BK0021', 'PAY00021', 'PAYMENT', 9000000, TO_DATE('2025-10-06 06:09:18', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00022', 'BK0022', TO_DATE('2026-03-22 17:02:26', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00022', 'CUS34', 'BK0022', 'PAY00022', 'PAYMENT', 3000000, TO_DATE('2026-03-22 17:02:26', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00023', 'BK0023', TO_DATE('2026-05-09 13:32:08', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00023', 'CUS25', 'BK0023', 'PAY00023', 'PAYMENT', 9000000, TO_DATE('2026-05-09 13:32:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00024', 'BK0024', TO_DATE('2025-06-04 12:36:37', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00024', 'CUS13', 'BK0024', 'PAY00024', 'PAYMENT', 6000000, TO_DATE('2025-06-04 12:36:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00025', 'BK0025', TO_DATE('2026-07-11 14:01:55', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00025', 'CUS17', 'BK0025', 'PAY00025', 'PAYMENT', 9000000, TO_DATE('2026-07-11 14:01:55', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00026', 'BK0026', TO_DATE('2026-02-27 10:16:20', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00026', 'CUS15', 'BK0026', 'PAY00026', 'PAYMENT', 6000000, TO_DATE('2026-02-27 10:16:20', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00027', 'BK0027', TO_DATE('2025-09-21 23:33:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00027', 'CUS02', 'BK0027', 'PAY00027', 'PAYMENT', 3000000, TO_DATE('2025-09-21 23:33:56', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00028', 'BK0028', TO_DATE('2025-12-14 04:59:39', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00028', 'CUS10', 'BK0028', 'PAY00028', 'PAYMENT', 3000000, TO_DATE('2025-12-14 04:59:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00029', 'BK0029', TO_DATE('2026-02-12 22:55:09', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00029', 'CUS30', 'BK0029', 'PAY00029', 'PAYMENT', 3000000, TO_DATE('2026-02-12 22:55:09', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00030', 'BK0030', TO_DATE('2025-08-25 07:14:29', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00030', 'CUS33', 'BK0030', 'PAY00030', 'PAYMENT', 9000000, TO_DATE('2025-08-25 07:14:29', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00031', 'BK0031', TO_DATE('2025-09-01 11:23:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00031', 'CUS25', 'BK0031', 'PAY00031', 'PAYMENT', 6000000, TO_DATE('2025-09-01 11:23:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00032', 'BK0032', TO_DATE('2025-06-03 19:35:20', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00032', 'CUS10', 'BK0032', 'PAY00032', 'PAYMENT', 9000000, TO_DATE('2025-06-03 19:35:20', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00033', 'BK0033', TO_DATE('2026-02-14 11:26:54', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00033', 'CUS11', 'BK0033', 'PAY00033', 'PAYMENT', 3000000, TO_DATE('2026-02-14 11:26:54', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00034', 'BK0034', TO_DATE('2025-11-28 08:42:21', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00034', 'CUS20', 'BK0034', 'PAY00034', 'PAYMENT', 6000000, TO_DATE('2025-11-28 08:42:21', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00035', 'BK0035', TO_DATE('2025-09-23 00:21:50', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00035', 'CUS23', 'BK0035', 'PAY00035', 'PAYMENT', 9000000, TO_DATE('2025-09-23 00:21:50', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00036', 'BK0036', TO_DATE('2025-08-23 10:15:53', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00036', 'CUS34', 'BK0036', 'PAY00036', 'PAYMENT', 9000000, TO_DATE('2025-08-23 10:15:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00037', 'BK0037', TO_DATE('2026-05-16 21:10:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00037', 'CUS32', 'BK0037', 'PAY00037', 'PAYMENT', 3000000, TO_DATE('2026-05-16 21:10:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00038', 'BK0038', TO_DATE('2025-11-12 07:28:13', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00038', 'CUS20', 'BK0038', 'PAY00038', 'PAYMENT', 6000000, TO_DATE('2025-11-12 07:28:13', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00039', 'BK0039', TO_DATE('2025-09-26 02:12:19', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00039', 'CUS29', 'BK0039', 'PAY00039', 'PAYMENT', 3000000, TO_DATE('2025-09-26 02:12:19', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00040', 'BK0040', TO_DATE('2026-05-10 17:27:08', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00040', 'CUS30', 'BK0040', 'PAY00040', 'PAYMENT', 9000000, TO_DATE('2026-05-10 17:27:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00041', 'BK0041', TO_DATE('2026-04-30 11:45:26', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00041', 'CUS16', 'BK0041', 'PAY00041', 'PAYMENT', 6000000, TO_DATE('2026-04-30 11:45:26', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00042', 'BK0042', TO_DATE('2025-11-20 17:38:37', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00042', 'CUS02', 'BK0042', 'PAY00042', 'PAYMENT', 3000000, TO_DATE('2025-11-20 17:38:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00043', 'BK0043', TO_DATE('2026-05-13 10:28:55', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00043', 'CUS22', 'BK0043', 'PAY00043', 'PAYMENT', 9000000, TO_DATE('2026-05-13 10:28:55', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00044', 'BK0044', TO_DATE('2025-08-16 20:36:20', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00044', 'CUS30', 'BK0044', 'PAY00044', 'PAYMENT', 9000000, TO_DATE('2025-08-16 20:36:20', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00045', 'BK0045', TO_DATE('2025-07-30 05:15:53', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00045', 'CUS29', 'BK0045', 'PAY00045', 'PAYMENT', 3000000, TO_DATE('2025-07-30 05:15:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00046', 'BK0046', TO_DATE('2025-08-21 13:17:34', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00046', 'CUS15', 'BK0046', 'PAY00046', 'PAYMENT', 6000000, TO_DATE('2025-08-21 13:17:34', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00047', 'BK0047', TO_DATE('2026-05-01 05:55:27', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00047', 'CUS04', 'BK0047', 'PAY00047', 'PAYMENT', 9000000, TO_DATE('2026-05-01 05:55:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00048', 'BK0048', TO_DATE('2026-06-07 10:08:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00048', 'CUS04', 'BK0048', 'PAY00048', 'PAYMENT', 6000000, TO_DATE('2026-06-07 10:08:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00049', 'BK0049', TO_DATE('2025-11-16 01:07:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00049', 'CUS02', 'BK0049', 'PAY00049', 'PAYMENT', 3000000, TO_DATE('2025-11-16 01:07:31', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00050', 'BK0050', TO_DATE('2025-09-21 02:43:35', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00050', 'CUS17', 'BK0050', 'PAY00050', 'PAYMENT', 6000000, TO_DATE('2025-09-21 02:43:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00051', 'BK0051', TO_DATE('2025-07-29 13:11:40', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00051', 'CUS01', 'BK0051', 'PAY00051', 'PAYMENT', 6000000, TO_DATE('2025-07-29 13:11:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00052', 'BK0052', TO_DATE('2026-01-02 23:18:30', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00052', 'CUS20', 'BK0052', 'PAY00052', 'PAYMENT', 6000000, TO_DATE('2026-01-02 23:18:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00053', 'BK0053', TO_DATE('2026-04-04 07:08:24', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00053', 'CUS20', 'BK0053', 'PAY00053', 'PAYMENT', 6000000, TO_DATE('2026-04-04 07:08:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00054', 'BK0054', TO_DATE('2025-11-08 09:26:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00054', 'CUS05', 'BK0054', 'PAY00054', 'PAYMENT', 9000000, TO_DATE('2025-11-08 09:26:17', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00055', 'BK0055', TO_DATE('2026-05-20 05:36:14', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00055', 'CUS29', 'BK0055', 'PAY00055', 'PAYMENT', 3000000, TO_DATE('2026-05-20 05:36:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00056', 'BK0056', TO_DATE('2026-01-12 21:47:49', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00056', 'CUS22', 'BK0056', 'PAY00056', 'PAYMENT', 9000000, TO_DATE('2026-01-12 21:47:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00057', 'BK0057', TO_DATE('2026-05-10 21:38:50', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00057', 'CUS23', 'BK0057', 'PAY00057', 'PAYMENT', 3000000, TO_DATE('2026-05-10 21:38:50', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00058', 'BK0058', TO_DATE('2026-03-26 04:41:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00058', 'CUS15', 'BK0058', 'PAY00058', 'PAYMENT', 9000000, TO_DATE('2026-03-26 04:41:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00059', 'BK0059', TO_DATE('2025-08-11 04:56:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00059', 'CUS18', 'BK0059', 'PAY00059', 'PAYMENT', 3000000, TO_DATE('2025-08-11 04:56:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00060', 'BK0060', TO_DATE('2025-09-19 19:05:25', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00060', 'CUS33', 'BK0060', 'PAY00060', 'PAYMENT', 9000000, TO_DATE('2025-09-19 19:05:25', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00061', 'BK0061', TO_DATE('2025-11-25 15:42:09', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00061', 'CUS30', 'BK0061', 'PAY00061', 'PAYMENT', 3000000, TO_DATE('2025-11-25 15:42:09', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00062', 'BK0062', TO_DATE('2026-04-23 02:47:15', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00062', 'CUS23', 'BK0062', 'PAY00062', 'PAYMENT', 6000000, TO_DATE('2026-04-23 02:47:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00063', 'BK0063', TO_DATE('2025-10-02 15:44:00', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00063', 'CUS24', 'BK0063', 'PAY00063', 'PAYMENT', 9000000, TO_DATE('2025-10-02 15:44:00', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00064', 'BK0064', TO_DATE('2026-06-15 06:03:45', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00064', 'CUS16', 'BK0064', 'PAY00064', 'PAYMENT', 6000000, TO_DATE('2026-06-15 06:03:45', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00065', 'BK0066', TO_DATE('2025-09-03 03:03:54', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00065', 'CUS15', 'BK0066', 'PAY00065', 'PAYMENT', 3000000, TO_DATE('2025-09-03 03:03:54', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00066', 'BK0067', TO_DATE('2025-06-20 11:29:41', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00066', 'CUS12', 'BK0067', 'PAY00066', 'PAYMENT', 3000000, TO_DATE('2025-06-20 11:29:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00067', 'BK0068', TO_DATE('2025-08-17 16:46:14', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00067', 'CUS22', 'BK0068', 'PAY00067', 'PAYMENT', 9000000, TO_DATE('2025-08-17 16:46:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00068', 'BK0069', TO_DATE('2025-06-18 02:03:52', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00068', 'CUS06', 'BK0069', 'PAY00068', 'PAYMENT', 3000000, TO_DATE('2025-06-18 02:03:52', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00069', 'BK0070', TO_DATE('2025-08-18 20:13:58', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00069', 'CUS33', 'BK0070', 'PAY00069', 'PAYMENT', 3000000, TO_DATE('2025-08-18 20:13:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00070', 'BK0071', TO_DATE('2025-07-25 21:04:43', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00070', 'CUS01', 'BK0071', 'PAY00070', 'PAYMENT', 9000000, TO_DATE('2025-07-25 21:04:43', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00071', 'BK0072', TO_DATE('2025-07-29 03:55:36', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00071', 'CUS19', 'BK0072', 'PAY00071', 'PAYMENT', 9000000, TO_DATE('2025-07-29 03:55:36', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00072', 'BK0073', TO_DATE('2026-05-13 07:14:11', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00072', 'CUS11', 'BK0073', 'PAY00072', 'PAYMENT', 9000000, TO_DATE('2026-05-13 07:14:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00073', 'BK0074', TO_DATE('2025-10-25 09:20:02', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00073', 'CUS16', 'BK0074', 'PAY00073', 'PAYMENT', 6000000, TO_DATE('2025-10-25 09:20:02', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00074', 'BK0075', TO_DATE('2025-08-10 04:00:57', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00074', 'CUS11', 'BK0075', 'PAY00074', 'PAYMENT', 3000000, TO_DATE('2025-08-10 04:00:57', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00075', 'BK0076', TO_DATE('2026-06-26 21:46:35', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00075', 'CUS33', 'BK0076', 'PAY00075', 'PAYMENT', 3000000, TO_DATE('2026-06-26 21:46:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00076', 'BK0077', TO_DATE('2026-04-21 07:33:05', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00076', 'CUS14', 'BK0077', 'PAY00076', 'PAYMENT', 9000000, TO_DATE('2026-04-21 07:33:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00077', 'BK0078', TO_DATE('2025-08-23 13:57:45', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00077', 'CUS10', 'BK0078', 'PAY00077', 'PAYMENT', 6000000, TO_DATE('2025-08-23 13:57:45', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00078', 'BK0079', TO_DATE('2025-11-29 15:36:47', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00078', 'CUS34', 'BK0079', 'PAY00078', 'PAYMENT', 6000000, TO_DATE('2025-11-29 15:36:47', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00079', 'BK0080', TO_DATE('2026-04-25 14:34:27', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00079', 'CUS18', 'BK0080', 'PAY00079', 'PAYMENT', 9000000, TO_DATE('2026-04-25 14:34:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00080', 'BK0081', TO_DATE('2026-06-01 14:48:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00080', 'CUS28', 'BK0081', 'PAY00080', 'PAYMENT', 6000000, TO_DATE('2026-06-01 14:48:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00081', 'BK0082', TO_DATE('2025-06-19 19:11:23', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00081', 'CUS27', 'BK0082', 'PAY00081', 'PAYMENT', 9000000, TO_DATE('2025-06-19 19:11:23', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00082', 'BK0083', TO_DATE('2025-09-19 17:04:09', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00082', 'CUS09', 'BK0083', 'PAY00082', 'PAYMENT', 3000000, TO_DATE('2025-09-19 17:04:09', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00083', 'BK0084', TO_DATE('2025-12-16 11:08:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00083', 'CUS31', 'BK0084', 'PAY00083', 'PAYMENT', 6000000, TO_DATE('2025-12-16 11:08:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00084', 'BK0085', TO_DATE('2026-05-12 14:13:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00084', 'CUS10', 'BK0085', 'PAY00084', 'PAYMENT', 3000000, TO_DATE('2026-05-12 14:13:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00085', 'BK0086', TO_DATE('2025-09-28 02:22:21', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00085', 'CUS14', 'BK0086', 'PAY00085', 'PAYMENT', 9000000, TO_DATE('2025-09-28 02:22:21', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00086', 'BK0087', TO_DATE('2025-09-17 03:33:38', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00086', 'CUS16', 'BK0087', 'PAY00086', 'PAYMENT', 9000000, TO_DATE('2025-09-17 03:33:38', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00087', 'BK0088', TO_DATE('2025-10-06 07:36:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00087', 'CUS09', 'BK0088', 'PAY00087', 'PAYMENT', 3000000, TO_DATE('2025-10-06 07:36:17', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00088', 'BK0089', TO_DATE('2025-06-30 18:50:20', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00088', 'CUS21', 'BK0089', 'PAY00088', 'PAYMENT', 9000000, TO_DATE('2025-06-30 18:50:20', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00089', 'BK0090', TO_DATE('2025-09-16 18:16:49', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00089', 'CUS35', 'BK0090', 'PAY00089', 'PAYMENT', 3000000, TO_DATE('2025-09-16 18:16:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00090', 'BK0091', TO_DATE('2025-05-28 21:41:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00090', 'CUS03', 'BK0091', 'PAY00090', 'PAYMENT', 3000000, TO_DATE('2025-05-28 21:41:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00091', 'BK0092', TO_DATE('2025-08-26 21:53:20', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00091', 'CUS07', 'BK0092', 'PAY00091', 'PAYMENT', 3000000, TO_DATE('2025-08-26 21:53:20', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00092', 'BK0093', TO_DATE('2025-08-16 02:26:32', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00092', 'CUS33', 'BK0093', 'PAY00092', 'PAYMENT', 6000000, TO_DATE('2025-08-16 02:26:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00093', 'BK0094', TO_DATE('2026-04-17 02:39:02', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00093', 'CUS28', 'BK0094', 'PAY00093', 'PAYMENT', 6000000, TO_DATE('2026-04-17 02:39:02', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00094', 'BK0095', TO_DATE('2025-10-01 09:42:00', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00094', 'CUS22', 'BK0095', 'PAY00094', 'PAYMENT', 3000000, TO_DATE('2025-10-01 09:42:00', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00095', 'BK0096', TO_DATE('2026-02-24 11:33:24', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00095', 'CUS27', 'BK0096', 'PAY00095', 'PAYMENT', 9000000, TO_DATE('2026-02-24 11:33:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00096', 'BK0097', TO_DATE('2025-08-13 03:06:24', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00096', 'CUS31', 'BK0097', 'PAY00096', 'PAYMENT', 6000000, TO_DATE('2025-08-13 03:06:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00097', 'BK0098', TO_DATE('2025-12-18 20:00:28', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00097', 'CUS34', 'BK0098', 'PAY00097', 'PAYMENT', 6000000, TO_DATE('2025-12-18 20:00:28', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00098', 'BK0099', TO_DATE('2025-08-04 01:06:23', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00098', 'CUS17', 'BK0099', 'PAY00098', 'PAYMENT', 9000000, TO_DATE('2025-08-04 01:06:23', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00099', 'BK0100', TO_DATE('2025-10-18 19:59:10', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00099', 'CUS13', 'BK0100', 'PAY00099', 'PAYMENT', 6000000, TO_DATE('2025-10-18 19:59:10', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00100', 'BK0102', TO_DATE('2026-04-06 01:03:47', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00100', 'CUS29', 'BK0102', 'PAY00100', 'PAYMENT', 6000000, TO_DATE('2026-04-06 01:03:47', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00101', 'BK0103', TO_DATE('2026-01-01 16:23:16', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00101', 'CUS26', 'BK0103', 'PAY00101', 'PAYMENT', 9000000, TO_DATE('2026-01-01 16:23:16', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00102', 'BK0104', TO_DATE('2025-12-10 21:31:03', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00102', 'CUS01', 'BK0104', 'PAY00102', 'PAYMENT', 9000000, TO_DATE('2025-12-10 21:31:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00103', 'BK0105', TO_DATE('2025-09-13 01:09:58', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00103', 'CUS35', 'BK0105', 'PAY00103', 'PAYMENT', 6000000, TO_DATE('2025-09-13 01:09:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00104', 'BK0106', TO_DATE('2026-05-17 08:27:15', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00104', 'CUS28', 'BK0106', 'PAY00104', 'PAYMENT', 3000000, TO_DATE('2026-05-17 08:27:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00105', 'BK0107', TO_DATE('2025-12-14 06:04:58', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00105', 'CUS14', 'BK0107', 'PAY00105', 'PAYMENT', 6000000, TO_DATE('2025-12-14 06:04:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00106', 'BK0109', TO_DATE('2026-02-05 05:07:59', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00106', 'CUS15', 'BK0109', 'PAY00106', 'PAYMENT', 3000000, TO_DATE('2026-02-05 05:07:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00107', 'BK0110', TO_DATE('2025-05-14 04:30:55', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00107', 'CUS06', 'BK0110', 'PAY00107', 'PAYMENT', 9000000, TO_DATE('2025-05-14 04:30:55', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00108', 'BK0111', TO_DATE('2026-02-26 17:57:59', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00108', 'CUS17', 'BK0111', 'PAY00108', 'PAYMENT', 6000000, TO_DATE('2026-02-26 17:57:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00109', 'BK0112', TO_DATE('2025-08-21 23:48:05', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00109', 'CUS31', 'BK0112', 'PAY00109', 'PAYMENT', 9000000, TO_DATE('2025-08-21 23:48:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00110', 'BK0113', TO_DATE('2026-04-11 10:07:46', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00110', 'CUS03', 'BK0113', 'PAY00110', 'PAYMENT', 9000000, TO_DATE('2026-04-11 10:07:46', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00111', 'BK0114', TO_DATE('2025-12-23 04:53:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00111', 'CUS16', 'BK0114', 'PAY00111', 'PAYMENT', 6000000, TO_DATE('2025-12-23 04:53:25', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00112', 'BK0115', TO_DATE('2026-05-11 02:07:05', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00112', 'CUS14', 'BK0115', 'PAY00112', 'PAYMENT', 6000000, TO_DATE('2026-05-11 02:07:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00113', 'BK0116', TO_DATE('2025-10-21 12:22:32', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00113', 'CUS13', 'BK0116', 'PAY00113', 'PAYMENT', 6000000, TO_DATE('2025-10-21 12:22:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00114', 'BK0117', TO_DATE('2026-01-02 14:40:08', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00114', 'CUS31', 'BK0117', 'PAY00114', 'PAYMENT', 9000000, TO_DATE('2026-01-02 14:40:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00115', 'BK0118', TO_DATE('2026-04-20 15:05:01', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00115', 'CUS21', 'BK0118', 'PAY00115', 'PAYMENT', 9000000, TO_DATE('2026-04-20 15:05:01', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00116', 'BK0119', TO_DATE('2026-05-18 17:11:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00116', 'CUS21', 'BK0119', 'PAY00116', 'PAYMENT', 6000000, TO_DATE('2026-05-18 17:11:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00117', 'BK0120', TO_DATE('2025-07-05 22:00:09', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00117', 'CUS27', 'BK0120', 'PAY00117', 'PAYMENT', 6000000, TO_DATE('2025-07-05 22:00:09', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00118', 'BK0121', TO_DATE('2026-06-11 03:29:57', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00118', 'CUS11', 'BK0121', 'PAY00118', 'PAYMENT', 3000000, TO_DATE('2026-06-11 03:29:57', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00119', 'BK0122', TO_DATE('2025-12-13 10:37:02', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00119', 'CUS34', 'BK0122', 'PAY00119', 'PAYMENT', 6000000, TO_DATE('2025-12-13 10:37:02', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00120', 'BK0123', TO_DATE('2026-05-31 12:54:12', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00120', 'CUS33', 'BK0123', 'PAY00120', 'PAYMENT', 6000000, TO_DATE('2026-05-31 12:54:12', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00121', 'BK0124', TO_DATE('2025-10-14 09:32:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00121', 'CUS35', 'BK0124', 'PAY00121', 'PAYMENT', 9000000, TO_DATE('2025-10-14 09:32:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00122', 'BK0125', TO_DATE('2025-06-03 17:28:36', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00122', 'CUS11', 'BK0125', 'PAY00122', 'PAYMENT', 3000000, TO_DATE('2025-06-03 17:28:36', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00123', 'BK0126', TO_DATE('2025-08-03 03:13:59', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00123', 'CUS08', 'BK0126', 'PAY00123', 'PAYMENT', 9000000, TO_DATE('2025-08-03 03:13:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00124', 'BK0127', TO_DATE('2026-04-14 02:20:33', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00124', 'CUS05', 'BK0127', 'PAY00124', 'PAYMENT', 9000000, TO_DATE('2026-04-14 02:20:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00125', 'BK0128', TO_DATE('2025-10-16 12:18:14', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00125', 'CUS29', 'BK0128', 'PAY00125', 'PAYMENT', 9000000, TO_DATE('2025-10-16 12:18:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00126', 'BK0129', TO_DATE('2025-12-17 03:02:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00126', 'CUS24', 'BK0129', 'PAY00126', 'PAYMENT', 3000000, TO_DATE('2025-12-17 03:02:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00127', 'BK0130', TO_DATE('2025-05-24 03:11:32', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00127', 'CUS25', 'BK0130', 'PAY00127', 'PAYMENT', 3000000, TO_DATE('2025-05-24 03:11:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00128', 'BK0131', TO_DATE('2025-06-30 22:58:41', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00128', 'CUS16', 'BK0131', 'PAY00128', 'PAYMENT', 3000000, TO_DATE('2025-06-30 22:58:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00129', 'BK0132', TO_DATE('2025-11-28 19:36:02', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00129', 'CUS15', 'BK0132', 'PAY00129', 'PAYMENT', 3000000, TO_DATE('2025-11-28 19:36:02', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00130', 'BK0133', TO_DATE('2026-04-29 21:33:49', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00130', 'CUS07', 'BK0133', 'PAY00130', 'PAYMENT', 3000000, TO_DATE('2026-04-29 21:33:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00131', 'BK0134', TO_DATE('2026-03-31 00:16:25', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00131', 'CUS09', 'BK0134', 'PAY00131', 'PAYMENT', 3000000, TO_DATE('2026-03-31 00:16:25', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00132', 'BK0135', TO_DATE('2025-12-03 11:02:56', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00132', 'CUS15', 'BK0135', 'PAY00132', 'PAYMENT', 6000000, TO_DATE('2025-12-03 11:02:56', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00133', 'BK0136', TO_DATE('2026-01-19 17:45:23', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00133', 'CUS10', 'BK0136', 'PAY00133', 'PAYMENT', 3000000, TO_DATE('2026-01-19 17:45:23', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00134', 'BK0137', TO_DATE('2025-09-27 19:45:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00134', 'CUS07', 'BK0137', 'PAY00134', 'PAYMENT', 9000000, TO_DATE('2025-09-27 19:45:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00135', 'BK0138', TO_DATE('2026-06-19 01:07:10', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00135', 'CUS18', 'BK0138', 'PAY00135', 'PAYMENT', 9000000, TO_DATE('2026-06-19 01:07:10', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00136', 'BK0139', TO_DATE('2025-11-16 12:55:16', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00136', 'CUS17', 'BK0139', 'PAY00136', 'PAYMENT', 6000000, TO_DATE('2025-11-16 12:55:16', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00137', 'BK0140', TO_DATE('2025-09-02 13:54:08', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00137', 'CUS24', 'BK0140', 'PAY00137', 'PAYMENT', 6000000, TO_DATE('2025-09-02 13:54:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00138', 'BK0141', TO_DATE('2025-07-06 00:01:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00138', 'CUS21', 'BK0141', 'PAY00138', 'PAYMENT', 3000000, TO_DATE('2025-07-06 00:01:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00139', 'BK0142', TO_DATE('2025-06-19 22:05:45', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00139', 'CUS25', 'BK0142', 'PAY00139', 'PAYMENT', 3000000, TO_DATE('2025-06-19 22:05:45', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00140', 'BK0143', TO_DATE('2025-12-09 17:52:53', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00140', 'CUS20', 'BK0143', 'PAY00140', 'PAYMENT', 9000000, TO_DATE('2025-12-09 17:52:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00141', 'BK0144', TO_DATE('2026-05-01 10:35:37', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00141', 'CUS07', 'BK0144', 'PAY00141', 'PAYMENT', 3000000, TO_DATE('2026-05-01 10:35:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00142', 'BK0145', TO_DATE('2026-05-04 19:15:37', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00142', 'CUS02', 'BK0145', 'PAY00142', 'PAYMENT', 9000000, TO_DATE('2026-05-04 19:15:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00143', 'BK0146', TO_DATE('2025-12-28 04:25:40', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00143', 'CUS09', 'BK0146', 'PAY00143', 'PAYMENT', 3000000, TO_DATE('2025-12-28 04:25:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00144', 'BK0147', TO_DATE('2025-12-29 21:42:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00144', 'CUS09', 'BK0147', 'PAY00144', 'PAYMENT', 3000000, TO_DATE('2025-12-29 21:42:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00145', 'BK0148', TO_DATE('2025-10-27 19:31:11', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00145', 'CUS06', 'BK0148', 'PAY00145', 'PAYMENT', 9000000, TO_DATE('2025-10-27 19:31:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00146', 'BK0149', TO_DATE('2025-11-28 10:36:15', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00146', 'CUS35', 'BK0149', 'PAY00146', 'PAYMENT', 9000000, TO_DATE('2025-11-28 10:36:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00147', 'BK0150', TO_DATE('2026-06-27 13:21:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00147', 'CUS17', 'BK0150', 'PAY00147', 'PAYMENT', 3000000, TO_DATE('2026-06-27 13:21:17', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00148', 'BK0151', TO_DATE('2026-01-10 01:26:40', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00148', 'CUS32', 'BK0151', 'PAY00148', 'PAYMENT', 9000000, TO_DATE('2026-01-10 01:26:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00149', 'BK0152', TO_DATE('2026-05-29 06:53:23', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00149', 'CUS28', 'BK0152', 'PAY00149', 'PAYMENT', 3000000, TO_DATE('2026-05-29 06:53:23', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00150', 'BK0153', TO_DATE('2026-05-30 05:33:29', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00150', 'CUS06', 'BK0153', 'PAY00150', 'PAYMENT', 3000000, TO_DATE('2026-05-30 05:33:29', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00151', 'BK0154', TO_DATE('2025-12-03 21:14:30', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00151', 'CUS32', 'BK0154', 'PAY00151', 'PAYMENT', 3000000, TO_DATE('2025-12-03 21:14:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00152', 'BK0155', TO_DATE('2026-02-11 21:14:41', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00152', 'CUS29', 'BK0155', 'PAY00152', 'PAYMENT', 3000000, TO_DATE('2026-02-11 21:14:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00153', 'BK0156', TO_DATE('2026-06-22 01:48:24', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00153', 'CUS34', 'BK0156', 'PAY00153', 'PAYMENT', 3000000, TO_DATE('2026-06-22 01:48:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00154', 'BK0157', TO_DATE('2025-05-29 05:59:00', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00154', 'CUS29', 'BK0157', 'PAY00154', 'PAYMENT', 9000000, TO_DATE('2025-05-29 05:59:00', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00155', 'BK0158', TO_DATE('2025-09-21 23:36:03', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00155', 'CUS03', 'BK0158', 'PAY00155', 'PAYMENT', 9000000, TO_DATE('2025-09-21 23:36:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00156', 'BK0159', TO_DATE('2025-05-26 16:46:02', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00156', 'CUS01', 'BK0159', 'PAY00156', 'PAYMENT', 9000000, TO_DATE('2025-05-26 16:46:02', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00157', 'BK0160', TO_DATE('2025-09-03 02:25:34', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00157', 'CUS19', 'BK0160', 'PAY00157', 'PAYMENT', 9000000, TO_DATE('2025-09-03 02:25:34', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00158', 'BK0161', TO_DATE('2026-04-15 20:26:06', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00158', 'CUS25', 'BK0161', 'PAY00158', 'PAYMENT', 9000000, TO_DATE('2026-04-15 20:26:06', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00159', 'BK0162', TO_DATE('2026-04-05 03:28:28', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00159', 'CUS11', 'BK0162', 'PAY00159', 'PAYMENT', 3000000, TO_DATE('2026-04-05 03:28:28', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00160', 'BK0163', TO_DATE('2026-01-20 05:15:53', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00160', 'CUS30', 'BK0163', 'PAY00160', 'PAYMENT', 9000000, TO_DATE('2026-01-20 05:15:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00161', 'BK0164', TO_DATE('2026-06-04 13:43:05', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00161', 'CUS22', 'BK0164', 'PAY00161', 'PAYMENT', 6000000, TO_DATE('2026-06-04 13:43:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00162', 'BK0165', TO_DATE('2025-05-29 21:08:45', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00162', 'CUS15', 'BK0165', 'PAY00162', 'PAYMENT', 3000000, TO_DATE('2025-05-29 21:08:45', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00163', 'BK0166', TO_DATE('2026-06-09 22:19:49', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00163', 'CUS05', 'BK0166', 'PAY00163', 'PAYMENT', 3000000, TO_DATE('2026-06-09 22:19:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00164', 'BK0167', TO_DATE('2026-05-20 21:14:19', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00164', 'CUS14', 'BK0167', 'PAY00164', 'PAYMENT', 6000000, TO_DATE('2026-05-20 21:14:19', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00165', 'BK0168', TO_DATE('2026-05-02 11:38:10', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00165', 'CUS20', 'BK0168', 'PAY00165', 'PAYMENT', 3000000, TO_DATE('2026-05-02 11:38:10', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00166', 'BK0169', TO_DATE('2025-10-24 04:47:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00166', 'CUS10', 'BK0169', 'PAY00166', 'PAYMENT', 6000000, TO_DATE('2025-10-24 04:47:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00167', 'BK0170', TO_DATE('2025-11-08 06:05:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00167', 'CUS21', 'BK0170', 'PAY00167', 'PAYMENT', 3000000, TO_DATE('2025-11-08 06:05:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00168', 'BK0171', TO_DATE('2025-06-22 07:10:00', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00168', 'CUS27', 'BK0171', 'PAY00168', 'PAYMENT', 3000000, TO_DATE('2025-06-22 07:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00169', 'BK0172', TO_DATE('2025-06-08 21:22:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00169', 'CUS10', 'BK0172', 'PAY00169', 'PAYMENT', 3000000, TO_DATE('2025-06-08 21:22:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00170', 'BK0173', TO_DATE('2025-06-05 00:13:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00170', 'CUS10', 'BK0173', 'PAY00170', 'PAYMENT', 9000000, TO_DATE('2025-06-05 00:13:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00171', 'BK0174', TO_DATE('2026-05-29 09:23:02', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00171', 'CUS07', 'BK0174', 'PAY00171', 'PAYMENT', 3000000, TO_DATE('2026-05-29 09:23:02', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00172', 'BK0175', TO_DATE('2025-09-07 16:08:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00172', 'CUS02', 'BK0175', 'PAY00172', 'PAYMENT', 3000000, TO_DATE('2025-09-07 16:08:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00173', 'BK0176', TO_DATE('2026-04-19 19:18:40', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00173', 'CUS13', 'BK0176', 'PAY00173', 'PAYMENT', 9000000, TO_DATE('2026-04-19 19:18:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00174', 'BK0177', TO_DATE('2026-01-01 00:07:46', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00174', 'CUS35', 'BK0177', 'PAY00174', 'PAYMENT', 6000000, TO_DATE('2026-01-01 00:07:46', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00175', 'BK0178', TO_DATE('2026-01-14 22:59:18', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00175', 'CUS09', 'BK0178', 'PAY00175', 'PAYMENT', 3000000, TO_DATE('2026-01-14 22:59:18', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00176', 'BK0179', TO_DATE('2025-06-27 10:24:37', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00176', 'CUS01', 'BK0179', 'PAY00176', 'PAYMENT', 6000000, TO_DATE('2025-06-27 10:24:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00177', 'BK0180', TO_DATE('2025-11-02 23:17:22', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00177', 'CUS33', 'BK0180', 'PAY00177', 'PAYMENT', 9000000, TO_DATE('2025-11-02 23:17:22', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00178', 'BK0181', TO_DATE('2025-05-25 20:31:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00178', 'CUS22', 'BK0181', 'PAY00178', 'PAYMENT', 3000000, TO_DATE('2025-05-25 20:31:06', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00179', 'BK0182', TO_DATE('2025-10-21 13:23:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00179', 'CUS03', 'BK0182', 'PAY00179', 'PAYMENT', 3000000, TO_DATE('2025-10-21 13:23:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00180', 'BK0183', TO_DATE('2025-11-20 20:29:07', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00180', 'CUS06', 'BK0183', 'PAY00180', 'PAYMENT', 9000000, TO_DATE('2025-11-20 20:29:07', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00181', 'BK0184', TO_DATE('2025-09-01 01:43:53', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00181', 'CUS10', 'BK0184', 'PAY00181', 'PAYMENT', 9000000, TO_DATE('2025-09-01 01:43:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00182', 'BK0185', TO_DATE('2026-06-10 10:38:41', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00182', 'CUS10', 'BK0185', 'PAY00182', 'PAYMENT', 3000000, TO_DATE('2026-06-10 10:38:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00183', 'BK0186', TO_DATE('2025-08-20 05:45:51', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00183', 'CUS02', 'BK0186', 'PAY00183', 'PAYMENT', 6000000, TO_DATE('2025-08-20 05:45:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00184', 'BK0187', TO_DATE('2025-12-21 11:14:41', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00184', 'CUS19', 'BK0187', 'PAY00184', 'PAYMENT', 6000000, TO_DATE('2025-12-21 11:14:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00185', 'BK0188', TO_DATE('2026-01-08 07:45:26', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00185', 'CUS14', 'BK0188', 'PAY00185', 'PAYMENT', 3000000, TO_DATE('2026-01-08 07:45:26', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00186', 'BK0189', TO_DATE('2026-06-05 00:13:47', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00186', 'CUS17', 'BK0189', 'PAY00186', 'PAYMENT', 9000000, TO_DATE('2026-06-05 00:13:47', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00187', 'BK0190', TO_DATE('2025-06-22 05:45:35', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00187', 'CUS34', 'BK0190', 'PAY00187', 'PAYMENT', 6000000, TO_DATE('2025-06-22 05:45:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00188', 'BK0191', TO_DATE('2025-09-14 12:31:52', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00188', 'CUS32', 'BK0191', 'PAY00188', 'PAYMENT', 9000000, TO_DATE('2025-09-14 12:31:52', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00189', 'BK0192', TO_DATE('2025-10-14 01:56:31', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00189', 'CUS19', 'BK0192', 'PAY00189', 'PAYMENT', 6000000, TO_DATE('2025-10-14 01:56:31', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00190', 'BK0193', TO_DATE('2026-01-26 00:25:12', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00190', 'CUS12', 'BK0193', 'PAY00190', 'PAYMENT', 6000000, TO_DATE('2026-01-26 00:25:12', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00191', 'BK0194', TO_DATE('2025-08-26 20:51:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00191', 'CUS26', 'BK0194', 'PAY00191', 'PAYMENT', 3000000, TO_DATE('2025-08-26 20:51:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00192', 'BK0195', TO_DATE('2025-12-08 20:04:44', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00192', 'CUS10', 'BK0195', 'PAY00192', 'PAYMENT', 9000000, TO_DATE('2025-12-08 20:04:44', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00193', 'BK0197', TO_DATE('2025-10-01 01:55:19', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00193', 'CUS26', 'BK0197', 'PAY00193', 'PAYMENT', 9000000, TO_DATE('2025-10-01 01:55:19', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00194', 'BK0198', TO_DATE('2026-07-08 14:45:48', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00194', 'CUS22', 'BK0198', 'PAY00194', 'PAYMENT', 9000000, TO_DATE('2026-07-08 14:45:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00195', 'BK0199', TO_DATE('2025-12-18 20:17:00', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00195', 'CUS10', 'BK0199', 'PAY00195', 'PAYMENT', 6000000, TO_DATE('2025-12-18 20:17:00', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00196', 'BK0200', TO_DATE('2025-07-26 01:42:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00196', 'CUS07', 'BK0200', 'PAY00196', 'PAYMENT', 6000000, TO_DATE('2025-07-26 01:42:25', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00197', 'BK0201', TO_DATE('2025-07-05 08:05:31', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00197', 'CUS05', 'BK0201', 'PAY00197', 'PAYMENT', 6000000, TO_DATE('2025-07-05 08:05:31', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00198', 'BK0202', TO_DATE('2025-08-01 20:14:39', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00198', 'CUS17', 'BK0202', 'PAY00198', 'PAYMENT', 3000000, TO_DATE('2025-08-01 20:14:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00199', 'BK0203', TO_DATE('2025-08-08 00:22:09', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00199', 'CUS01', 'BK0203', 'PAY00199', 'PAYMENT', 9000000, TO_DATE('2025-08-08 00:22:09', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00200', 'BK0204', TO_DATE('2026-01-21 01:25:12', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00200', 'CUS10', 'BK0204', 'PAY00200', 'PAYMENT', 9000000, TO_DATE('2026-01-21 01:25:12', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00201', 'BK0205', TO_DATE('2026-07-09 23:56:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00201', 'CUS22', 'BK0205', 'PAY00201', 'PAYMENT', 3000000, TO_DATE('2026-07-09 23:56:06', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00202', 'BK0206', TO_DATE('2025-06-19 03:19:05', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00202', 'CUS13', 'BK0206', 'PAY00202', 'PAYMENT', 3000000, TO_DATE('2025-06-19 03:19:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00203', 'BK0207', TO_DATE('2025-12-05 23:59:54', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00203', 'CUS10', 'BK0207', 'PAY00203', 'PAYMENT', 3000000, TO_DATE('2025-12-05 23:59:54', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00204', 'BK0208', TO_DATE('2025-06-25 09:36:10', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00204', 'CUS21', 'BK0208', 'PAY00204', 'PAYMENT', 6000000, TO_DATE('2025-06-25 09:36:10', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00205', 'BK0209', TO_DATE('2026-01-24 02:03:10', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00205', 'CUS29', 'BK0209', 'PAY00205', 'PAYMENT', 3000000, TO_DATE('2026-01-24 02:03:10', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00206', 'BK0210', TO_DATE('2025-05-14 12:37:44', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00206', 'CUS31', 'BK0210', 'PAY00206', 'PAYMENT', 9000000, TO_DATE('2025-05-14 12:37:44', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00207', 'BK0211', TO_DATE('2025-11-13 21:10:33', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00207', 'CUS29', 'BK0211', 'PAY00207', 'PAYMENT', 9000000, TO_DATE('2025-11-13 21:10:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00208', 'BK0212', TO_DATE('2026-06-23 13:43:24', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00208', 'CUS06', 'BK0212', 'PAY00208', 'PAYMENT', 3000000, TO_DATE('2026-06-23 13:43:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00209', 'BK0213', TO_DATE('2026-07-08 01:05:32', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00209', 'CUS19', 'BK0213', 'PAY00209', 'PAYMENT', 9000000, TO_DATE('2026-07-08 01:05:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00210', 'BK0214', TO_DATE('2025-06-08 02:46:31', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00210', 'CUS13', 'BK0214', 'PAY00210', 'PAYMENT', 3000000, TO_DATE('2025-06-08 02:46:31', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00211', 'BK0215', TO_DATE('2026-05-07 01:11:12', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00211', 'CUS29', 'BK0215', 'PAY00211', 'PAYMENT', 3000000, TO_DATE('2026-05-07 01:11:12', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00212', 'BK0216', TO_DATE('2026-06-03 18:57:40', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00212', 'CUS32', 'BK0216', 'PAY00212', 'PAYMENT', 6000000, TO_DATE('2026-06-03 18:57:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00213', 'BK0217', TO_DATE('2026-01-14 11:47:23', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00213', 'CUS10', 'BK0217', 'PAY00213', 'PAYMENT', 3000000, TO_DATE('2026-01-14 11:47:23', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00214', 'BK0218', TO_DATE('2025-05-27 14:59:13', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00214', 'CUS29', 'BK0218', 'PAY00214', 'PAYMENT', 6000000, TO_DATE('2025-05-27 14:59:13', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00215', 'BK0219', TO_DATE('2026-07-01 21:26:29', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00215', 'CUS02', 'BK0219', 'PAY00215', 'PAYMENT', 6000000, TO_DATE('2026-07-01 21:26:29', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00216', 'BK0220', TO_DATE('2026-03-24 15:16:34', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00216', 'CUS32', 'BK0220', 'PAY00216', 'PAYMENT', 9000000, TO_DATE('2026-03-24 15:16:34', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00217', 'BK0221', TO_DATE('2025-09-14 15:04:50', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00217', 'CUS24', 'BK0221', 'PAY00217', 'PAYMENT', 9000000, TO_DATE('2025-09-14 15:04:50', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00218', 'BK0222', TO_DATE('2025-07-22 20:31:52', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00218', 'CUS05', 'BK0222', 'PAY00218', 'PAYMENT', 3000000, TO_DATE('2025-07-22 20:31:52', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00219', 'BK0223', TO_DATE('2025-08-25 21:10:15', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00219', 'CUS06', 'BK0223', 'PAY00219', 'PAYMENT', 3000000, TO_DATE('2025-08-25 21:10:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00220', 'BK0224', TO_DATE('2025-10-13 18:28:50', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00220', 'CUS17', 'BK0224', 'PAY00220', 'PAYMENT', 9000000, TO_DATE('2025-10-13 18:28:50', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00221', 'BK0225', TO_DATE('2026-01-20 17:31:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00221', 'CUS10', 'BK0225', 'PAY00221', 'PAYMENT', 6000000, TO_DATE('2026-01-20 17:31:25', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00222', 'BK0226', TO_DATE('2025-06-19 02:47:08', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00222', 'CUS32', 'BK0226', 'PAY00222', 'PAYMENT', 6000000, TO_DATE('2025-06-19 02:47:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00223', 'BK0227', TO_DATE('2026-03-13 10:36:19', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00223', 'CUS03', 'BK0227', 'PAY00223', 'PAYMENT', 9000000, TO_DATE('2026-03-13 10:36:19', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00224', 'BK0228', TO_DATE('2025-06-01 17:09:13', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00224', 'CUS26', 'BK0228', 'PAY00224', 'PAYMENT', 9000000, TO_DATE('2025-06-01 17:09:13', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00225', 'BK0229', TO_DATE('2026-03-19 14:25:53', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00225', 'CUS04', 'BK0229', 'PAY00225', 'PAYMENT', 9000000, TO_DATE('2026-03-19 14:25:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00226', 'BK0230', TO_DATE('2025-12-29 16:37:33', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00226', 'CUS23', 'BK0230', 'PAY00226', 'PAYMENT', 9000000, TO_DATE('2025-12-29 16:37:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00227', 'BK0231', TO_DATE('2026-06-04 00:28:18', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00227', 'CUS34', 'BK0231', 'PAY00227', 'PAYMENT', 3000000, TO_DATE('2026-06-04 00:28:18', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00228', 'BK0232', TO_DATE('2025-10-24 13:10:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00228', 'CUS29', 'BK0232', 'PAY00228', 'PAYMENT', 3000000, TO_DATE('2025-10-24 13:10:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00229', 'BK0233', TO_DATE('2025-09-25 00:58:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00229', 'CUS26', 'BK0233', 'PAY00229', 'PAYMENT', 3000000, TO_DATE('2025-09-25 00:58:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00230', 'BK0234', TO_DATE('2026-04-25 16:23:07', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00230', 'CUS35', 'BK0234', 'PAY00230', 'PAYMENT', 6000000, TO_DATE('2026-04-25 16:23:07', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00231', 'BK0235', TO_DATE('2026-04-20 10:51:59', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00231', 'CUS03', 'BK0235', 'PAY00231', 'PAYMENT', 9000000, TO_DATE('2026-04-20 10:51:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00232', 'BK0236', TO_DATE('2026-05-14 12:17:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00232', 'CUS34', 'BK0236', 'PAY00232', 'PAYMENT', 6000000, TO_DATE('2026-05-14 12:17:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00233', 'BK0237', TO_DATE('2025-06-26 09:42:33', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00233', 'CUS32', 'BK0237', 'PAY00233', 'PAYMENT', 9000000, TO_DATE('2025-06-26 09:42:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00234', 'BK0238', TO_DATE('2025-06-27 13:59:48', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00234', 'CUS27', 'BK0238', 'PAY00234', 'PAYMENT', 9000000, TO_DATE('2025-06-27 13:59:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00235', 'BK0239', TO_DATE('2025-11-20 05:42:28', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00235', 'CUS27', 'BK0239', 'PAY00235', 'PAYMENT', 9000000, TO_DATE('2025-11-20 05:42:28', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00236', 'BK0240', TO_DATE('2026-07-07 02:07:49', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00236', 'CUS07', 'BK0240', 'PAY00236', 'PAYMENT', 6000000, TO_DATE('2026-07-07 02:07:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00237', 'BK0241', TO_DATE('2025-11-30 01:33:13', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00237', 'CUS17', 'BK0241', 'PAY00237', 'PAYMENT', 9000000, TO_DATE('2025-11-30 01:33:13', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00238', 'BK0242', TO_DATE('2026-06-28 11:58:18', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00238', 'CUS16', 'BK0242', 'PAY00238', 'PAYMENT', 6000000, TO_DATE('2026-06-28 11:58:18', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00239', 'BK0243', TO_DATE('2025-12-01 03:20:42', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00239', 'CUS11', 'BK0243', 'PAY00239', 'PAYMENT', 9000000, TO_DATE('2025-12-01 03:20:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00240', 'BK0244', TO_DATE('2025-11-04 08:46:40', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00240', 'CUS35', 'BK0244', 'PAY00240', 'PAYMENT', 9000000, TO_DATE('2025-11-04 08:46:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00241', 'BK0245', TO_DATE('2025-06-05 14:37:38', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00241', 'CUS12', 'BK0245', 'PAY00241', 'PAYMENT', 6000000, TO_DATE('2025-06-05 14:37:38', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00242', 'BK0246', TO_DATE('2025-07-22 12:21:49', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00242', 'CUS21', 'BK0246', 'PAY00242', 'PAYMENT', 9000000, TO_DATE('2025-07-22 12:21:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00243', 'BK0247', TO_DATE('2025-08-13 05:01:19', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00243', 'CUS31', 'BK0247', 'PAY00243', 'PAYMENT', 3000000, TO_DATE('2025-08-13 05:01:19', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00244', 'BK0248', TO_DATE('2025-06-04 12:17:40', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00244', 'CUS33', 'BK0248', 'PAY00244', 'PAYMENT', 9000000, TO_DATE('2025-06-04 12:17:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00245', 'BK0249', TO_DATE('2025-06-13 14:46:33', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00245', 'CUS10', 'BK0249', 'PAY00245', 'PAYMENT', 3000000, TO_DATE('2025-06-13 14:46:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00246', 'BK0250', TO_DATE('2026-06-18 01:38:10', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00246', 'CUS12', 'BK0250', 'PAY00246', 'PAYMENT', 6000000, TO_DATE('2026-06-18 01:38:10', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00247', 'BK0251', TO_DATE('2025-09-21 07:05:22', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00247', 'CUS26', 'BK0251', 'PAY00247', 'PAYMENT', 9000000, TO_DATE('2025-09-21 07:05:22', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00248', 'BK0252', TO_DATE('2025-11-17 15:32:53', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00248', 'CUS34', 'BK0252', 'PAY00248', 'PAYMENT', 6000000, TO_DATE('2025-11-17 15:32:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00249', 'BK0253', TO_DATE('2025-10-22 05:13:59', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00249', 'CUS30', 'BK0253', 'PAY00249', 'PAYMENT', 6000000, TO_DATE('2025-10-22 05:13:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00250', 'BK0254', TO_DATE('2025-08-21 05:21:40', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00250', 'CUS02', 'BK0254', 'PAY00250', 'PAYMENT', 6000000, TO_DATE('2025-08-21 05:21:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00251', 'BK0255', TO_DATE('2025-12-07 08:57:18', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00251', 'CUS07', 'BK0255', 'PAY00251', 'PAYMENT', 9000000, TO_DATE('2025-12-07 08:57:18', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00252', 'BK0256', TO_DATE('2025-12-02 00:53:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00252', 'CUS07', 'BK0256', 'PAY00252', 'PAYMENT', 3000000, TO_DATE('2025-12-02 00:53:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00253', 'BK0257', TO_DATE('2025-10-19 20:30:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00253', 'CUS13', 'BK0257', 'PAY00253', 'PAYMENT', 3000000, TO_DATE('2025-10-19 20:30:04', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00254', 'BK0258', TO_DATE('2025-05-25 09:12:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00254', 'CUS10', 'BK0258', 'PAY00254', 'PAYMENT', 3000000, TO_DATE('2025-05-25 09:12:56', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00255', 'BK0259', TO_DATE('2026-01-07 08:13:40', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00255', 'CUS11', 'BK0259', 'PAY00255', 'PAYMENT', 6000000, TO_DATE('2026-01-07 08:13:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00256', 'BK0260', TO_DATE('2025-06-18 15:04:15', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00256', 'CUS05', 'BK0260', 'PAY00256', 'PAYMENT', 3000000, TO_DATE('2025-06-18 15:04:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00257', 'BK0261', TO_DATE('2025-06-19 14:35:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00257', 'CUS14', 'BK0261', 'PAY00257', 'PAYMENT', 6000000, TO_DATE('2025-06-19 14:35:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00258', 'BK0262', TO_DATE('2025-08-26 05:09:37', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00258', 'CUS14', 'BK0262', 'PAY00258', 'PAYMENT', 9000000, TO_DATE('2025-08-26 05:09:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00259', 'BK0263', TO_DATE('2025-06-16 17:31:28', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00259', 'CUS04', 'BK0263', 'PAY00259', 'PAYMENT', 3000000, TO_DATE('2025-06-16 17:31:28', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00260', 'BK0264', TO_DATE('2025-06-23 18:58:58', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00260', 'CUS16', 'BK0264', 'PAY00260', 'PAYMENT', 6000000, TO_DATE('2025-06-23 18:58:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00261', 'BK0265', TO_DATE('2025-08-12 02:39:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00261', 'CUS33', 'BK0265', 'PAY00261', 'PAYMENT', 3000000, TO_DATE('2025-08-12 02:39:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00262', 'BK0266', TO_DATE('2025-06-22 03:03:56', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00262', 'CUS32', 'BK0266', 'PAY00262', 'PAYMENT', 9000000, TO_DATE('2025-06-22 03:03:56', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00263', 'BK0267', TO_DATE('2026-04-18 00:08:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00263', 'CUS12', 'BK0267', 'PAY00263', 'PAYMENT', 3000000, TO_DATE('2026-04-18 00:08:04', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00264', 'BK0268', TO_DATE('2026-05-15 16:51:26', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00264', 'CUS11', 'BK0268', 'PAY00264', 'PAYMENT', 9000000, TO_DATE('2026-05-15 16:51:26', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00265', 'BK0269', TO_DATE('2025-10-04 20:57:11', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00265', 'CUS03', 'BK0269', 'PAY00265', 'PAYMENT', 3000000, TO_DATE('2025-10-04 20:57:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00266', 'BK0270', TO_DATE('2026-02-03 13:36:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00266', 'CUS25', 'BK0270', 'PAY00266', 'PAYMENT', 9000000, TO_DATE('2026-02-03 13:36:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00267', 'BK0271', TO_DATE('2026-05-17 01:47:18', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00267', 'CUS06', 'BK0271', 'PAY00267', 'PAYMENT', 3000000, TO_DATE('2026-05-17 01:47:18', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00268', 'BK0272', TO_DATE('2025-08-04 14:05:39', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00268', 'CUS24', 'BK0272', 'PAY00268', 'PAYMENT', 9000000, TO_DATE('2025-08-04 14:05:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00269', 'BK0273', TO_DATE('2025-10-04 12:36:09', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00269', 'CUS23', 'BK0273', 'PAY00269', 'PAYMENT', 6000000, TO_DATE('2025-10-04 12:36:09', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00270', 'BK0274', TO_DATE('2026-04-19 08:04:14', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00270', 'CUS12', 'BK0274', 'PAY00270', 'PAYMENT', 3000000, TO_DATE('2026-04-19 08:04:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00271', 'BK0275', TO_DATE('2025-09-16 13:31:37', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00271', 'CUS18', 'BK0275', 'PAY00271', 'PAYMENT', 6000000, TO_DATE('2025-09-16 13:31:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00272', 'BK0276', TO_DATE('2025-05-27 02:33:32', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00272', 'CUS22', 'BK0276', 'PAY00272', 'PAYMENT', 6000000, TO_DATE('2025-05-27 02:33:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00273', 'BK0277', TO_DATE('2026-05-11 06:42:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00273', 'CUS13', 'BK0277', 'PAY00273', 'PAYMENT', 3000000, TO_DATE('2026-05-11 06:42:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00274', 'BK0278', TO_DATE('2026-04-13 10:45:45', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00274', 'CUS28', 'BK0278', 'PAY00274', 'PAYMENT', 3000000, TO_DATE('2026-04-13 10:45:45', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00275', 'BK0279', TO_DATE('2025-11-26 12:44:37', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00275', 'CUS17', 'BK0279', 'PAY00275', 'PAYMENT', 3000000, TO_DATE('2025-11-26 12:44:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00276', 'BK0280', TO_DATE('2026-06-13 06:41:58', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00276', 'CUS10', 'BK0280', 'PAY00276', 'PAYMENT', 6000000, TO_DATE('2026-06-13 06:41:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00277', 'BK0281', TO_DATE('2025-09-15 17:38:05', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00277', 'CUS23', 'BK0281', 'PAY00277', 'PAYMENT', 3000000, TO_DATE('2025-09-15 17:38:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00278', 'BK0282', TO_DATE('2026-05-09 13:10:11', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00278', 'CUS26', 'BK0282', 'PAY00278', 'PAYMENT', 6000000, TO_DATE('2026-05-09 13:10:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00279', 'BK0283', TO_DATE('2025-10-18 00:42:52', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00279', 'CUS32', 'BK0283', 'PAY00279', 'PAYMENT', 6000000, TO_DATE('2025-10-18 00:42:52', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00280', 'BK0284', TO_DATE('2025-08-26 04:45:21', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00280', 'CUS26', 'BK0284', 'PAY00280', 'PAYMENT', 3000000, TO_DATE('2025-08-26 04:45:21', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00281', 'BK0285', TO_DATE('2025-10-29 13:58:59', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00281', 'CUS20', 'BK0285', 'PAY00281', 'PAYMENT', 9000000, TO_DATE('2025-10-29 13:58:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00282', 'BK0286', TO_DATE('2025-11-23 05:15:22', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00282', 'CUS35', 'BK0286', 'PAY00282', 'PAYMENT', 3000000, TO_DATE('2025-11-23 05:15:22', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00283', 'BK0287', TO_DATE('2025-07-13 21:15:53', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00283', 'CUS17', 'BK0287', 'PAY00283', 'PAYMENT', 3000000, TO_DATE('2025-07-13 21:15:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00284', 'BK0288', TO_DATE('2025-06-17 19:09:07', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00284', 'CUS18', 'BK0288', 'PAY00284', 'PAYMENT', 6000000, TO_DATE('2025-06-17 19:09:07', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00285', 'BK0289', TO_DATE('2025-09-26 22:42:55', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00285', 'CUS30', 'BK0289', 'PAY00285', 'PAYMENT', 9000000, TO_DATE('2025-09-26 22:42:55', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00286', 'BK0290', TO_DATE('2025-10-02 22:59:45', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00286', 'CUS28', 'BK0290', 'PAY00286', 'PAYMENT', 3000000, TO_DATE('2025-10-02 22:59:45', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00287', 'BK0291', TO_DATE('2026-06-15 13:07:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00287', 'CUS28', 'BK0291', 'PAY00287', 'PAYMENT', 3000000, TO_DATE('2026-06-15 13:07:56', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00288', 'BK0292', TO_DATE('2025-05-25 18:15:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00288', 'CUS19', 'BK0292', 'PAY00288', 'PAYMENT', 9000000, TO_DATE('2025-05-25 18:15:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00289', 'BK0293', TO_DATE('2025-12-07 03:52:53', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00289', 'CUS01', 'BK0293', 'PAY00289', 'PAYMENT', 3000000, TO_DATE('2025-12-07 03:52:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00290', 'BK0294', TO_DATE('2025-06-02 06:49:43', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00290', 'CUS02', 'BK0294', 'PAY00290', 'PAYMENT', 3000000, TO_DATE('2025-06-02 06:49:43', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00291', 'BK0295', TO_DATE('2025-08-03 13:24:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00291', 'CUS03', 'BK0295', 'PAY00291', 'PAYMENT', 3000000, TO_DATE('2025-08-03 13:24:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00292', 'BK0296', TO_DATE('2025-06-28 21:16:57', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00292', 'CUS02', 'BK0296', 'PAY00292', 'PAYMENT', 3000000, TO_DATE('2025-06-28 21:16:57', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00293', 'BK0297', TO_DATE('2025-05-27 16:50:49', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00293', 'CUS35', 'BK0297', 'PAY00293', 'PAYMENT', 9000000, TO_DATE('2025-05-27 16:50:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00294', 'BK0298', TO_DATE('2026-07-10 10:25:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00294', 'CUS33', 'BK0298', 'PAY00294', 'PAYMENT', 3000000, TO_DATE('2026-07-10 10:25:56', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00295', 'BK0299', TO_DATE('2025-12-15 07:59:48', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00295', 'CUS11', 'BK0299', 'PAY00295', 'PAYMENT', 9000000, TO_DATE('2025-12-15 07:59:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00296', 'BK0300', TO_DATE('2025-08-15 19:38:10', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00296', 'CUS35', 'BK0300', 'PAY00296', 'PAYMENT', 9000000, TO_DATE('2025-08-15 19:38:10', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00297', 'BK0301', TO_DATE('2026-01-12 16:54:50', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00297', 'CUS20', 'BK0301', 'PAY00297', 'PAYMENT', 9000000, TO_DATE('2026-01-12 16:54:50', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00298', 'BK0302', TO_DATE('2026-03-09 11:28:45', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00298', 'CUS18', 'BK0302', 'PAY00298', 'PAYMENT', 9000000, TO_DATE('2026-03-09 11:28:45', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00299', 'BK0303', TO_DATE('2025-12-14 16:20:43', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00299', 'CUS28', 'BK0303', 'PAY00299', 'PAYMENT', 3000000, TO_DATE('2025-12-14 16:20:43', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00300', 'BK0304', TO_DATE('2025-05-22 09:47:40', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00300', 'CUS23', 'BK0304', 'PAY00300', 'PAYMENT', 9000000, TO_DATE('2025-05-22 09:47:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00301', 'BK0305', TO_DATE('2025-08-15 02:19:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00301', 'CUS30', 'BK0305', 'PAY00301', 'PAYMENT', 6000000, TO_DATE('2025-08-15 02:19:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00302', 'BK0306', TO_DATE('2025-12-13 05:06:24', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00302', 'CUS18', 'BK0306', 'PAY00302', 'PAYMENT', 3000000, TO_DATE('2025-12-13 05:06:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00303', 'BK0307', TO_DATE('2026-01-02 15:50:12', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00303', 'CUS34', 'BK0307', 'PAY00303', 'PAYMENT', 3000000, TO_DATE('2026-01-02 15:50:12', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00304', 'BK0308', TO_DATE('2025-10-28 08:49:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00304', 'CUS21', 'BK0308', 'PAY00304', 'PAYMENT', 3000000, TO_DATE('2025-10-28 08:49:17', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00305', 'BK0309', TO_DATE('2026-04-08 13:53:14', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00305', 'CUS16', 'BK0309', 'PAY00305', 'PAYMENT', 3000000, TO_DATE('2026-04-08 13:53:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00306', 'BK0310', TO_DATE('2025-11-19 18:53:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00306', 'CUS05', 'BK0310', 'PAY00306', 'PAYMENT', 3000000, TO_DATE('2025-11-19 18:53:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00307', 'BK0311', TO_DATE('2025-07-09 22:48:20', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00307', 'CUS02', 'BK0311', 'PAY00307', 'PAYMENT', 6000000, TO_DATE('2025-07-09 22:48:20', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00308', 'BK0312', TO_DATE('2025-07-29 15:24:48', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00308', 'CUS10', 'BK0312', 'PAY00308', 'PAYMENT', 3000000, TO_DATE('2025-07-29 15:24:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00309', 'BK0313', TO_DATE('2026-03-17 21:53:34', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00309', 'CUS26', 'BK0313', 'PAY00309', 'PAYMENT', 9000000, TO_DATE('2026-03-17 21:53:34', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00310', 'BK0314', TO_DATE('2026-05-23 19:18:35', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00310', 'CUS05', 'BK0314', 'PAY00310', 'PAYMENT', 6000000, TO_DATE('2026-05-23 19:18:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00311', 'BK0315', TO_DATE('2025-08-28 22:32:48', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00311', 'CUS33', 'BK0315', 'PAY00311', 'PAYMENT', 9000000, TO_DATE('2025-08-28 22:32:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00312', 'BK0316', TO_DATE('2025-09-03 00:28:55', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00312', 'CUS26', 'BK0316', 'PAY00312', 'PAYMENT', 6000000, TO_DATE('2025-09-03 00:28:55', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00313', 'BK0317', TO_DATE('2026-05-28 02:40:18', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00313', 'CUS28', 'BK0317', 'PAY00313', 'PAYMENT', 3000000, TO_DATE('2026-05-28 02:40:18', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00314', 'BK0318', TO_DATE('2026-05-15 00:03:31', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00314', 'CUS25', 'BK0318', 'PAY00314', 'PAYMENT', 9000000, TO_DATE('2026-05-15 00:03:31', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00315', 'BK0319', TO_DATE('2025-07-18 01:59:16', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00315', 'CUS28', 'BK0319', 'PAY00315', 'PAYMENT', 9000000, TO_DATE('2025-07-18 01:59:16', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00316', 'BK0320', TO_DATE('2025-08-06 22:21:08', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00316', 'CUS25', 'BK0320', 'PAY00316', 'PAYMENT', 6000000, TO_DATE('2025-08-06 22:21:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00317', 'BK0321', TO_DATE('2026-06-07 21:21:35', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00317', 'CUS24', 'BK0321', 'PAY00317', 'PAYMENT', 6000000, TO_DATE('2026-06-07 21:21:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00318', 'BK0322', TO_DATE('2025-12-29 19:14:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00318', 'CUS26', 'BK0322', 'PAY00318', 'PAYMENT', 3000000, TO_DATE('2025-12-29 19:14:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00319', 'BK0323', TO_DATE('2025-06-23 17:14:14', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00319', 'CUS03', 'BK0323', 'PAY00319', 'PAYMENT', 9000000, TO_DATE('2025-06-23 17:14:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00320', 'BK0324', TO_DATE('2026-04-12 21:03:07', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00320', 'CUS22', 'BK0324', 'PAY00320', 'PAYMENT', 6000000, TO_DATE('2026-04-12 21:03:07', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00321', 'BK0325', TO_DATE('2025-05-27 11:01:26', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00321', 'CUS03', 'BK0325', 'PAY00321', 'PAYMENT', 3000000, TO_DATE('2025-05-27 11:01:26', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00322', 'BK0326', TO_DATE('2025-11-25 19:16:44', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00322', 'CUS10', 'BK0326', 'PAY00322', 'PAYMENT', 9000000, TO_DATE('2025-11-25 19:16:44', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00323', 'BK0327', TO_DATE('2025-07-12 17:33:01', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00323', 'CUS26', 'BK0327', 'PAY00323', 'PAYMENT', 9000000, TO_DATE('2025-07-12 17:33:01', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00324', 'BK0328', TO_DATE('2025-12-13 20:27:48', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00324', 'CUS19', 'BK0328', 'PAY00324', 'PAYMENT', 3000000, TO_DATE('2025-12-13 20:27:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00325', 'BK0329', TO_DATE('2025-05-14 07:16:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00325', 'CUS25', 'BK0329', 'PAY00325', 'PAYMENT', 6000000, TO_DATE('2025-05-14 07:16:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00326', 'BK0330', TO_DATE('2025-07-29 03:00:59', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00326', 'CUS31', 'BK0330', 'PAY00326', 'PAYMENT', 3000000, TO_DATE('2025-07-29 03:00:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00327', 'BK0331', TO_DATE('2025-06-22 11:55:38', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00327', 'CUS11', 'BK0331', 'PAY00327', 'PAYMENT', 9000000, TO_DATE('2025-06-22 11:55:38', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00328', 'BK0332', TO_DATE('2025-08-11 04:37:11', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00328', 'CUS03', 'BK0332', 'PAY00328', 'PAYMENT', 9000000, TO_DATE('2025-08-11 04:37:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00329', 'BK0333', TO_DATE('2025-06-11 20:23:32', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00329', 'CUS06', 'BK0333', 'PAY00329', 'PAYMENT', 9000000, TO_DATE('2025-06-11 20:23:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00330', 'BK0334', TO_DATE('2025-08-23 10:51:29', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00330', 'CUS01', 'BK0334', 'PAY00330', 'PAYMENT', 3000000, TO_DATE('2025-08-23 10:51:29', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00331', 'BK0335', TO_DATE('2026-04-05 11:20:08', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00331', 'CUS30', 'BK0335', 'PAY00331', 'PAYMENT', 6000000, TO_DATE('2026-04-05 11:20:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00332', 'BK0336', TO_DATE('2025-12-26 05:12:05', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00332', 'CUS19', 'BK0336', 'PAY00332', 'PAYMENT', 9000000, TO_DATE('2025-12-26 05:12:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00333', 'BK0337', TO_DATE('2025-06-29 10:47:44', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00333', 'CUS03', 'BK0337', 'PAY00333', 'PAYMENT', 3000000, TO_DATE('2025-06-29 10:47:44', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00334', 'BK0338', TO_DATE('2025-07-06 09:00:36', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00334', 'CUS04', 'BK0338', 'PAY00334', 'PAYMENT', 6000000, TO_DATE('2025-07-06 09:00:36', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00335', 'BK0339', TO_DATE('2025-07-17 04:16:39', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00335', 'CUS34', 'BK0339', 'PAY00335', 'PAYMENT', 6000000, TO_DATE('2025-07-17 04:16:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00336', 'BK0340', TO_DATE('2026-05-09 13:59:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00336', 'CUS04', 'BK0340', 'PAY00336', 'PAYMENT', 3000000, TO_DATE('2026-05-09 13:59:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00337', 'BK0341', TO_DATE('2026-01-28 16:49:49', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00337', 'CUS23', 'BK0341', 'PAY00337', 'PAYMENT', 3000000, TO_DATE('2026-01-28 16:49:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00338', 'BK0342', TO_DATE('2025-10-14 09:25:32', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00338', 'CUS25', 'BK0342', 'PAY00338', 'PAYMENT', 3000000, TO_DATE('2025-10-14 09:25:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00339', 'BK0343', TO_DATE('2025-10-16 13:45:09', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00339', 'CUS24', 'BK0343', 'PAY00339', 'PAYMENT', 3000000, TO_DATE('2025-10-16 13:45:09', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00340', 'BK0344', TO_DATE('2026-05-17 05:33:51', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00340', 'CUS30', 'BK0344', 'PAY00340', 'PAYMENT', 9000000, TO_DATE('2026-05-17 05:33:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00341', 'BK0345', TO_DATE('2026-04-13 02:49:57', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00341', 'CUS09', 'BK0345', 'PAY00341', 'PAYMENT', 6000000, TO_DATE('2026-04-13 02:49:57', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00342', 'BK0347', TO_DATE('2025-11-15 15:48:30', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00342', 'CUS24', 'BK0347', 'PAY00342', 'PAYMENT', 3000000, TO_DATE('2025-11-15 15:48:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00343', 'BK0348', TO_DATE('2025-09-03 11:26:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00343', 'CUS28', 'BK0348', 'PAY00343', 'PAYMENT', 9000000, TO_DATE('2025-09-03 11:26:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00344', 'BK0349', TO_DATE('2025-06-23 23:30:23', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00344', 'CUS23', 'BK0349', 'PAY00344', 'PAYMENT', 9000000, TO_DATE('2025-06-23 23:30:23', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00345', 'BK0350', TO_DATE('2025-07-02 05:21:14', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00345', 'CUS30', 'BK0350', 'PAY00345', 'PAYMENT', 6000000, TO_DATE('2025-07-02 05:21:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00346', 'BK0351', TO_DATE('2025-11-20 04:09:16', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00346', 'CUS19', 'BK0351', 'PAY00346', 'PAYMENT', 3000000, TO_DATE('2025-11-20 04:09:16', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00347', 'BK0352', TO_DATE('2025-12-02 17:14:35', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00347', 'CUS15', 'BK0352', 'PAY00347', 'PAYMENT', 9000000, TO_DATE('2025-12-02 17:14:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00348', 'BK0353', TO_DATE('2025-08-07 12:41:22', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00348', 'CUS16', 'BK0353', 'PAY00348', 'PAYMENT', 9000000, TO_DATE('2025-08-07 12:41:22', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00349', 'BK0354', TO_DATE('2025-07-26 09:41:12', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00349', 'CUS32', 'BK0354', 'PAY00349', 'PAYMENT', 6000000, TO_DATE('2025-07-26 09:41:12', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00350', 'BK0355', TO_DATE('2026-04-09 13:05:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00350', 'CUS06', 'BK0355', 'PAY00350', 'PAYMENT', 6000000, TO_DATE('2026-04-09 13:05:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00351', 'BK0356', TO_DATE('2025-11-14 19:16:16', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00351', 'CUS30', 'BK0356', 'PAY00351', 'PAYMENT', 6000000, TO_DATE('2025-11-14 19:16:16', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00352', 'BK0357', TO_DATE('2025-09-20 22:00:44', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00352', 'CUS07', 'BK0357', 'PAY00352', 'PAYMENT', 3000000, TO_DATE('2025-09-20 22:00:44', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00353', 'BK0358', TO_DATE('2026-02-02 04:24:47', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00353', 'CUS15', 'BK0358', 'PAY00353', 'PAYMENT', 3000000, TO_DATE('2026-02-02 04:24:47', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00354', 'BK0359', TO_DATE('2025-12-14 17:53:38', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00354', 'CUS30', 'BK0359', 'PAY00354', 'PAYMENT', 6000000, TO_DATE('2025-12-14 17:53:38', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00355', 'BK0360', TO_DATE('2025-07-01 19:13:51', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00355', 'CUS28', 'BK0360', 'PAY00355', 'PAYMENT', 3000000, TO_DATE('2025-07-01 19:13:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00356', 'BK0361', TO_DATE('2026-01-09 19:58:22', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00356', 'CUS12', 'BK0361', 'PAY00356', 'PAYMENT', 3000000, TO_DATE('2026-01-09 19:58:22', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00357', 'BK0362', TO_DATE('2026-04-18 09:50:15', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00357', 'CUS19', 'BK0362', 'PAY00357', 'PAYMENT', 9000000, TO_DATE('2026-04-18 09:50:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00358', 'BK0363', TO_DATE('2025-08-05 14:31:19', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00358', 'CUS01', 'BK0363', 'PAY00358', 'PAYMENT', 3000000, TO_DATE('2025-08-05 14:31:19', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00359', 'BK0364', TO_DATE('2025-08-03 08:09:00', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00359', 'CUS23', 'BK0364', 'PAY00359', 'PAYMENT', 9000000, TO_DATE('2025-08-03 08:09:00', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00360', 'BK0365', TO_DATE('2026-05-07 22:53:54', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00360', 'CUS06', 'BK0365', 'PAY00360', 'PAYMENT', 6000000, TO_DATE('2026-05-07 22:53:54', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00361', 'BK0366', TO_DATE('2025-12-15 02:39:43', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00361', 'CUS04', 'BK0366', 'PAY00361', 'PAYMENT', 3000000, TO_DATE('2025-12-15 02:39:43', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00362', 'BK0367', TO_DATE('2025-12-13 02:21:48', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00362', 'CUS20', 'BK0367', 'PAY00362', 'PAYMENT', 9000000, TO_DATE('2025-12-13 02:21:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00363', 'BK0368', TO_DATE('2026-06-01 10:11:30', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00363', 'CUS23', 'BK0368', 'PAY00363', 'PAYMENT', 6000000, TO_DATE('2026-06-01 10:11:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00364', 'BK0369', TO_DATE('2025-05-10 17:48:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00364', 'CUS25', 'BK0369', 'PAY00364', 'PAYMENT', 3000000, TO_DATE('2025-05-10 17:48:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00365', 'BK0370', TO_DATE('2026-04-12 17:07:53', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00365', 'CUS21', 'BK0370', 'PAY00365', 'PAYMENT', 3000000, TO_DATE('2026-04-12 17:07:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00366', 'BK0371', TO_DATE('2025-08-16 11:13:06', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00366', 'CUS19', 'BK0371', 'PAY00366', 'PAYMENT', 9000000, TO_DATE('2025-08-16 11:13:06', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00367', 'BK0372', TO_DATE('2026-01-27 22:00:27', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00367', 'CUS01', 'BK0372', 'PAY00367', 'PAYMENT', 9000000, TO_DATE('2026-01-27 22:00:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00368', 'BK0373', TO_DATE('2025-12-25 00:31:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00368', 'CUS05', 'BK0373', 'PAY00368', 'PAYMENT', 3000000, TO_DATE('2025-12-25 00:31:56', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00369', 'BK0374', TO_DATE('2025-12-09 00:31:51', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00369', 'CUS27', 'BK0374', 'PAY00369', 'PAYMENT', 9000000, TO_DATE('2025-12-09 00:31:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00370', 'BK0375', TO_DATE('2025-07-26 08:59:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00370', 'CUS12', 'BK0375', 'PAY00370', 'PAYMENT', 3000000, TO_DATE('2025-07-26 08:59:17', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00371', 'BK0376', TO_DATE('2025-11-05 09:56:49', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00371', 'CUS27', 'BK0376', 'PAY00371', 'PAYMENT', 6000000, TO_DATE('2025-11-05 09:56:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00372', 'BK0377', TO_DATE('2025-12-02 04:11:46', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00372', 'CUS08', 'BK0377', 'PAY00372', 'PAYMENT', 3000000, TO_DATE('2025-12-02 04:11:46', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00373', 'BK0378', TO_DATE('2025-10-21 15:18:46', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00373', 'CUS22', 'BK0378', 'PAY00373', 'PAYMENT', 6000000, TO_DATE('2025-10-21 15:18:46', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00374', 'BK0379', TO_DATE('2026-06-12 23:19:52', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00374', 'CUS17', 'BK0379', 'PAY00374', 'PAYMENT', 3000000, TO_DATE('2026-06-12 23:19:52', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00375', 'BK0380', TO_DATE('2026-01-12 09:10:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00375', 'CUS03', 'BK0380', 'PAY00375', 'PAYMENT', 6000000, TO_DATE('2026-01-12 09:10:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00376', 'BK0381', TO_DATE('2026-05-16 08:13:46', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00376', 'CUS26', 'BK0381', 'PAY00376', 'PAYMENT', 3000000, TO_DATE('2026-05-16 08:13:46', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00377', 'BK0382', TO_DATE('2026-04-24 07:19:45', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00377', 'CUS30', 'BK0382', 'PAY00377', 'PAYMENT', 9000000, TO_DATE('2026-04-24 07:19:45', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00378', 'BK0383', TO_DATE('2026-01-19 22:46:58', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00378', 'CUS19', 'BK0383', 'PAY00378', 'PAYMENT', 6000000, TO_DATE('2026-01-19 22:46:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00379', 'BK0384', TO_DATE('2026-04-09 02:01:12', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00379', 'CUS35', 'BK0384', 'PAY00379', 'PAYMENT', 9000000, TO_DATE('2026-04-09 02:01:12', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00380', 'BK0385', TO_DATE('2025-09-16 10:52:24', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00380', 'CUS34', 'BK0385', 'PAY00380', 'PAYMENT', 9000000, TO_DATE('2025-09-16 10:52:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00381', 'BK0386', TO_DATE('2026-06-20 17:01:51', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00381', 'CUS12', 'BK0386', 'PAY00381', 'PAYMENT', 6000000, TO_DATE('2026-06-20 17:01:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00382', 'BK0387', TO_DATE('2025-09-02 15:08:15', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00382', 'CUS09', 'BK0387', 'PAY00382', 'PAYMENT', 3000000, TO_DATE('2025-09-02 15:08:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00383', 'BK0388', TO_DATE('2025-10-17 13:51:23', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00383', 'CUS05', 'BK0388', 'PAY00383', 'PAYMENT', 9000000, TO_DATE('2025-10-17 13:51:23', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00384', 'BK0389', TO_DATE('2025-07-14 22:32:27', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00384', 'CUS01', 'BK0389', 'PAY00384', 'PAYMENT', 9000000, TO_DATE('2025-07-14 22:32:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00385', 'BK0390', TO_DATE('2026-02-07 22:34:01', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00385', 'CUS01', 'BK0390', 'PAY00385', 'PAYMENT', 6000000, TO_DATE('2026-02-07 22:34:01', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00386', 'BK0391', TO_DATE('2025-09-13 11:05:04', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00386', 'CUS21', 'BK0391', 'PAY00386', 'PAYMENT', 9000000, TO_DATE('2025-09-13 11:05:04', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00387', 'BK0392', TO_DATE('2025-06-28 16:51:15', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00387', 'CUS15', 'BK0392', 'PAY00387', 'PAYMENT', 6000000, TO_DATE('2025-06-28 16:51:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00388', 'BK0393', TO_DATE('2026-01-07 17:03:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00388', 'CUS30', 'BK0393', 'PAY00388', 'PAYMENT', 9000000, TO_DATE('2026-01-07 17:03:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00389', 'BK0394', TO_DATE('2025-10-09 15:50:36', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00389', 'CUS02', 'BK0394', 'PAY00389', 'PAYMENT', 6000000, TO_DATE('2025-10-09 15:50:36', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00390', 'BK0395', TO_DATE('2026-01-26 00:25:43', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00390', 'CUS22', 'BK0395', 'PAY00390', 'PAYMENT', 9000000, TO_DATE('2026-01-26 00:25:43', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00391', 'BK0396', TO_DATE('2025-05-16 04:34:15', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00391', 'CUS16', 'BK0396', 'PAY00391', 'PAYMENT', 6000000, TO_DATE('2025-05-16 04:34:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00392', 'BK0397', TO_DATE('2025-10-06 10:34:44', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00392', 'CUS29', 'BK0397', 'PAY00392', 'PAYMENT', 3000000, TO_DATE('2025-10-06 10:34:44', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00393', 'BK0398', TO_DATE('2025-06-25 18:19:36', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00393', 'CUS15', 'BK0398', 'PAY00393', 'PAYMENT', 6000000, TO_DATE('2025-06-25 18:19:36', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00394', 'BK0399', TO_DATE('2025-07-03 06:08:27', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00394', 'CUS33', 'BK0399', 'PAY00394', 'PAYMENT', 3000000, TO_DATE('2025-07-03 06:08:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00395', 'BK0400', TO_DATE('2026-01-10 18:56:43', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00395', 'CUS31', 'BK0400', 'PAY00395', 'PAYMENT', 6000000, TO_DATE('2026-01-10 18:56:43', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00396', 'BK0401', TO_DATE('2026-06-06 06:28:57', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00396', 'CUS34', 'BK0401', 'PAY00396', 'PAYMENT', 3000000, TO_DATE('2026-06-06 06:28:57', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00397', 'BK0402', TO_DATE('2025-06-27 07:26:41', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00397', 'CUS23', 'BK0402', 'PAY00397', 'PAYMENT', 6000000, TO_DATE('2025-06-27 07:26:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00398', 'BK0403', TO_DATE('2025-06-24 16:26:03', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00398', 'CUS06', 'BK0403', 'PAY00398', 'PAYMENT', 9000000, TO_DATE('2025-06-24 16:26:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00399', 'BK0404', TO_DATE('2026-04-28 14:12:05', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00399', 'CUS27', 'BK0404', 'PAY00399', 'PAYMENT', 9000000, TO_DATE('2026-04-28 14:12:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00400', 'BK0405', TO_DATE('2026-01-27 00:51:59', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00400', 'CUS31', 'BK0405', 'PAY00400', 'PAYMENT', 3000000, TO_DATE('2026-01-27 00:51:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00401', 'BK0406', TO_DATE('2025-09-20 16:54:11', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00401', 'CUS12', 'BK0406', 'PAY00401', 'PAYMENT', 9000000, TO_DATE('2025-09-20 16:54:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00402', 'BK0407', TO_DATE('2025-10-29 12:15:02', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00402', 'CUS02', 'BK0407', 'PAY00402', 'PAYMENT', 9000000, TO_DATE('2025-10-29 12:15:02', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00403', 'BK0408', TO_DATE('2026-01-24 18:35:37', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00403', 'CUS24', 'BK0408', 'PAY00403', 'PAYMENT', 3000000, TO_DATE('2026-01-24 18:35:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00404', 'BK0409', TO_DATE('2025-06-05 22:36:25', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00404', 'CUS32', 'BK0409', 'PAY00404', 'PAYMENT', 6000000, TO_DATE('2025-06-05 22:36:25', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00405', 'BK0410', TO_DATE('2025-10-14 12:28:46', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00405', 'CUS26', 'BK0410', 'PAY00405', 'PAYMENT', 3000000, TO_DATE('2025-10-14 12:28:46', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00406', 'BK0411', TO_DATE('2026-01-15 03:45:19', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00406', 'CUS19', 'BK0411', 'PAY00406', 'PAYMENT', 9000000, TO_DATE('2026-01-15 03:45:19', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00407', 'BK0412', TO_DATE('2025-08-07 17:48:47', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00407', 'CUS28', 'BK0412', 'PAY00407', 'PAYMENT', 3000000, TO_DATE('2025-08-07 17:48:47', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00408', 'BK0413', TO_DATE('2026-05-19 21:23:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00408', 'CUS33', 'BK0413', 'PAY00408', 'PAYMENT', 6000000, TO_DATE('2026-05-19 21:23:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00409', 'BK0414', TO_DATE('2026-05-07 23:29:57', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00409', 'CUS20', 'BK0414', 'PAY00409', 'PAYMENT', 9000000, TO_DATE('2026-05-07 23:29:57', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00410', 'BK0415', TO_DATE('2025-12-31 08:09:21', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00410', 'CUS15', 'BK0415', 'PAY00410', 'PAYMENT', 9000000, TO_DATE('2025-12-31 08:09:21', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00411', 'BK0416', TO_DATE('2025-05-09 12:01:24', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00411', 'CUS09', 'BK0416', 'PAY00411', 'PAYMENT', 6000000, TO_DATE('2025-05-09 12:01:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00412', 'BK0417', TO_DATE('2025-10-28 16:52:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00412', 'CUS23', 'BK0417', 'PAY00412', 'PAYMENT', 6000000, TO_DATE('2025-10-28 16:52:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00413', 'BK0418', TO_DATE('2026-01-14 04:29:08', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00413', 'CUS28', 'BK0418', 'PAY00413', 'PAYMENT', 3000000, TO_DATE('2026-01-14 04:29:08', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00414', 'BK0419', TO_DATE('2025-06-22 00:24:44', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00414', 'CUS04', 'BK0419', 'PAY00414', 'PAYMENT', 9000000, TO_DATE('2025-06-22 00:24:44', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00415', 'BK0420', TO_DATE('2026-05-10 10:20:35', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00415', 'CUS13', 'BK0420', 'PAY00415', 'PAYMENT', 3000000, TO_DATE('2026-05-10 10:20:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00416', 'BK0421', TO_DATE('2026-05-26 20:47:26', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00416', 'CUS23', 'BK0421', 'PAY00416', 'PAYMENT', 9000000, TO_DATE('2026-05-26 20:47:26', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00417', 'BK0422', TO_DATE('2025-11-25 18:03:26', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00417', 'CUS12', 'BK0422', 'PAY00417', 'PAYMENT', 3000000, TO_DATE('2025-11-25 18:03:26', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00418', 'BK0423', TO_DATE('2026-01-14 01:24:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00418', 'CUS06', 'BK0423', 'PAY00418', 'PAYMENT', 3000000, TO_DATE('2026-01-14 01:24:06', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00419', 'BK0424', TO_DATE('2025-12-12 19:05:04', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00419', 'CUS14', 'BK0424', 'PAY00419', 'PAYMENT', 9000000, TO_DATE('2025-12-12 19:05:04', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00420', 'BK0425', TO_DATE('2025-08-20 10:58:28', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00420', 'CUS21', 'BK0425', 'PAY00420', 'PAYMENT', 6000000, TO_DATE('2025-08-20 10:58:28', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00421', 'BK0426', TO_DATE('2026-05-31 03:04:43', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00421', 'CUS16', 'BK0426', 'PAY00421', 'PAYMENT', 9000000, TO_DATE('2026-05-31 03:04:43', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00422', 'BK0427', TO_DATE('2026-05-11 18:33:50', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00422', 'CUS28', 'BK0427', 'PAY00422', 'PAYMENT', 9000000, TO_DATE('2026-05-11 18:33:50', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00423', 'BK0428', TO_DATE('2025-12-23 19:11:28', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00423', 'CUS34', 'BK0428', 'PAY00423', 'PAYMENT', 6000000, TO_DATE('2025-12-23 19:11:28', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00424', 'BK0429', TO_DATE('2025-12-05 07:48:14', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00424', 'CUS13', 'BK0429', 'PAY00424', 'PAYMENT', 3000000, TO_DATE('2025-12-05 07:48:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00425', 'BK0430', TO_DATE('2025-06-18 19:55:21', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00425', 'CUS29', 'BK0430', 'PAY00425', 'PAYMENT', 3000000, TO_DATE('2025-06-18 19:55:21', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00426', 'BK0431', TO_DATE('2025-09-09 00:31:28', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00426', 'CUS17', 'BK0431', 'PAY00426', 'PAYMENT', 6000000, TO_DATE('2025-09-09 00:31:28', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00427', 'BK0432', TO_DATE('2025-10-03 14:34:44', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00427', 'CUS10', 'BK0432', 'PAY00427', 'PAYMENT', 9000000, TO_DATE('2025-10-03 14:34:44', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00428', 'BK0433', TO_DATE('2025-06-12 20:29:47', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00428', 'CUS12', 'BK0433', 'PAY00428', 'PAYMENT', 3000000, TO_DATE('2025-06-12 20:29:47', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00429', 'BK0434', TO_DATE('2026-05-02 16:41:00', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00429', 'CUS34', 'BK0434', 'PAY00429', 'PAYMENT', 6000000, TO_DATE('2026-05-02 16:41:00', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00430', 'BK0435', TO_DATE('2025-11-29 10:59:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00430', 'CUS21', 'BK0435', 'PAY00430', 'PAYMENT', 3000000, TO_DATE('2025-11-29 10:59:04', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00431', 'BK0436', TO_DATE('2026-04-09 11:30:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00431', 'CUS26', 'BK0436', 'PAY00431', 'PAYMENT', 6000000, TO_DATE('2026-04-09 11:30:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00432', 'BK0437', TO_DATE('2026-01-27 23:42:39', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00432', 'CUS19', 'BK0437', 'PAY00432', 'PAYMENT', 6000000, TO_DATE('2026-01-27 23:42:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00433', 'BK0438', TO_DATE('2025-10-07 13:54:42', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00433', 'CUS32', 'BK0438', 'PAY00433', 'PAYMENT', 3000000, TO_DATE('2025-10-07 13:54:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00434', 'BK0439', TO_DATE('2026-06-30 20:30:53', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00434', 'CUS27', 'BK0439', 'PAY00434', 'PAYMENT', 9000000, TO_DATE('2026-06-30 20:30:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00435', 'BK0440', TO_DATE('2025-05-19 06:01:19', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00435', 'CUS01', 'BK0440', 'PAY00435', 'PAYMENT', 9000000, TO_DATE('2025-05-19 06:01:19', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00436', 'BK0441', TO_DATE('2025-09-17 14:06:59', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00436', 'CUS06', 'BK0441', 'PAY00436', 'PAYMENT', 3000000, TO_DATE('2025-09-17 14:06:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00437', 'BK0442', TO_DATE('2026-05-18 06:53:37', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00437', 'CUS18', 'BK0442', 'PAY00437', 'PAYMENT', 9000000, TO_DATE('2026-05-18 06:53:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00438', 'BK0443', TO_DATE('2025-11-09 20:52:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00438', 'CUS32', 'BK0443', 'PAY00438', 'PAYMENT', 3000000, TO_DATE('2025-11-09 20:52:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00439', 'BK0444', TO_DATE('2025-09-26 12:00:14', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00439', 'CUS22', 'BK0444', 'PAY00439', 'PAYMENT', 9000000, TO_DATE('2025-09-26 12:00:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00440', 'BK0445', TO_DATE('2026-01-17 00:18:21', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00440', 'CUS29', 'BK0445', 'PAY00440', 'PAYMENT', 3000000, TO_DATE('2026-01-17 00:18:21', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00441', 'BK0446', TO_DATE('2025-06-23 03:02:14', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00441', 'CUS23', 'BK0446', 'PAY00441', 'PAYMENT', 6000000, TO_DATE('2025-06-23 03:02:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00442', 'BK0447', TO_DATE('2025-05-23 06:00:16', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00442', 'CUS25', 'BK0447', 'PAY00442', 'PAYMENT', 6000000, TO_DATE('2025-05-23 06:00:16', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00443', 'BK0448', TO_DATE('2025-09-08 07:39:15', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00443', 'CUS02', 'BK0448', 'PAY00443', 'PAYMENT', 9000000, TO_DATE('2025-09-08 07:39:15', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00444', 'BK0449', TO_DATE('2025-06-23 04:21:14', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00444', 'CUS10', 'BK0449', 'PAY00444', 'PAYMENT', 3000000, TO_DATE('2025-06-23 04:21:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00445', 'BK0450', TO_DATE('2025-08-13 22:58:38', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00445', 'CUS05', 'BK0450', 'PAY00445', 'PAYMENT', 9000000, TO_DATE('2025-08-13 22:58:38', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00446', 'BK0451', TO_DATE('2026-02-01 01:14:39', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00446', 'CUS23', 'BK0451', 'PAY00446', 'PAYMENT', 9000000, TO_DATE('2026-02-01 01:14:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00447', 'BK0452', TO_DATE('2025-10-06 06:17:35', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00447', 'CUS09', 'BK0452', 'PAY00447', 'PAYMENT', 3000000, TO_DATE('2025-10-06 06:17:35', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00448', 'BK0453', TO_DATE('2025-06-10 03:35:30', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00448', 'CUS19', 'BK0453', 'PAY00448', 'PAYMENT', 9000000, TO_DATE('2025-06-10 03:35:30', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00449', 'BK0454', TO_DATE('2026-05-31 07:59:37', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00449', 'CUS06', 'BK0454', 'PAY00449', 'PAYMENT', 3000000, TO_DATE('2026-05-31 07:59:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00450', 'BK0455', TO_DATE('2025-08-06 18:21:58', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00450', 'CUS12', 'BK0455', 'PAY00450', 'PAYMENT', 9000000, TO_DATE('2025-08-06 18:21:58', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00451', 'BK0456', TO_DATE('2026-05-16 00:14:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00451', 'CUS18', 'BK0456', 'PAY00451', 'PAYMENT', 9000000, TO_DATE('2026-05-16 00:14:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00452', 'BK0457', TO_DATE('2025-08-05 03:12:03', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00452', 'CUS33', 'BK0457', 'PAY00452', 'PAYMENT', 3000000, TO_DATE('2025-08-05 03:12:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00453', 'BK0458', TO_DATE('2026-03-12 21:29:37', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00453', 'CUS11', 'BK0458', 'PAY00453', 'PAYMENT', 6000000, TO_DATE('2026-03-12 21:29:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00454', 'BK0459', TO_DATE('2025-05-28 03:21:32', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00454', 'CUS10', 'BK0459', 'PAY00454', 'PAYMENT', 3000000, TO_DATE('2025-05-28 03:21:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00455', 'BK0460', TO_DATE('2026-06-07 12:24:40', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00455', 'CUS18', 'BK0460', 'PAY00455', 'PAYMENT', 3000000, TO_DATE('2026-06-07 12:24:40', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00456', 'BK0461', TO_DATE('2025-12-08 15:48:39', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00456', 'CUS15', 'BK0461', 'PAY00456', 'PAYMENT', 6000000, TO_DATE('2025-12-08 15:48:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00457', 'BK0462', TO_DATE('2025-07-27 16:17:42', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00457', 'CUS06', 'BK0462', 'PAY00457', 'PAYMENT', 6000000, TO_DATE('2025-07-27 16:17:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00458', 'BK0463', TO_DATE('2025-11-18 19:53:46', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00458', 'CUS26', 'BK0463', 'PAY00458', 'PAYMENT', 9000000, TO_DATE('2025-11-18 19:53:46', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00459', 'BK0464', TO_DATE('2025-08-28 12:41:02', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00459', 'CUS11', 'BK0464', 'PAY00459', 'PAYMENT', 3000000, TO_DATE('2025-08-28 12:41:02', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00460', 'BK0465', TO_DATE('2025-10-12 01:22:33', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00460', 'CUS28', 'BK0465', 'PAY00460', 'PAYMENT', 9000000, TO_DATE('2025-10-12 01:22:33', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00461', 'BK0466', TO_DATE('2026-02-02 00:34:24', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00461', 'CUS34', 'BK0466', 'PAY00461', 'PAYMENT', 9000000, TO_DATE('2026-02-02 00:34:24', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00462', 'BK0467', TO_DATE('2025-07-21 19:08:42', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00462', 'CUS19', 'BK0467', 'PAY00462', 'PAYMENT', 9000000, TO_DATE('2025-07-21 19:08:42', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00463', 'BK0468', TO_DATE('2025-07-14 02:19:51', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00463', 'CUS29', 'BK0468', 'PAY00463', 'PAYMENT', 6000000, TO_DATE('2025-07-14 02:19:51', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00464', 'BK0469', TO_DATE('2026-05-07 08:03:14', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00464', 'CUS08', 'BK0469', 'PAY00464', 'PAYMENT', 6000000, TO_DATE('2026-05-07 08:03:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00465', 'BK0470', TO_DATE('2025-10-06 01:08:11', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00465', 'CUS20', 'BK0470', 'PAY00465', 'PAYMENT', 3000000, TO_DATE('2025-10-06 01:08:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00466', 'BK0471', TO_DATE('2026-05-25 00:56:56', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00466', 'CUS25', 'BK0471', 'PAY00466', 'PAYMENT', 3000000, TO_DATE('2026-05-25 00:56:56', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00467', 'BK0472', TO_DATE('2026-01-10 13:25:29', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00467', 'CUS31', 'BK0472', 'PAY00467', 'PAYMENT', 6000000, TO_DATE('2026-01-10 13:25:29', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00468', 'BK0473', TO_DATE('2025-11-05 21:21:11', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00468', 'CUS26', 'BK0473', 'PAY00468', 'PAYMENT', 3000000, TO_DATE('2025-11-05 21:21:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00469', 'BK0474', TO_DATE('2025-09-23 02:52:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00469', 'CUS09', 'BK0474', 'PAY00469', 'PAYMENT', 3000000, TO_DATE('2025-09-23 02:52:17', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00470', 'BK0475', TO_DATE('2026-01-06 08:55:05', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00470', 'CUS33', 'BK0475', 'PAY00470', 'PAYMENT', 9000000, TO_DATE('2026-01-06 08:55:05', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00471', 'BK0476', TO_DATE('2026-01-12 14:51:27', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00471', 'CUS18', 'BK0476', 'PAY00471', 'PAYMENT', 9000000, TO_DATE('2026-01-12 14:51:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00472', 'BK0477', TO_DATE('2026-03-28 19:46:17', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00472', 'CUS33', 'BK0477', 'PAY00472', 'PAYMENT', 3000000, TO_DATE('2026-03-28 19:46:17', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00473', 'BK0478', TO_DATE('2026-01-11 12:03:32', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00473', 'CUS23', 'BK0478', 'PAY00473', 'PAYMENT', 3000000, TO_DATE('2026-01-11 12:03:32', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00474', 'BK0479', TO_DATE('2025-11-21 14:41:28', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00474', 'CUS21', 'BK0479', 'PAY00474', 'PAYMENT', 6000000, TO_DATE('2025-11-21 14:41:28', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00475', 'BK0480', TO_DATE('2025-10-20 17:01:49', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00475', 'CUS29', 'BK0480', 'PAY00475', 'PAYMENT', 6000000, TO_DATE('2025-10-20 17:01:49', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00476', 'BK0481', TO_DATE('2026-06-04 22:51:06', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00476', 'CUS19', 'BK0481', 'PAY00476', 'PAYMENT', 9000000, TO_DATE('2026-06-04 22:51:06', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00477', 'BK0482', TO_DATE('2025-05-30 08:17:11', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00477', 'CUS03', 'BK0482', 'PAY00477', 'PAYMENT', 9000000, TO_DATE('2025-05-30 08:17:11', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00478', 'BK0483', TO_DATE('2025-12-24 07:23:59', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00478', 'CUS27', 'BK0483', 'PAY00478', 'PAYMENT', 6000000, TO_DATE('2025-12-24 07:23:59', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00479', 'BK0484', TO_DATE('2025-06-07 15:53:48', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00479', 'CUS09', 'BK0484', 'PAY00479', 'PAYMENT', 6000000, TO_DATE('2025-06-07 15:53:48', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00480', 'BK0485', TO_DATE('2025-11-02 11:37:50', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00480', 'CUS07', 'BK0485', 'PAY00480', 'PAYMENT', 6000000, TO_DATE('2025-11-02 11:37:50', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00481', 'BK0486', TO_DATE('2026-05-18 08:10:07', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00481', 'CUS22', 'BK0486', 'PAY00481', 'PAYMENT', 6000000, TO_DATE('2026-05-18 08:10:07', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00482', 'BK0487', TO_DATE('2026-02-03 03:40:43', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00482', 'CUS02', 'BK0487', 'PAY00482', 'PAYMENT', 9000000, TO_DATE('2026-02-03 03:40:43', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00483', 'BK0488', TO_DATE('2025-11-22 10:15:39', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'MOMO', 'FAILED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00483', 'CUS05', 'BK0488', 'PAY00483', 'PAYMENT', 6000000, TO_DATE('2025-11-22 10:15:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00484', 'BK0489', TO_DATE('2025-06-10 21:03:27', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00484', 'CUS21', 'BK0489', 'PAY00484', 'PAYMENT', 6000000, TO_DATE('2025-06-10 21:03:27', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00485', 'BK0490', TO_DATE('2025-08-08 01:15:39', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00485', 'CUS14', 'BK0490', 'PAY00485', 'PAYMENT', 3000000, TO_DATE('2025-08-08 01:15:39', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00486', 'BK0491', TO_DATE('2026-01-06 21:58:53', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00486', 'CUS29', 'BK0491', 'PAY00486', 'PAYMENT', 3000000, TO_DATE('2026-01-06 21:58:53', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00487', 'BK0492', TO_DATE('2025-05-06 10:10:01', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00487', 'CUS19', 'BK0492', 'PAY00487', 'PAYMENT', 6000000, TO_DATE('2025-05-06 10:10:01', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00488', 'BK0493', TO_DATE('2026-06-09 16:36:41', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00488', 'CUS14', 'BK0493', 'PAY00488', 'PAYMENT', 9000000, TO_DATE('2026-06-09 16:36:41', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00489', 'BK0494', TO_DATE('2026-06-10 23:53:14', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00489', 'CUS08', 'BK0494', 'PAY00489', 'PAYMENT', 3000000, TO_DATE('2026-06-10 23:53:14', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00490', 'BK0495', TO_DATE('2025-11-22 23:51:04', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'CREDIT CARD', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00490', 'CUS20', 'BK0495', 'PAY00490', 'PAYMENT', 3000000, TO_DATE('2025-11-22 23:51:04', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00491', 'BK0496', TO_DATE('2025-12-07 09:29:25', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00491', 'CUS06', 'BK0496', 'PAY00491', 'PAYMENT', 3000000, TO_DATE('2025-12-07 09:29:25', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00492', 'BK0497', TO_DATE('2025-10-28 07:51:37', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00492', 'CUS22', 'BK0497', 'PAY00492', 'PAYMENT', 6000000, TO_DATE('2025-10-28 07:51:37', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00493', 'BK0498', TO_DATE('2025-08-19 11:34:17', 'YYYY-MM-DD HH24:MI:SS'), 9000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00493', 'CUS30', 'BK0498', 'PAY00493', 'PAYMENT', 9000000, TO_DATE('2025-08-19 11:34:17', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00494', 'BK0499', TO_DATE('2025-06-16 08:24:03', 'YYYY-MM-DD HH24:MI:SS'), 6000000, 'BANK TRANSFER', 'SUCCESS');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00494', 'CUS15', 'BK0499', 'PAY00494', 'PAYMENT', 6000000, TO_DATE('2025-06-16 08:24:03', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');
INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) VALUES ('PAY00495', 'BK0500', TO_DATE('2025-05-26 00:43:06', 'YYYY-MM-DD HH24:MI:SS'), 3000000, 'MOMO', 'REFUNDED');
INSERT INTO TRANSACTION_HISTORY (TransactionID, CustomerID, BookingID, PaymentID, TransactionType, Amount, TransactionDate, Description) VALUES ('TH00495', 'CUS16', 'BK0500', 'PAY00495', 'PAYMENT', 3000000, TO_DATE('2025-05-26 00:43:06', 'YYYY-MM-DD HH24:MI:SS'), 'Thanh toan ve may bay');

ALTER TRIGGER TRG_PREVENT_PAST_BOOKING ENABLE;
ALTER TRIGGER TRG_LOG_SUCCESSFUL_PAYMENT ENABLE;
ALTER TRIGGER TRG_CHECK_AIRCRAFT_OVERLAP ENABLE;
ALTER TRIGGER TRG_UPDATE_BOOKING_TOTAL ENABLE;
ALTER TRIGGER TRG_RB60_CHECK_PAYMENT_AMOUNT ENABLE;
ALTER TRIGGER TRG_RB64_CHECK_TICKET_PAYMENT ENABLE;
ALTER TRIGGER TRG_RB66_BOOKING_MUST_HAVE_TICKET ENABLE;

-- BẢNG DANH MỤC CHỨC NĂNG (FUNCTION)
INSERT ALL
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN01', 'DASHBOARD', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN02', 'FLIGHT_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN03', 'BOOKING_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN04', 'TICKET_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN05', 'CUSTOMER_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN06', 'EMPLOYEE_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN07', 'ROLE_MANAGEMENT', 0)
    INTO "FUNCTION" (FunctionID, NameFunction, IsDeleted) VALUES ('FN08', 'DATA_MANAGEMENT', 0)
SELECT 1 FROM DUAL;

-- BẢNG QUYỀN HẠN (ROLE)
INSERT ALL
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL01', 'FN01', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL02', 'FN02', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL03', 'FN03', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL04', 'FN04', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL05', 'FN05', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL06', 'FN06', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL07', 'FN07', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL08', 'FN08', 1, 1, 1, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL09', 'FN01', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL10', 'FN02', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL11', 'FN03', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL12', 'FN04', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL13', 'FN05', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL14', 'FN06', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL15', 'FN07', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL16', 'FN08', 0, 0, 0, 0, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL17', 'FN01', 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL18', 'FN02', 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL19', 'FN03', 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL20', 'FN04', 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL21', 'FN05', 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL22', 'FN06', 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL23', 'FN07', 1, 1, 0, 1, 1, 0)
    INTO ROLE (RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, IsDeleted) VALUES ('RL24', 'FN08', 1, 1, 0, 1, 1, 0)
SELECT 1 FROM DUAL;

-- BẢNG NHÓM QUYỀN (ROLE_GROUP)
INSERT ALL
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES ('RG01', 'ADMIN_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES ('RG02', 'MANAGER_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES ('RG03', 'STAFF_GROUP', 0)
    INTO ROLE_GROUP (RoleGroupID, NameRoleGroup, IsDeleted) VALUES ('RG04', 'CUSTOMER_GROUP', 0)
SELECT 1 FROM DUAL;

-- BẢNG GÁN NHÓM QUYỀN VỚI QUYỀN (ROLE_GROUP_ASSIGN_ROLE)
INSERT ALL
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL01', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL02', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL03', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL04', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL05', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL06', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL07', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG01', 'RL08', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG02', 'RL01', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG02', 'RL02', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG02', 'RL03', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG02', 'RL04', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG02', 'RL05', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG02', 'RL06', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG03', 'RL18', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG03', 'RL19', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG03', 'RL20', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG03', 'RL21', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG04', 'RL09', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG04', 'RL11', 0)
    INTO ROLE_GROUP_ASSIGN_ROLE (RoleGroupID, RoleID, IsDeleted) VALUES ('RG04', 'RL12', 0)
SELECT 1 FROM DUAL;

-- BẢNG GÁN TÀI KHOẢN VỚI NHÓM QUYỀN (ACCOUNT_ASSIGN_ROLE_GROUP)
INSERT ALL
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC01', 'RG01', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC02', 'RG02', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC03', 'RG02', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC04', 'RG03', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC05', 'RG03', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC06', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC07', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC08', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC09', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC10', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC11', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC12', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC13', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC14', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC15', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC16', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC17', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC18', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC19', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC20', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC21', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC22', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC23', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC24', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC25', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC26', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC27', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC28', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC29', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC30', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC31', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC32', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC33', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC34', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC35', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC36', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC37', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC38', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC39', 'RG04', 0)
    INTO ACCOUNT_ASSIGN_ROLE_GROUP (AccountID, RoleGroupID, IsDeleted) VALUES ('ACC40', 'RG04', 0)
SELECT 1 FROM DUAL;

COMMIT;