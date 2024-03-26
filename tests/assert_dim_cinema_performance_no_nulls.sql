with dim_cinema_performance_data as (
    select * from {{ ref('dim_cinema_performance') }}
)

select
    cinema_id,
    cinema_name,
    cinema_location,
    num_movies_shown,
    num_customers,
    total_tickets_sold,
    total_revenue,
    first_transaction_date,
    last_transaction_date
from dim_cinema_performance_data

where 
    cinema_id is null or 
    cinema_name is null or 
    cinema_location is null or 
    num_movies_shown is null or 
    num_customers is null or 
    total_tickets_sold is null or 
    total_revenue is null or 
    first_transaction_date is null or 
    last_transaction_date is null
