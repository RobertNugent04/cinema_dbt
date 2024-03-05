{{
  config(
    materialized='table'
  )
}}

SELECT
    screening_id,
    movie_id,
    theater_id,
    screening_date,
    tickets_sold

from {{ source('cinema', 'movie_screenings') }}