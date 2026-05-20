-- ==========================================
-- FILE CHỨA CÁC STORED PROCEDURE & FUNCTION ĐÃ CHUYỂN ĐỔI
-- Hệ thống: Quản lý Bán vé máy bay (QLBVMB)
-- ==========================================

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
