SELECT
    id as customer_id,
    name,
    age,
    email,
    phone_number

from {{ source('cinema', 'customers') }}