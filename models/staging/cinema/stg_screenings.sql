SELECT
    screening_id,
    movie_id,
    cinema_id,
    date as screening_date

from {{ source('cinema', 'screenings') }}