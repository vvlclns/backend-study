-- 1. ID가 11인 노선을 예매한 모든 승객의 ID(id), 이름(name), 좌석 번호(seat_number)를 좌석 번호의 오름차순으로 조회
SELECT u.id, u.name, t.seat_number FROM users u
INNER JOIN tickets t ON u.id = t.user WHERE t.train = 11
ORDER BY t.seat_number ASC;

-- 2. 각 사용자의 ID(id), 이름(name), 탑승 열차 수(trains_count), 총 거리(total_distance)를 총 거리의 내림차순으로 상위 6명만 조회
SELECT
    u.id,
    u.name,
    COUNT(tickets.id) AS trains_count,
    SUM(trains.distance) * 0.1 AS total_distance
FROM users u
LEFT JOIN tickets ON u.id = tickets.user
LEFT JOIN trains ON tickets.train = trains.id
GROUP BY u.id, u.name
ORDER BY total_distance DESC
LIMIT 6;

-- 3. 각 노선의 ID(id), 열차 종류(type), 출발역(src_stn), 도착역(dst_stn), 여행 시간(travel_time)을 여행 시간의 내림차순으로 상위 6개만 조회
SELECT
    trains.id,
    types.name AS type,
    s1.name AS src_stn,
    s2.name AS dst_stn,
    Timediff(trains.arrival, trains.departure) AS travel_time
FROM trains
INNER JOIN types ON trains.type = types.id
INNER JOIN stations s1 ON trains.source = s1.id
INNER JOIN stations s2 ON trains.destination = s2.id
ORDER BY travel_time DESC
LIMIT 6;


-- 4. 각 노선의 열차 종류(type), 출발역(src_stn), 도착역(dst_stn), 출발 시각(departure), 도착 시각(arrival), 운임(fare; 원 단위)을 출발 시각의 오름차순으로 모두 조회
SELECT
    types.name AS type,
    s1.name AS src_stn,
    s2.name AS dst_stn,
    trains.departure,
    trains.arrival,
    ROUND(types.fare_rate * trains.distance * 0.001, -2) AS fare
FROM trains
INNER JOIN types ON trains.type = types.id
INNER JOIN stations s1 ON trains.source = s1.id
INNER JOIN stations s2 ON trains.destination = s2.id
ORDER BY trains.departure ASC;

-- 5. 각 노선의 ID(id), 열차 종류(type), 출발역(src_stn), 도착역(dst_stn), 예매된 좌석 수(occupied), 최대 좌석 수(maximum)를 노선의 ID의 오름차순으로 모두 조회 (예매한 사용자가 없는 노선은 제외)
SELECT
    trains.id,
    types.name AS type,
    s1.name AS src_stn,
    s2.name AS dst_stn,
    COUNT(tickets.id) AS occupied,
    types.max_seats AS maximum
FROM trains
INNER JOIN types ON trains.type = types.id
INNER JOIN stations s1 ON trains.source = s1.id
INNER JOIN stations s2 ON trains.destination = s2.id
INNER JOIN tickets ON trains.id = tickets.train
GROUP BY trains.id
ORDER BY trains.id ASC;

-- 6. 각 노선의 ID(id), 열차 종류(type), 출발역(src_stn), 도착역(dst_stn), 예매된 좌석 수(occupied), 최대 좌석 수(maximum)를 노선의 ID의 오름차순으로 모두 조회 (예매한 사용자가 없는 노선도 포함)
SELECT
    trains.id,
    types.name AS type,
    s1.name AS src_stn,
    s2.name AS dst_stn,
    COUNT(tickets.id) AS occupied,
    types.max_seats AS maximum
FROM trains
INNER JOIN types ON trains.type = types.id
INNER JOIN stations s1 ON trains.source = s1.id
INNER JOIN stations s2 ON trains.destination = s2.id
LEFT JOIN tickets ON trains.id = tickets.train
GROUP BY trains.id
ORDER BY trains.id ASC;