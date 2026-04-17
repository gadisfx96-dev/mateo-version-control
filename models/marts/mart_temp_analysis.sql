with x as(select *
from {{source('raw','weather_hourly')}}
)
select 
date(parse_timestamp('%Y-%m-%dT%H:%M', time)) as date,
avg(temperature_2m) temperature,
avg(apparent_temperature) apparent_temp 
from x
group by date