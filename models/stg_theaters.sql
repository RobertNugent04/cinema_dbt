{{
  config(
    materialized='table'
  )
}}

SELECT
    theater_id,
    theater_name,
    location,
    capacity 

from raw_2.cinema.theaters