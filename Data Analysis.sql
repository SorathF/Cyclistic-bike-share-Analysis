--- Average ride length for each membership_type
SELECT 
	membership_type, 
	AVG(trip_duration) as average_trip_duration,
	MIN(trip_duration) as min_trip_duration, 
	MAX(trip_duration) as max_trip_duration
FROM 
	cyclistic_data_cleaned
GROUP BY 
	membership_type;

--- Ride length by membership type
SELECT 
	membership_type, 
	COUNT(*) as ride_count
FROM 
	cyclistic_data_cleaned
GROUP BY 
	membership_type;

--- Bike types by membership type
SELECT 
	membership_type, 
	bike_types,
	COUNT(*) as ride_count
FROM 
	cyclistic_data_cleaned
GROUP BY 
	membership_type,
            bike_types
ORDER BY
    membership_type,
    ride_count DESC;

--- Average trip duration by membership type and bike types
Select 
membership_type,
bike_types,
ROUND(AVG(trip_duration), 2) AS avg_trip_duration_minutes
From cyclistic_data_cleaned
GROUP BY 
       membership_type,
       bike_types
ORDER BY
      membership_type,
      bike_types;

--- Number of rides by day of week by membership type 
--- For Casual
SELECT 
	membership_type, 
	 day_of_week,
COUNT(*) as num_of_rides
FROM 
	cyclistic_data_cleaned
WHERE
    membership_type = 'casual'
GROUP BY 
  day_of_week, 
	membership_type
ORDER BY
    day_of_week, 
    membership_type;
--- For Members
SELECT 
	membership_type, 
	 day_of_week,
COUNT(*) as num_of_rides
FROM 
	cyclistic_data_cleaned
WHERE
    membership_type = 'member'
GROUP BY 
  day_of_week, 
	membership_type
ORDER BY
    day_of_week, 
    membership_type;

--- Popular time of day by membership type
SELECT 
     membership_type,
     EXTRACT(HOUR FROM started_at) AS hour_of_day,
     COUNT(*) as ride_count
From cyclistic_data_cleaned
GROUP BY 
      hour_of_day, 
      membership_type
ORDER BY 
     hour_of_day, 
     membership_type;

--- Rides per month by membership type
 SELECT
  EXTRACT(MONTH FROM started_at) AS month_number,
  TO_CHAR(started_at, 'Month') AS month_name,
  membership_type,
  COUNT(*) AS ride_count
 From cyclistic_data_cleaned
GROUP BY 
      month_number, 
      month_name, 
      membership_type
ORDER BY 
      month_number, 
      month_name, 
      membership_type;

--- Rides per season by membership type
SELECT  
    membership_type,
CASE
          WHEN EXTRACT(MONTH FROM started_at) IN (3, 4, 5) THEN 'Spring'
          WHEN EXTRACT(MONTH FROM started_at) IN (6, 7, 8) THEN 'Summer'
          WHEN EXTRACT(MONTH FROM started_at) IN (9, 10, 11) THEN 'Fall'
          WHEN EXTRACT(MONTH FROM started_at) IN (12, 1, 2) THEN 'Winter'
          END AS season,
COUNT(*) AS ride_count
From cyclistic_data_cleaned
GROUP BY 
     season, 
     membership_type
ORDER BY 
     season, 
    membership_type;
