{{
  config(
    materialized='table'
  )
}}

SELECT
    movie_id,
    title,
    genre,
    release_year,
    director,
    language

from raw_2.cinema.movies