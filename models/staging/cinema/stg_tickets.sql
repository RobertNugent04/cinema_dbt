SELECT
    ticket_id,
    movie_title,
    price as ticket_price,
    movie_date,
    cinema_id

from {{ source('cinema', 'tickets') }}