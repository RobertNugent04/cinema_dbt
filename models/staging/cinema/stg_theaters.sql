SELECT
    theater_id,
    type as theater_type,
    capacity,

from {{ source('cinema', 'theaters') }}