{{
  config(
    materialized='table'
  )
}}

SELECT
    screening_id,
    movie_id,
    cinema_id,
    screening_date,
    tickets_sold

from {{ source('cinema', 'movie_screenings') }}