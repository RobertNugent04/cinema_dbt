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

from raw_2.cinema.movie_screenings