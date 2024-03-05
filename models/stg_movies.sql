{{
  config(
    materialized='table'
  )
}}

SELECT
    movie_id,
    title as movie_title,
    genre,
    release_year,
    director,
    language

from {{ source('cinema', 'movies') }}