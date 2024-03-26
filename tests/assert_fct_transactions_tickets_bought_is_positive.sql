with transactions as (
    select * from {{ ref('fct_transactions') }}
)

select
    screening_id,
    tickets_bought

from transactions

having tickets_bought < 0