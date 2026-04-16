{{ config(materialized='table') }}
models:
  mateo-analytics:
    +dataset: models
    +materialized: table

    
WITH cur AS (
    SELECT *
    FROM raw.current_raw
)

SELECT 
    PARSE_DATETIME('%Y-%m-%dT%H:%M', time) AS time_dt,
    `interval`,
    temperature_2m,
    wind_speed_10m,
    DATETIME(ingested_at) AS ingested_at_dt
FROM cur