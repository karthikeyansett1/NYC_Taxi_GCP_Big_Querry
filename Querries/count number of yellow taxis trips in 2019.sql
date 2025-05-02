-- Count total number of Yellow Taxi Trips in 2019
SELECT 
  COUNT(*) AS total_trips
FROM 
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`;
