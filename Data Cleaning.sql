--- Step 1: Check for duplicate rows

SELECT ride_id, started_at, ended_at, 
COUNT(*)
FROM cyclistic_data
GROUP BY ride_id, started_at, ended_at
HAVING COUNT(*) > 1;

--- Step 2: Check for NULL values
SELECT 
    COUNT(*) AS total_rows,
    COUNT(ride_id) AS ride_id_count,
    COUNT(rideable_type) AS rideable_type_count,
    COUNT(started_at) AS started_at_count,
    COUNT(ended_at) AS ended_at_count,
    COUNT(start_station_name) AS start_station_name_count,
    COUNT(start_station_id) AS start_station_id_count,
    COUNT(end_station_name) AS end_station_name_count,
    COUNT(end_station_id) AS end_station_id_count,
    COUNT(start_lat) AS start_lat_count,
    COUNT(start_lng) AS start_lng_count,
    COUNT(end_lat) AS end_lat_count,
    COUNT(end_lng) AS end_lng_count,
    COUNT(member_casual) AS member_casual_count
FROM cyclistic_data;

--- Step 3: Check for inconsistencies in rideable_type and member_casual columns
SELECT DISTINCT rideable_type
FROM cyclistic_data;

SELECT DISTINCT member_casual
FROM cyclistic_data;

--- Step 4: Creation of new table
Create Table cyclistic_data_cleaned AS
(
Select
ride_id,
rideable_type AS Bike_Types,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual AS Membership_Type,
(ended_at - started_at) AS Trip_Duration
From cyclistic_data
WHERE  
(started_at < ended_at) AND 
(ended_at - started_at) >= INTERVAL'1 minute' AND
(start_station_name IS NOT NULL AND end_station_name IS NOT NULL)
);

--- Step 5: Check for any outliers exist in Trip_Duration column
SELECT
*
FROM cyclistic_data_cleaned
WHERE trip_duration < Interval '1 minute'
ORDER BY trip_duration DESC;
