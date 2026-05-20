-- =========================================================
-- FILE 8: KỊCH BẢN THÊM CHUYẾN BAY MẪU DUNG LƯỢNG LỚN ĐỂ TEST (MAY 2026)
-- Hãng: Vietnam Airlines (AL01)
-- Hành trình: HAN <-> SGN (RT01, RT02)
-- Máy bay: Boeing 787-9 Test Max (AC_TEST) - 60 Ghế (12 Thương gia, 48 Phổ thông)
-- Ngày bay: 30/05/2026 & 31/05/2026
-- =========================================================

-- 1. Dọn dẹp vé và giá vé cũ cho các chuyến bay test
DELETE FROM TICKET WHERE FlightID IN ('FL_T01', 'FL_T02');
DELETE FROM SEATCLASSPRICE WHERE FlightID IN ('FL_T01', 'FL_T02');
DELETE FROM FLIGHT WHERE FlightID IN ('FL_T01', 'FL_T02');

-- 2. Đảm bảo máy bay AC_TEST tồn tại
DECLARE
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cnt FROM AIRCRAFT WHERE AircraftID = 'AC_TEST';
    IF v_cnt = 0 THEN
        INSERT INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear)
        VALUES ('AC_TEST', 'AL01', 'Boeing 787-9 Test Max', 60, 2024);
    END IF;
END;
/

-- 3. Đảm bảo 60 ghế tồn tại cho AC_TEST (12 Thương gia, 48 Phổ thông)
DECLARE
    v_cnt NUMBER;
    v_SeatID VARCHAR2(20);
    v_SeatNumber VARCHAR2(10);
    v_Idx NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cnt FROM SEAT WHERE AircraftID = 'AC_TEST';
    IF v_cnt = 0 THEN
        -- Thêm 12 ghế Thương gia (Row 1-3, A-D)
        FOR i IN 1..12 LOOP
            v_SeatID := 'ST_T' || LPAD(TO_CHAR(i), 2, '0');
            v_SeatNumber := TO_CHAR(CEIL(i/4)) || CHR(65 + MOD(i-1, 4));
            INSERT INTO SEAT (SeatID, AircraftID, SeatNumber, Class)
            VALUES (v_SeatID, 'AC_TEST', v_SeatNumber, 'Business');
        END LOOP;
        
        -- Thêm 48 ghế Phổ thông (Row 10-17, A-F)
        v_Idx := 13;
        FOR r IN 10..17 LOOP
            FOR c IN 65..70 LOOP
                v_SeatNumber := TO_CHAR(r) || CHR(c);
                v_SeatID := 'ST_T' || TO_CHAR(v_Idx);
                INSERT INTO SEAT (SeatID, AircraftID, SeatNumber, Class)
                VALUES (v_SeatID, 'AC_TEST', v_SeatNumber, 'Economy');
                v_Idx := v_Idx + 1;
            END LOOP;
        END LOOP;
    END IF;
END;
/

-- 4. Thêm 2 chuyến bay HAN <-> SGN vào 30 & 31 tháng 5 năm 2026
-- FL_T01: HAN (AP02) -> SGN (AP01) ngày 30/05/2026 lúc 08:00
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus)
VALUES ('FL_T01', 'VN701', 'AL01', 'AC_TEST', 'RT02', TO_DATE('2026-05-30 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-30 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), '01', 'SCHEDULED');

-- FL_T02: SGN (AP01) -> HAN (AP02) ngày 31/05/2026 lúc 14:00
INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus)
VALUES ('FL_T02', 'VN702', 'AL01', 'AC_TEST', 'RT01', TO_DATE('2026-05-31 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-05-31 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), '02', 'SCHEDULED');

-- 5. Cấu hình bảng giá ghế hạng Business và Economy cho 2 chuyến bay
-- Triggers được giữ BẬT để PriceID tự động sinh bằng Sequence.
INSERT INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES ('FL_T01', 'Business', 4500000);
INSERT INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES ('FL_T01', 'Economy', 1500000);
INSERT INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES ('FL_T02', 'Business', 4500000);
INSERT INTO SEATCLASSPRICE (FlightID, Class, Price) VALUES ('FL_T02', 'Economy', 1500000);

COMMIT;
