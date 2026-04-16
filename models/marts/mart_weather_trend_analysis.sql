{{ config(materialized='table') }}

WITH weather AS (
  SELECT *
  FROM {{ ref('hourly_stg') }}
),

agg AS (
  SELECT
    time,
    AVG(wind_speed_10m) AS wind_speed,
    AVG(temperature_2m) AS temperature
  FROM weather
  GROUP BY time
)

SELECT 
  time,
  wind_speed,
  temperature,

  CASE
  WHEN temperature < 7 THEN 'Very Cold Day'
  WHEN temperature < 12 THEN 'Cold Day'
  WHEN temperature < 16 THEN 'Normal Day'
  ELSE 'Hot Day'
END AS temp_buckets

FROM agg