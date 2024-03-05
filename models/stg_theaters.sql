{{
  config(
    materialized='table'
  )
}}

SELECT
    theater_id,
    theater_name,
    location as theater_location,
    capacity 

from {{ source('cinema', 'theaters') }}