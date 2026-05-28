-- 1. Lấy số ghế trống theo hạng 
CREATE OR REPLACE FUNCTION FUNC_GET_AVAILABLE_SEATS (p_FlightID IN VARCHAR2, p_Class IN VARCHAR2) RETURN NUMBER AS
    v_TotalSeats NUMBER; v_BookedSeats NUMBER; v_AircraftID VARCHAR2(20);
BEGIN
    SELECT AircraftID INTO v_AircraftID FROM FLIGHT WHERE FlightID = p_FlightID;
    SELECT COUNT(*) INTO v_TotalSeats FROM SEAT WHERE AircraftID = v_AircraftID AND Class = p_Class;
    SELECT COUNT(*) INTO v_BookedSeats FROM TICKET t JOIN SEAT s ON t.SeatID = s.SeatID
    WHERE t.FlightID = p_FlightID AND s.Class = p_Class AND t.TicketStatus != 'CANCELLED';

    RETURN v_TotalSeats - v_BookedSeats;
END;
/

-- 2. Tính giá vé động
CREATE OR REPLACE FUNCTION FUNC_GET_DYNAMIC_PRICE (p_FlightID IN VARCHAR2, p_Class IN VARCHAR2) RETURN NUMBER AS
    v_BasePrice NUMBER; v_DepartureTime DATE; v_DaysDifference NUMBER;
BEGIN
    SELECT Price INTO v_BasePrice FROM SEATCLASSPRICE WHERE FlightID = p_FlightID AND Class = p_Class;
    SELECT DepartureTime INTO v_DepartureTime FROM FLIGHT WHERE FlightID = p_FlightID;
    
    v_DaysDifference := v_DepartureTime - SYSDATE;
    IF v_DaysDifference >= 30 THEN RETURN v_BasePrice * 0.9;
    ELSIF v_DaysDifference <= 3 THEN RETURN v_BasePrice * 1.2;
    ELSE RETURN v_BasePrice; END IF;
END;
/

-- 3. Tính tỷ lệ lấp đầy 
CREATE OR REPLACE FUNCTION FUNC_GET_OCCUPANCY_RATE (p_FlightID IN VARCHAR2) RETURN NUMBER AS
    v_Capacity NUMBER; v_Booked NUMBER;
BEGIN
    SELECT a.Capacity INTO v_Capacity FROM FLIGHT f JOIN AIRCRAFT a ON f.AircraftID = a.AircraftID WHERE f.FlightID = p_FlightID;
    SELECT COUNT(*) INTO v_Booked FROM TICKET WHERE FlightID = p_FlightID AND TicketStatus IN ('BOOKED', 'PAID');

    IF v_Capacity = 0 THEN RETURN 0; END IF;
    RETURN ROUND((v_Booked / v_Capacity) * 100, 2);
END;
/

-- 4. Tính phí hoàn tiền khi hủy
CREATE OR REPLACE FUNCTION FUNC_CALCULATE_REFUND (p_TicketID IN VARCHAR2) RETURN NUMBER AS
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
/

-- 7. Function tính "Giờ Lên Máy Bay" để in vé (Page 14)
CREATE OR REPLACE FUNCTION FUNC_CALCULATE_BOARDING_TIME (p_FlightID IN VARCHAR2) 
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

-- =========================================================================
-- PHẦN 1: FUNCTIONS LIÊN QUAN (TÍNH TOÁN GHẾ TRỐNG VÀ GIÁ ĐỘNG)/ wang
-- =========================================================================

-- 3. HÀM TÍNH THỜI GIAN GIỮ CHỖ CÒN LẠI (GIỚI HẠN 20 PHÚT)
CREATE OR REPLACE FUNCTION FN_GET_REMAINING_PAYMENT_SEC (
    p_booking_id IN VARCHAR2
) RETURN NUMBER AS
    v_elapsed_sec NUMBER;
    v_remaining_sec NUMBER := 0;
BEGIN
    SELECT ROUND((SYSDATE - BookingDate) * 86400)
    INTO v_elapsed_sec
    FROM BOOKING
    WHERE BookingID = p_booking_id AND Status = 'PENDING';
    
    v_remaining_sec := 1200 - v_elapsed_sec;
    IF v_remaining_sec < 0 THEN
        v_remaining_sec := 0;
    END IF;
    
    RETURN v_remaining_sec;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN 0;
END FN_GET_REMAINING_PAYMENT_SEC;
/

-- 4. HÀM LẤY TÊN THÀNH PHỐ THEO MÃ SÂN BAY IATA
CREATE OR REPLACE FUNCTION FN_GET_CITY_BY_IATA (
    p_iata_code IN VARCHAR2
) RETURN VARCHAR2 AS
    v_city VARCHAR2(100);
BEGIN
    SELECT City
    INTO v_city
    FROM AIRPORT
    WHERE IATACode = p_iata_code;
    
    RETURN v_city;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN p_iata_code;
    WHEN OTHERS THEN
        RETURN p_iata_code;
END FN_GET_CITY_BY_IATA;
/
