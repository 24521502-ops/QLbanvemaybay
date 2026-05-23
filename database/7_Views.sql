-- =========================================================
--            TẠO VIEW HIỂN THỊ GIAO DIỆN
-- =========================================================

CREATE OR REPLACE VIEW VW_FLIGHT_LIST AS
SELECT 
    f.FlightID,
    f.FlightNumber,
    dep.IATACode || ' -> ' || arr.IATACode AS Route_IATA,
    f.DepartureTime,
    f.ArrivalTime,
    a.Model AS AircraftModel,
    f.Gate,
    f.FlightStatus,
    (
        SELECT '<html><div style="font-family: Arial; font-size: 10px;">' || 
               LISTAGG(
                   '<b>' ||
                   CASE Class 
                       WHEN 'First Class' THEN 'First'
                       WHEN 'Business' THEN 'Bus'
                       WHEN 'Premium Economy' THEN 'Prem'
                       WHEN 'Economy' THEN 'Eco'
                   END || ':</b> <font color="blue">' || TO_CHAR(Price, 'FM999,999,999,999') || 'đ</font>', 
                   '<br>'
               ) WITHIN GROUP (ORDER BY 
                   CASE Class 
                       WHEN 'First Class' THEN 1
                       WHEN 'Business' THEN 2
                       WHEN 'Premium Economy' THEN 3
                       WHEN 'Economy' THEN 4
                   END
               ) || '</div></html>'
        FROM SEATCLASSPRICE 
        WHERE FlightID = f.FlightID
    ) AS PricesHTML
FROM FLIGHT f
JOIN ROUTE r ON f.RouteID = r.RouteID
JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID
JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID
JOIN AIRCRAFT a ON f.AircraftID = a.AircraftID;
/


-- ======================================================
--VIEW cho bảng báo cáo thống kê (dashboard/admin) / wuỳn
--=====================================================

--1. View cho 4 thẻ thống kê tổng quan (Top Cards)
CREATE OR REPLACE VIEW VIEW_DASHBOARD_SUMMARY AS
SELECT 
    NVL(b.Total_Revenue, 0) AS Total_Revenue,
    NVL(b.Total_Bookings, 0) AS Total_Bookings,
    NVL(f.Completed_Flights, 0) AS Completed_Flights,
    NVL(o.Global_Occupancy_Rate, 0) AS Global_Occupancy_Rate
FROM 
    (SELECT SUM(TotalAmount) AS Total_Revenue,
            COUNT(*) AS Total_Bookings
     FROM BOOKING
     WHERE Status IN ('CONFIRMED', 'COMPLETED')) b,

    (SELECT COUNT(*) AS Completed_Flights
     FROM FLIGHT
     WHERE DepartureTime <= SYSDATE) f,

    (SELECT 
         ROUND(
             COUNT(t.TicketID) * 100.0 /
             NULLIF(SUM(a.Capacity), 0),
         2) AS Global_Occupancy_Rate
     FROM TICKET t
     JOIN FLIGHT fl ON t.FlightID = fl.FlightID
     JOIN AIRCRAFT a ON fl.AircraftID = a.AircraftID
     WHERE t.TicketStatus != 'CANCELLED') o;
/

--2. View cho biểu đồ cột: Doanh thu theo tháng
CREATE OR REPLACE VIEW VIEW_REVENUE_BY_MONTH AS
SELECT 
    TO_CHAR(BookingDate, 'YYYY-MM') AS Month_Year,
    SUM(TotalAmount) AS Monthly_Revenue
FROM BOOKING
WHERE Status IN ('CONFIRMED', 'COMPLETED')
GROUP BY TO_CHAR(BookingDate, 'YYYY-MM');
/

--3. View cho biểu đồ tròn: Tỉ lệ trạng thái vé
CREATE OR REPLACE VIEW VIEW_BOOKING_STATUS_STATS AS
SELECT 
    Status, 
    COUNT(*) AS Quantity,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM BOOKING), 2) AS Percentage
FROM BOOKING
GROUP BY Status;
/

--4. View: Thống kê doanh thu theo hạng ghế
CREATE OR REPLACE VIEW VIEW_REVENUE_BY_CLASS AS
SELECT 
    s.Class AS Seat_Class,
    SUM(t.Price) AS Total_Revenue,
    COUNT(t.TicketID) AS Ticket_Count,
    ROUND(SUM(t.Price) * 100 / (SELECT SUM(Price) FROM TICKET WHERE TicketStatus != 'CANCELLED'), 2) AS Revenue_Percentage
FROM TICKET t
JOIN SEAT s ON t.SeatID = s.SeatID
WHERE t.TicketStatus != 'CANCELLED' -- Chỉ tính các vé không bị hủy
GROUP BY s.Class;
/


-- =========================================================================
-- PHẦN 2: VIEWS TRUY VẤN MỚI (ĐƯỢC GỌI TRỰC TIẾP TỪ JAVA) / wang
-- =========================================================================

-- 1. VIEW_FLIGHT_SEAT_STATUS (Sử dụng trong SeatDAO.java)
CREATE OR REPLACE VIEW VIEW_FLIGHT_SEAT_STATUS AS
SELECT f.FlightID, s.SeatID, s.SeatNumber, s.Class,
       CASE WHEN t.TicketID IS NOT NULL AND (
           t.TicketStatus IN ('PAID', 'CHECKED-IN') OR 
           (t.TicketStatus = 'BOOKED' AND b.BookingDate >= SYSDATE - (20/(24*60)))
       ) THEN 1 ELSE 0 END as IsBooked
FROM SEAT s 
JOIN FLIGHT f ON s.AircraftID = f.AircraftID 
LEFT JOIN TICKET t ON s.SeatID = t.SeatID AND t.FlightID = f.FlightID AND t.TicketStatus != 'CANCELLED' 
LEFT JOIN BOOKING b ON t.BookingID = b.BookingID;
/

-- 2. VIEW_FLIGHT_SEARCH (Sử dụng trong FlightDAO.java - tìm kiếm chuyến bay)
CREATE OR REPLACE VIEW VIEW_FLIGHT_SEARCH AS
SELECT 
    f.FlightID, 
    al.AirlineName, 
    a.Model AS AircraftModel, 
    dep.IATACode AS DepCode, 
    arr.IATACode AS ArrCode,
    f.DepartureTime, 
    f.ArrivalTime,
    scp.Class as ClassName,
    FUNC_GET_DYNAMIC_PRICE(f.FlightID, scp.Class) as Price,
    FUNC_GET_AVAILABLE_SEATS(f.FlightID, scp.Class) as Seats
FROM FLIGHT f
JOIN AIRLINE al ON f.AirlineID = al.AirlineID
JOIN AIRCRAFT a ON f.AircraftID = a.AircraftID
JOIN ROUTE r ON f.RouteID = r.RouteID
JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID
JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID
JOIN SEATCLASSPRICE scp ON f.FlightID = scp.FlightID;
/

-- 3. VIEW_FLIGHT_MIN_PRICES (Sử dụng trong FlightDAO.java - lấy giá rẻ nhất tuần)
CREATE OR REPLACE VIEW VIEW_FLIGHT_MIN_PRICES AS
SELECT 
    f.FlightID,
    dep.IATACode AS DepCode,
    arr.IATACode AS ArrCode,
    f.DepartureTime,
    p.Class,
    FUNC_GET_DYNAMIC_PRICE(f.FlightID, p.Class) AS Price
FROM FLIGHT f
JOIN ROUTE r ON f.RouteID = r.RouteID
JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID
JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID
JOIN SEATCLASSPRICE p ON f.FlightID = p.FlightID;
/
