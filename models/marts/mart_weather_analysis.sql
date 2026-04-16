{{config(materialized='table')}}

with weather as (
select *
from {{ref('current_stg')}}
)
select 
time_dt,
avg(`interval`) as `interval`,
avg(temperature_2m) temp,
avg(wind_speed_10m) wind_speed
from weather
group by time_dt
