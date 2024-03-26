with transactions as (
    select * from {{ ref('fct_transactions') }}
)

select
    customer_id,
    total

from transactions

having total < 0