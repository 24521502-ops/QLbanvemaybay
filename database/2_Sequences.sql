-- Tự động sinh ID dựa vào MAX(ID) có trong bảng

CREATE OR REPLACE TRIGGER TRG_AIRLINE_ID 
BEFORE INSERT ON AIRLINE FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.AirlineID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(AirlineID, '\d+'))), 0) INTO v_max FROM AIRLINE;
    IF v_max + 1 < 10 THEN 
      :NEW.AirlineID := 'AL0' || (v_max + 1); 
    ELSE 
      :NEW.AirlineID := 'AL' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_AIRPORT_ID 
BEFORE INSERT ON AIRPORT FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.AirportID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(AirportID, '\d+'))), 0) INTO v_max FROM AIRPORT;
    IF v_max + 1 < 10 THEN 
      :NEW.AirportID := 'AP0' || (v_max + 1); 
    ELSE 
      :NEW.AirportID := 'AP' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_AIRCRAFT_ID 
BEFORE INSERT ON AIRCRAFT FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.AircraftID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(AircraftID, '\d+'))), 0) INTO v_max FROM AIRCRAFT;
    IF v_max + 1 < 10 THEN 
      :NEW.AircraftID := 'AC0' || (v_max + 1); 
    ELSE 
      :NEW.AircraftID := 'AC' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_ROUTE_ID 
BEFORE INSERT ON ROUTE FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.RouteID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(RouteID, '\d+'))), 0) INTO v_max FROM ROUTE;
    IF v_max + 1 < 10 THEN 
      :NEW.RouteID := 'RT0' || (v_max + 1); 
    ELSE 
      :NEW.RouteID := 'RT' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_FLIGHT_ID 
BEFORE INSERT ON FLIGHT FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.FlightID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(FlightID, '\d+'))), 0) INTO v_max FROM FLIGHT;
    IF v_max + 1 < 10 THEN 
      :NEW.FlightID := 'FL0' || (v_max + 1); 
    ELSE 
      :NEW.FlightID := 'FL' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_USERS_ID 
BEFORE INSERT ON USERS FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.UserID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(UserID, '\d+'))), 0) INTO v_max FROM USERS;
    IF v_max + 1 < 10 THEN 
      :NEW.UserID := 'US0' || (v_max + 1); 
    ELSE 
      :NEW.UserID := 'US' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_ACCOUNT_ID 
BEFORE INSERT ON ACCOUNT FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.AccountID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(AccountID, '\d+'))), 0) INTO v_max FROM ACCOUNT;
    IF v_max + 1 < 10 THEN 
      :NEW.AccountID := 'ACC0' || (v_max + 1); 
    ELSE 
      :NEW.AccountID := 'ACC' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_CUSTOMER_ID 
BEFORE INSERT ON CUSTOMER FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.CustomerID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(CustomerID, '\d+'))), 0) INTO v_max FROM CUSTOMER;
    IF v_max + 1 < 10 THEN 
      :NEW.CustomerID := 'CUS0' || (v_max + 1); 
    ELSE 
      :NEW.CustomerID := 'CUS' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_EMPLOYEE_ID 
BEFORE INSERT ON EMPLOYEE FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.EmployeeID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(EmployeeID, '\d+'))), 0) INTO v_max FROM EMPLOYEE;
    IF v_max + 1 < 10 THEN 
      :NEW.EmployeeID := 'EMP0' || (v_max + 1); 
    ELSE 
      :NEW.EmployeeID := 'EMP' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_SEAT_ID 
BEFORE INSERT ON SEAT FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.SeatID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(SeatID, '\d+'))), 0) INTO v_max FROM SEAT;
    IF v_max + 1 < 10 THEN 
      :NEW.SeatID := 'ST0' || (v_max + 1); 
    ELSE 
      :NEW.SeatID := 'ST' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_BOOKING_ID 
BEFORE INSERT ON BOOKING FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.BookingID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(BookingID, '\d+'))), 0) INTO v_max FROM BOOKING;
    IF v_max + 1 < 10 THEN 
      :NEW.BookingID := 'BK0' || (v_max + 1); 
    ELSE 
      :NEW.BookingID := 'BK' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_TICKET_ID 
BEFORE INSERT ON TICKET FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.TicketID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(TicketID, '\d+'))), 0) INTO v_max FROM TICKET;
    IF v_max + 1 < 10 THEN 
      :NEW.TicketID := 'TK0' || (v_max + 1); 
    ELSE 
      :NEW.TicketID := 'TK' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_PAYMENT_ID 
BEFORE INSERT ON PAYMENT FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.PaymentID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(PaymentID, '\d+'))), 0) INTO v_max FROM PAYMENT;
    IF v_max + 1 < 10 THEN 
      :NEW.PaymentID := 'PM0' || (v_max + 1); 
    ELSE 
      :NEW.PaymentID := 'PM' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_BAGGAGE_ID 
BEFORE INSERT ON BAGGAGE FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.BaggageID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(BaggageID, '\d+'))), 0) INTO v_max FROM BAGGAGE;
    IF v_max + 1 < 10 THEN 
      :NEW.BaggageID := 'BG0' || (v_max + 1); 
    ELSE 
      :NEW.BaggageID := 'BG' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_TRANSACTION_HISTORY_ID 
BEFORE INSERT ON TRANSACTION_HISTORY FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.TransactionID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(TransactionID, '\d+'))), 0) INTO v_max FROM TRANSACTION_HISTORY;
    IF v_max + 1 < 10 THEN 
      :NEW.TransactionID := 'TH0' || (v_max + 1); 
    ELSE 
      :NEW.TransactionID := 'TH' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_SEATCLASSPRICE_ID 
BEFORE INSERT ON SEATCLASSPRICE FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.PriceID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(PriceID, '\d+'))), 0) INTO v_max FROM SEATCLASSPRICE;
    IF v_max + 1 < 10 THEN 
      :NEW.PriceID := 'SCP0' || (v_max + 1); 
    ELSE 
      :NEW.PriceID := 'SCP' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_FUNCTION_ID 
BEFORE INSERT ON "FUNCTION" FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.FunctionID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(FunctionID, '\d+'))), 0) INTO v_max FROM "FUNCTION";
    IF v_max + 1 < 10 THEN 
      :NEW.FunctionID := 'FN0' || (v_max + 1); 
    ELSE 
      :NEW.FunctionID := 'FN' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_ROLE_ID 
BEFORE INSERT ON ROLE FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.RoleID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(RoleID, '\d+'))), 0) INTO v_max FROM ROLE;
    IF v_max + 1 < 10 THEN 
      :NEW.RoleID := 'RL0' || (v_max + 1); 
    ELSE 
      :NEW.RoleID := 'RL' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_ROLE_GROUP_ID 
BEFORE INSERT ON ROLE_GROUP FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.RoleGroupID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(RoleGroupID, '\d+'))), 0) INTO v_max FROM ROLE_GROUP;
    IF v_max + 1 < 10 THEN 
      :NEW.RoleGroupID := 'RG0' || (v_max + 1); 
    ELSE 
      :NEW.RoleGroupID := 'RG' || (v_max + 1); 
    END IF;
  END IF; 
END;
/

CREATE OR REPLACE TRIGGER TRG_PASSENGER_ID 
BEFORE INSERT ON PASSENGER FOR EACH ROW 
DECLARE v_max NUMBER;
BEGIN 
  IF :NEW.PassengerID IS NULL THEN 
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(PassengerID, '\d+'))), 0) INTO v_max FROM PASSENGER;
    IF v_max + 1 < 10 THEN 
      :NEW.PassengerID := 'PA0' || (v_max + 1); 
    ELSE 
      :NEW.PassengerID := 'PA' || (v_max + 1); 
    END IF;
  END IF; 
END;
/