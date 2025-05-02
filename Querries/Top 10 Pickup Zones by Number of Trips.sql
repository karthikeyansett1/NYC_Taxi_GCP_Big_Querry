-- Top 10 Pickup Zones by Number of Trips
SELECT
  pickup_location_id,
  COUNT(*) AS num_trips
FROM
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`
WHERE
  trip_distance > 0
  AND fare_amount > 0
  AND tip_amount >= 0
GROUP BY
  pickup_location_id
ORDER BY
  num_trips DESC
LIMIT 10;
