{{config(materialized='table')}}

with x as(select *
from {{source('raw','weather_hourly')}}
)
select 
temperature_2m,
rain,
apparent_temperature,
cloud_cover,
wind_speed_10m,
sunshine_duration
 from x