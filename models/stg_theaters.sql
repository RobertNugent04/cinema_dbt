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

from {{ source('cinema', 'theaters') }}