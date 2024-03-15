SELECT
    ticket_id,
    price as ticket_price,
    screening_id

from {{ source('cinema', 'tickets') }}