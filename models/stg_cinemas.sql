{{
  config(
    materialized='table'
  )
}}

SELECT
    cinema_id,
    cinema_name,
    location as cinema_location,
    capacity 

from {{ source('cinema', 'cinemas') }}