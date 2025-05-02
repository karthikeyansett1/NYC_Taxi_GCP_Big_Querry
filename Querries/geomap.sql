SELECT
  z.zone_name AS pickup_zone_name,
  z.borough AS borough,
  COUNT(*) AS trips,
  ST_Y(ST_CENTROID(z.zone_geom)) AS latitude,
  ST_X(ST_CENTROID(z.zone_geom)) AS longitude
FROM
  `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019` AS t
JOIN
  `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom` AS z
ON
  t.pickup_location_id = z.zone_id
WHERE
  trip_distance > 0
  AND fare_amount > 0
GROUP BY
  pickup_zone_name, borough, latitude, longitude
ORDER BY
  trips DESC
LIMIT 100
