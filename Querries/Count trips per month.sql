-- Count trips per month (only clean trips)
SELECT
  EXTRACT(MONTH FROM pickup_datetime) AS month,
  COUNT(*) AS trips_per_month
FROM
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`
WHERE
  trip_distance > 0
  AND fare_amount > 0
  AND tip_amount >= 0
GROUP BY
  month
ORDER BY
  month;
