SELECT
    id as ticket_id,
    movie_name,
    price as ticket_price,
    purchase_date as ticket_purchase_date,
    movie_date,
    seat_num

from {{ source('cinema', 'tickets') }}