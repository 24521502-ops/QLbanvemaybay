--1. Lấy số ghế trống theo hạng 
CREATE OR REPLACE FUNCTION FUNC_GET_AVAILABLE_SEATS (p_FlightID IN NUMBER, p_Class IN VARCHAR2) RETURN NUMBER AS
    v_TotalSeats NUMBER; v_BookedSeats NUMBER; v_AircraftID NUMBER;
BEGIN
    SELECT AircraftID INTO v_AircraftID FROM FLIGHT WHERE FlightID = p_FlightID;
    SELECT COUNT(*) INTO v_TotalSeats FROM SEAT WHERE AircraftID = v_AircraftID AND Class = p_Class;
    SELECT COUNT(*) INTO v_BookedSeats FROM TICKET t JOIN SEAT s ON t.SeatID = s.SeatID
    WHERE t.FlightID = p_FlightID AND s.Class = p_Class AND t.TicketStatus != 'CANCELLED';

    RETURN v_TotalSeats - v_BookedSeats;
END;


--2.Tính giá vé động
CREATE OR REPLACE FUNCTION FUNC_GET_DYNAMIC_PRICE (p_FlightID IN NUMBER, p_Class IN VARCHAR2) RETURN NUMBER AS
    v_BasePrice NUMBER; v_DepartureTime DATE; v_DaysDifference NUMBER;
BEGIN
    SELECT Price INTO v_BasePrice FROM SEATCLASSPRICE WHERE FlightID = p_FlightID AND Class = p_Class;
    SELECT DepartureTime INTO v_DepartureTime FROM FLIGHT WHERE FlightID = p_FlightID;
    
    v_DaysDifference := v_DepartureTime - SYSDATE;
    IF v_DaysDifference >= 30 THEN RETURN v_BasePrice * 0.9;
    ELSIF v_DaysDifference <= 3 THEN RETURN v_BasePrice * 1.2;
    ELSE RETURN v_BasePrice; END IF;
END;


--3. Tính tỷ lệ lấp đầy 
CREATE OR REPLACE FUNCTION FUNC_GET_OCCUPANCY_RATE (p_FlightID IN NUMBER) RETURN NUMBER AS
    v_Capacity NUMBER; v_Booked NUMBER;
BEGIN
    SELECT a.Capacity INTO v_Capacity FROM FLIGHT f JOIN AIRCRAFT a ON f.AircraftID = a.AircraftID WHERE f.FlightID = p_FlightID;
    SELECT COUNT(*) INTO v_Booked FROM TICKET WHERE FlightID = p_FlightID AND TicketStatus IN ('BOOKED', 'PAID');

    IF v_Capacity = 0 THEN RETURN 0; END IF;
    RETURN ROUND((v_Booked / v_Capacity) * 100, 2);
END;


--4. Tính phí hoàn tiền khi hủy
CREATE OR REPLACE FUNCTION FUNC_CALCULATE_REFUND (p_TicketID IN NUMBER) RETURN NUMBER AS
    v_Price NUMBER; v_DepartureTime DATE; v_HoursDiff NUMBER; v_RefundAmount NUMBER;
BEGIN
    SELECT t.Price, f.DepartureTime INTO v_Price, v_DepartureTime
    FROM TICKET t JOIN FLIGHT f ON t.FlightID = f.FlightID
    WHERE t.TicketID = p_TicketID AND t.TicketStatus != 'CANCELLED';

    v_HoursDiff := (v_DepartureTime - SYSDATE) * 24;
    IF v_HoursDiff > 72 THEN v_RefundAmount := v_Price * 0.9;
    ELSIF v_HoursDiff > 24 THEN v_RefundAmount := v_Price * 0.5;
    ELSE v_RefundAmount := 0; END IF;

    RETURN v_RefundAmount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN 0;
END;


--5. Tạo mã vé PNR tự động 
CREATE OR REPLACE FUNCTION FUNC_GENERATE_TICKET_CODE (p_FlightID IN NUMBER, p_SeatID IN NUMBER) RETURN VARCHAR2 AS
    v_FlightNum VARCHAR2(50); v_SeatNum VARCHAR2(10);
BEGIN
    SELECT FlightNumber INTO v_FlightNum FROM FLIGHT WHERE FlightID = p_FlightID;
    SELECT SeatNumber INTO v_SeatNum FROM SEAT WHERE SeatID = p_SeatID;
    
    RETURN v_FlightNum || '-' || v_SeatNum || '-' || TO_CHAR(SYSDATE, 'MMDD');
END;


--6. Kiểm tra điều kiện Check-in 
CREATE OR REPLACE FUNCTION FUNC_CHECK_VALID_CHECKIN (p_TicketID IN NUMBER) RETURN VARCHAR2 AS
    v_TicketStatus VARCHAR2(50); v_DepartureTime DATE; v_HoursToFlight NUMBER;
BEGIN
    SELECT t.TicketStatus, f.DepartureTime INTO v_TicketStatus, v_DepartureTime
    FROM TICKET t JOIN FLIGHT f ON t.FlightID = f.FlightID WHERE t.TicketID = p_TicketID;

    IF v_TicketStatus != 'PAID' THEN RETURN 'TỪ CHỐI: Vé chưa thanh toán/hủy.'; END IF;

    v_HoursToFlight := (v_DepartureTime - SYSDATE) * 24;
    IF v_HoursToFlight < 0 THEN RETURN 'TỪ CHỐI: Chuyến bay đã cất cánh.';
    ELSIF v_HoursToFlight > 24 THEN RETURN 'TỪ CHỐI: Chỉ mở check-in trước 24h.';
    ELSE RETURN 'HỢP LỆ: Đủ điều kiện check-in.'; END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN 'LỖI: Vé không tồn tại.';
END;

--Function tính "Giờ Lên Máy Bay" để in vé (Page 14)
CREATE OR REPLACE FUNCTION FUNC_CALCULATE_BOARDING_TIME (p_FlightID IN NUMBER) 
RETURN DATE AS
    v_DepartureTime DATE;
    v_BoardingTime DATE;
BEGIN
    -- Lấy giờ khởi hành
    SELECT DepartureTime INTO v_DepartureTime 
    FROM FLIGHT 
    WHERE FlightID = p_FlightID;
    
    -- Trừ đi 40 phút (trong Oracle: 1 ngày = 24h * 60p = 1440 phút)
    v_BoardingTime := v_DepartureTime - (40 / 1440);
    
    RETURN v_BoardingTime;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/
