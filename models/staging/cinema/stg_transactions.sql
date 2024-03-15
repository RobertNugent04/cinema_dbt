SELECT 
    transaction_id,
    ticket_id,
    customer_id,
    num_bought,
    transaction_date,

from {{ source('cinema', 'transactions') }}