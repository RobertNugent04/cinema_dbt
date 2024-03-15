SELECT
    cinema_id,
    cinema_name,
    location as cinema_location,

from {{ source('cinema', 'cinemas') }}