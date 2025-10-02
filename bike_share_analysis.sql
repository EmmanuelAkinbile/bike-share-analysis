/* 
=========================================================
Cyclistic Case Study - Analyze Phase (SQL Exploration)
=========================================================

Business Task:
--------------
How do annual members and casual riders use Cyclistic bikes differently? 
I will compare usage patterns of members vs casual riders to identify insights
that will help convert casual riders into members.

Approach in SQL Server:
-----------------------
1. Conduct minimal QA checks to confirm data quality:
   - Verify row counts and schema
   - Check for duplicate ride IDs
   - Check for NULLs in critical fields
   - Sanity check ride duration values

2. Generate descriptive statistics and trends:
   - Total rides by member type
   - Average ride duration by member type
   - Usage by day of week and hour of day
   - Station-level usage patterns

3. Summarize insights:
   - Highlight key differences in behavior
   - Inform recommendations for marketing 
     and product strategy.

=====================================================
Step 1 – QA Checks
=====================================================
Goal:
- Combine the 2 datasets into 1 table
- Ensure the dataset is ready for analysis by checking:
  1. Total row count
  2. Duplicate ride IDs
  3. NULL values in critical columns
  4. Ride duration sanity checks
*/

-- Initial table view
SELECT *
FROM bike_2019;

SELECT *
FROM bike_2020;

-- Total number of rows in 2019 data
SELECT COUNT(*) total_rows
FROM bike_2019;

-- Total number of rows in 2020 data
SELECT COUNT(*) total_rows
FROM bike_2020;

-- Create the new combined table
CREATE TABLE bike_cleaned (
    ride_id NVARCHAR(50) PRIMARY KEY,
    rideable_type NVARCHAR(50) NOT NULL,
    started_at DATETIME2 NOT NULL,
    ended_at DATETIME2 NOT NULL,
    ride_length TIME NOT NULL,
    day_of_week TINYINT NOT NULL,
    start_station_name NVARCHAR(100) NULL,
    end_station_name NVARCHAR(100) NULL,
    member_casual NVARCHAR(50) NOT NULL
);

-- Insert 2019 data
INSERT INTO bike_cleaned
SELECT *
FROM bike_2019;

-- Insert 2020 data
INSERT INTO bike_cleaned
SELECT *
FROM bike_2020;

SELECT *
FROM bike_cleaned;

-- Check for duplicate records
SELECT ride_id, COUNT(*) duplicates
FROM bike_cleaned
GROUP BY ride_id
HAVING COUNT(*) > 1;

-- Check for nulls
SELECT 
    SUM(CASE WHEN ride_id IS NULL THEN 1 ELSE 0 END) AS null_ride_id,
    SUM(CASE WHEN member_casual IS NULL THEN 1 ELSE 0 END) AS null_member_type,
    SUM(CASE WHEN started_at IS NULL THEN 1 ELSE 0 END) AS null_start_time,
    SUM(CASE WHEN ended_at IS NULL THEN 1 ELSE 0 END) AS null_end_time,
    SUM(CASE WHEN start_station_name IS NULL THEN 1 ELSE 0 END) AS null_start_station,
    SUM(CASE WHEN end_station_name IS NULL THEN 1 ELSE 0 END) AS null_end_station,
    SUM(CASE WHEN ride_length IS NULL THEN 1 ELSE 0 END) AS null_ride_length
FROM bike_cleaned;

/*
=====================================================
Step 2 – Aggregation of data
=====================================================
Goal:
- Look at th
  1. Total row count
  2. Duplicate ride IDs
  3. NULL values in critical columns
  4. Ride duration sanity checks
*/
-- Average, Min, Max ride length as proper durations
SELECT 
    CAST(DATEADD(SECOND, AVG(DATEDIFF(SECOND, 0, ride_length)), 0) AS TIME) AS avg_ride_length,
    MIN(ride_length) AS min_ride_length,
    MAX(ride_length) AS max_ride_length
FROM bike_cleaned;

-- Aggregating data by member status
SELECT 
    member_casual,
    COUNT(*) AS total_rides,
    CAST(DATEADD(SECOND, AVG(DATEDIFF(SECOND, 0, ride_length)), 0) AS TIME) AS avg_ride_length,
    MIN(ride_length) AS min_length,
    MAX(ride_length) AS max_length
FROM bike_cleaned
GROUP BY member_casual;

-- Average ride length (in minutes) by day of the week and member type
SELECT 
    member_casual,
    day_of_week,
    COUNT(*) AS rides,
    CAST(DATEADD(SECOND, AVG(DATEDIFF(SECOND, 0, ride_length)), 0) AS TIME) AS avg_ride_length
FROM bike_cleaned
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;

-- Average ride length by month and member type
SELECT  
    DATENAME(MONTH, started_at) AS month_name,
    DATEPART(MONTH, started_at) AS month_number,
    member_casual,
    COUNT(*) AS total_rides,
    CAST(DATEADD(SECOND, AVG(DATEDIFF(SECOND, 0, ride_length)), 0) AS TIME) AS avg_ride_length
FROM bike_cleaned
GROUP BY DATENAME(MONTH, started_at), DATEPART(MONTH, started_at),member_casual
ORDER BY month_number, member_casual;

-- Average ride length and ride counts by hour of day
SELECT 
    DATEPART(HOUR, started_at) AS ride_hour,
    member_casual,
    COUNT(*) AS total_rides,
    CAST(DATEADD(SECOND, AVG(DATEDIFF(SECOND, 0, ride_length)), 0) AS TIME) AS avg_ride_length
FROM bike_cleaned
GROUP BY DATEPART(HOUR, started_at), member_casual
ORDER BY ride_hour, member_casual;

-- Top 10 stations for casual riders
SELECT TOP 10
    start_station_name,
    COUNT(*) trips,
    member_casual,
    CAST(DATEADD(SECOND, AVG(DATEDIFF(SECOND, 0, ride_length)), 0) AS TIME) AS avg_ride_length
FROM bike_cleaned
WHERE member_casual = 'casual'
GROUP BY start_station_name, member_casual 
ORDER BY  COUNT(*) desc;

-- Top 10 stations for members
SELECT TOP 10
    start_station_name,
    COUNT(*) trips,
    member_casual,
    CAST(DATEADD(SECOND, AVG(DATEDIFF(SECOND, 0, ride_length)), 0) AS TIME) AS avg_ride_length
FROM bike_cleaned
WHERE member_casual = 'member'
GROUP BY start_station_name, member_casual 
ORDER BY  COUNT(*) desc;