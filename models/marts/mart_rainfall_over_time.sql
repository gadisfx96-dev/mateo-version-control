with x as(select *
from {{source('raw','weather_hourly')}}
)
select 
date(parse_timestamp('%Y-%m-%dT%H:%M', time)) as date,
sum(rain) tot_rain,
sum(precipitation) tot_precipitation,
 avg(dew_point_2m) avg_dew_pnt,
 avg(relative_humidity_2m) avg_humidity,
avg(vapour_pressure_deficit) avg_vapour_pressure_deficit,
avg (cloud_cover) avg_cloud_cover
from x
group by date
order by date desc