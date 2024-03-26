with dim_customers_stats_data as (
    select * from {{ ref('dim_customer_stats') }}
)

select
    CUSTOMER_ID,
    NAME,
    EMAIL
from dim_customers_stats_data

where not REGEXP_LIKE(EMAIL, '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}')
