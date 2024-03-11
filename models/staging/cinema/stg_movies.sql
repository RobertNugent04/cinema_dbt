SELECT
    movie_id,
    title as movie_title,
    genre as movie_genre,
    release_year,
    director,
    language

from {{ source('cinema', 'movies') }}