--- Step 1: Create a table
CREATE TABLE cyclistic_data 
(
    ride_id VARCHAR(255),
    rideable_type VARCHAR(255),
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat NUMERIC,
    start_lng NUMERIC,
    end_lat NUMERIC,
    end_lng NUMERIC,
    member_casual VARCHAR(255)
);
--- Step 2: Import CSV files
COPY cyclistic_data 
FROM 'E: / 202101.csv' 
DELIMITER ‘,’
CSV HEADER;
---  Changed the name of files in the third line to import data of remaining months.
--- Step 3: Verify the imported data
Select
*
From Cyclistic_data;
