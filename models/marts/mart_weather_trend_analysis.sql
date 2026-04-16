{{ config(materialized='table') }}

select wind_speed_10m,temperature_2m,time
from {{ ref('hourly_stg') }}