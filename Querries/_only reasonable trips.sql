-- Cleaned trips: only reasonable trips
SELECT
  COUNT(*) AS total_clean_trips
FROM
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`
WHERE
  trip_distance > 0
  AND fare_amount > 0
  AND tip_amount >= 0;
