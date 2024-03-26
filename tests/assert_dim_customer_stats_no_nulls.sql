with dim_customer_stats_data as (
    select * from {{ ref('dim_customer_stats') }}
)

select
    customer_id,
    name,
    age,
    email,
    num_movies_seen,
    num_cinemas_visited,
    total_tickets_purchased,
    total_spending,
    first_transaction_date,
    last_transaction_date
from dim_customer_stats_data

where 
    customer_id is null or 
    name is null or 
    age is null or 
    email is null or 
    num_movies_seen is null or 
    num_cinemas_visited is null or 
    total_tickets_purchased is null or 
    total_spending is null or 
    first_transaction_date is null or 
    last_transaction_date is null
