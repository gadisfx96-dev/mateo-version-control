
{{ config(materialized='table') }}

with hourly as
(
select *
from
{{ref('hourly_stg')}}
)
select
avg(wind_speed_10m) wind_speed,
avg(temperature_2m) temperature,
avg(relative_humidity_2m) humidity,
time,
CASE
  WHEN relative_humidity_2m >= 85
       AND wind_speed_10m >= 6
  THEN 'High Rain Likelihood'

  WHEN relative_humidity_2m >= 75
  THEN 'Moderate Rain Likelihood'

  ELSE 'Low Rain Likelihood'
END as rain_likelihood,
wind_buckets
from hourly
group by rain_likelihood,wind_buckets,time