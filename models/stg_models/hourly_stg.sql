{{ config(materialized='table') }}

WITH hourly_stg AS (
    SELECT *
    FROM raw.hourly_raw
)

SELECT 
    time,
    wind_speed_10m,
    temperature_2m,
    relative_humidity_2m,
    ingested_at,
    CASE
        WHEN wind_speed_10m < 4 THEN 'Normal Day'
        WHEN wind_speed_10m < 9 THEN 'Windy Day'
        WHEN wind_speed_10m < 13 THEN 'Very Windy Day'
        ELSE 'Violent Wind'
    END AS wind_buckets
FROM hourly_stg