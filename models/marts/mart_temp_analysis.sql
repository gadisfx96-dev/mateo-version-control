{{config(materialized='table')}}

with x as(select *
from {{source('raw','weather_hourly')}}
)
select 
time,
temperature_2m,
apparent_temperature
from x