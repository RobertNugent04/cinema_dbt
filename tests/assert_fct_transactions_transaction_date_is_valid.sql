with fct_transactions_data as (
    select * from {{ ref('fct_transactions') }}
)

select
    customer_id,
    transaction_date
from fct_transactions_data

where 
    transaction_date is null or 
    try_to_date(transaction_date) is null
