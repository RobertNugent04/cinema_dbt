SELECT
    screening_id,
    movie_id,
    cinema_id,
    theater_id,
    screening_date,
    tickets_sold,
    ticket_price

from {{ source('cinema', 'movie_screenings') }}