CREATE TABLE AIRLINE (
    AirlineID NUMBER PRIMARY KEY,
    AirlineName VARCHAR2(100) NOT NULL,
    Country VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(20),
    Email VARCHAR2(100) UNIQUE
);

CREATE TABLE AIRPORT (
    AirportID NUMBER PRIMARY KEY,
    AirportName VARCHAR2(150) NOT NULL,
    City VARCHAR2(100) NOT NULL,
    Country VARCHAR2(100) NOT NULL,
    IATACode CHAR(3) UNIQUE
);

CREATE TABLE AIRCRAFT (
    AircraftID NUMBER PRIMARY KEY,
    AirlineID NUMBER,
    Model VARCHAR2(100) NOT NULL,
    Capacity NUMBER CHECK (Capacity > 0),
    ManufactureYear NUMBER,
    CONSTRAINT fk_aircraft_airline 
        FOREIGN KEY (AirlineID) REFERENCES AIRLINE(AirlineID)
);

CREATE TABLE ROUTE (
    RouteID NUMBER PRIMARY KEY,
    DepartureAirportID NUMBER,
    ArrivalAirportID NUMBER,
    Distance NUMBER,
    EstimatedTime NUMBER,
    CONSTRAINT fk_route_dep FOREIGN KEY (DepartureAirportID) REFERENCES AIRPORT(AirportID),
    CONSTRAINT fk_route_arr FOREIGN KEY (ArrivalAirportID) REFERENCES AIRPORT(AirportID),
    CONSTRAINT chk_route_diff CHECK (DepartureAirportID <> ArrivalAirportID)
);

CREATE TABLE FLIGHT (
    FlightID NUMBER PRIMARY KEY,
    FlightNumber VARCHAR2(50) UNIQUE,
    AirlineID NUMBER,
    AircraftID NUMBER,
    DepartureAirportID NUMBER,
    ArrivalAirportID NUMBER,
    RouteID NUMBER,
    DepartureTime DATE NOT NULL,
    ArrivalTime DATE,
    FlightStatus VARCHAR2(50),
    CONSTRAINT fk_flight_airline FOREIGN KEY (AirlineID) REFERENCES AIRLINE(AirlineID),
    CONSTRAINT fk_flight_aircraft FOREIGN KEY (AircraftID) REFERENCES AIRCRAFT(AircraftID),
    CONSTRAINT fk_flight_dep FOREIGN KEY (DepartureAirportID) REFERENCES AIRPORT(AirportID),
    CONSTRAINT fk_flight_arr FOREIGN KEY (ArrivalAirportID) REFERENCES AIRPORT(AirportID),
    CONSTRAINT fk_flight_route FOREIGN KEY (RouteID) REFERENCES ROUTE(RouteID),
    CONSTRAINT chk_flight_time CHECK (ArrivalTime > DepartureTime),
    CONSTRAINT chk_flight_airport CHECK (DepartureAirportID <> ArrivalAirportID)
);

CREATE TABLE USERS (
    UserID NUMBER PRIMARY KEY,
    FullName VARCHAR2(150) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Created_At DATE DEFAULT SYSDATE,
    Updated_At DATE DEFAULT SYSDATE,
    IsDeleted NUMBER CHECK (IsDeleted IN (0,1))
);

CREATE TABLE ACCOUNT (
    AccountID NUMBER PRIMARY KEY,
    UserID NUMBER,
    UserName VARCHAR2(100) UNIQUE NOT NULL,
    Password VARCHAR2(200) NOT NULL,
    Status VARCHAR2(50),
    Created_At DATE DEFAULT SYSDATE,
    Updated_At DATE DEFAULT SYSDATE,
    IsDeleted NUMBER CHECK (IsDeleted IN (0,1)),
    CONSTRAINT fk_account_user FOREIGN KEY (UserID) REFERENCES USERS(UserID)
);

CREATE TABLE CUSTOMER (
    CustomerID NUMBER PRIMARY KEY,
    AccountID NUMBER UNIQUE,
    FullName VARCHAR2(150) NOT NULL,
    Gender VARCHAR2(10),
    DateOfBirth DATE,
    Phone VARCHAR2(20),
    Email VARCHAR2(100) UNIQUE,
    PassportNumber VARCHAR2(50) UNIQUE,
    Nationality VARCHAR2(50),
    CONSTRAINT fk_customer_account FOREIGN KEY (AccountID) REFERENCES ACCOUNT(AccountID)
);

CREATE TABLE EMPLOYEE (
    EmployeeID NUMBER PRIMARY KEY,
    AccountID NUMBER UNIQUE,
    FullName VARCHAR2(150) NOT NULL,
    Position VARCHAR2(100),
    Phone VARCHAR2(20),
    Email VARCHAR2(100) UNIQUE,
    CONSTRAINT fk_employee_account FOREIGN KEY (AccountID) REFERENCES ACCOUNT(AccountID)
);

CREATE TABLE SEAT (
    SeatID NUMBER PRIMARY KEY,
    AircraftID NUMBER,
    SeatNumber VARCHAR2(10) NOT NULL,
    Class VARCHAR2(20),
    CONSTRAINT fk_seat_aircraft FOREIGN KEY (AircraftID) REFERENCES AIRCRAFT(AircraftID),
    CONSTRAINT uq_seat UNIQUE (AircraftID, SeatNumber)
);

CREATE TABLE BOOKING (
    BookingID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    EmployeeID NUMBER,
    BookingDate DATE NOT NULL,
    TotalAmount NUMBER CHECK (TotalAmount >= 0),
    Status VARCHAR2(50),
    CONSTRAINT fk_booking_customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT fk_booking_employee FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
);

CREATE TABLE TICKET (
    TicketID NUMBER PRIMARY KEY,
    BookingID NUMBER,
    FlightID NUMBER,
    SeatID NUMBER,
    Price NUMBER CHECK (Price > 0),
    TicketStatus VARCHAR2(50),
    CONSTRAINT fk_ticket_booking FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID),
    CONSTRAINT fk_ticket_flight FOREIGN KEY (FlightID) REFERENCES FLIGHT(FlightID),
    CONSTRAINT fk_ticket_seat FOREIGN KEY (SeatID) REFERENCES SEAT(SeatID),
    CONSTRAINT uq_ticket_seat UNIQUE (FlightID, SeatID)
);

CREATE TABLE PAYMENT (
    PaymentID NUMBER PRIMARY KEY,
    BookingID NUMBER,
    PaymentDate DATE NOT NULL,
    Amount NUMBER CHECK (Amount > 0),
    PaymentMethod VARCHAR2(50),
    PaymentStatus VARCHAR2(50),
    CONSTRAINT fk_payment_booking FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID)
);

CREATE TABLE BAGGAGE (
    BaggageID NUMBER PRIMARY KEY,
    TicketID NUMBER,
    Weight NUMBER CHECK (Weight >= 0),
    BaggageType VARCHAR2(50),
    CONSTRAINT fk_baggage_ticket FOREIGN KEY (TicketID) REFERENCES TICKET(TicketID)
);

CREATE TABLE TRANSACTION_HISTORY (
    TransactionID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    BookingID NUMBER,
    PaymentID NUMBER,
    TransactionType VARCHAR2(50),
    Amount NUMBER CHECK (Amount >= 0),
    TransactionDate DATE NOT NULL,
    Description VARCHAR2(255),
    CONSTRAINT fk_th_customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT fk_th_booking FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID),
    CONSTRAINT fk_th_payment FOREIGN KEY (PaymentID) REFERENCES PAYMENT(PaymentID)
);

CREATE TABLE SEATCLASSPRICE (
    PriceID NUMBER PRIMARY KEY,
    FlightID NUMBER,
    Class VARCHAR2(20),
    Price NUMBER CHECK (Price >= 0),
    CONSTRAINT fk_price_flight FOREIGN KEY (FlightID) REFERENCES FLIGHT(FlightID)
);

CREATE TABLE FUNCTION (
    FunctionID NUMBER PRIMARY KEY,
    NameFunction VARCHAR2(100) NOT NULL,
    Created_At DATE DEFAULT SYSDATE,
    Updated_At DATE DEFAULT SYSDATE,
    IsDeleted NUMBER CHECK (IsDeleted IN (0,1))
);

CREATE TABLE ROLE (
    RoleID NUMBER PRIMARY KEY,
    FunctionID NUMBER,
    AddPerm NUMBER CHECK (AddPerm IN (0,1)),
    EditPerm NUMBER CHECK (EditPerm IN (0,1)),
    DeletePerm NUMBER CHECK (DeletePerm IN (0,1)),
    DownloadPerm NUMBER CHECK (DownloadPerm IN (0,1)),
    ViewPerm NUMBER CHECK (ViewPerm IN (0,1)),
    Created_At DATE DEFAULT SYSDATE,
    Updated_At DATE DEFAULT SYSDATE,
    IsDeleted NUMBER CHECK (IsDeleted IN (0,1)),
    CONSTRAINT fk_role_function FOREIGN KEY (FunctionID) REFERENCES FUNCTION(FunctionID)
);

CREATE TABLE ROLE_GROUP (
    RoleGroupID NUMBER PRIMARY KEY,
    NameRoleGroup VARCHAR2(100) NOT NULL,
    Created_At DATE DEFAULT SYSDATE,
    Updated_At DATE DEFAULT SYSDATE,
    IsDeleted NUMBER CHECK (IsDeleted IN (0,1))
);

CREATE TABLE ROLE_GROUP_ASSIGN_ROLE (
    RoleGroupID NUMBER,
    RoleID NUMBER,
    Created_At DATE DEFAULT SYSDATE,
    Updated_At DATE DEFAULT SYSDATE,
    IsDeleted NUMBER CHECK (IsDeleted IN (0,1)),
    PRIMARY KEY (RoleGroupID, RoleID),
    FOREIGN KEY (RoleGroupID) REFERENCES ROLE_GROUP(RoleGroupID),
    FOREIGN KEY (RoleID) REFERENCES ROLE(RoleID)
);

CREATE TABLE ACCOUNT_ASSIGN_ROLE_GROUP (
    AccountID NUMBER,
    RoleGroupID NUMBER,
    Created_At DATE DEFAULT SYSDATE,
    Updated_At DATE DEFAULT SYSDATE,
    IsDeleted NUMBER CHECK (IsDeleted IN (0,1)),
    PRIMARY KEY (AccountID, RoleGroupID),
    FOREIGN KEY (AccountID) REFERENCES ACCOUNT(AccountID),
    FOREIGN KEY (RoleGroupID) REFERENCES ROLE_GROUP(RoleGroupID)
);

CREATE TABLE ACCOUNT_ASSIGN_ROLE (
    AccountID NUMBER,
    RoleID NUMBER,
    Created_At DATE DEFAULT SYSDATE,
    Updated_At DATE DEFAULT SYSDATE,
    IsDeleted NUMBER CHECK (IsDeleted IN (0,1)),
    PRIMARY KEY (AccountID, RoleID),
    FOREIGN KEY (AccountID) REFERENCES ACCOUNT(AccountID),
    FOREIGN KEY (RoleID) REFERENCES ROLE(RoleID)
);