with x as(select *
from {{source('raw','weather_hourly')}}
)
select  * from x