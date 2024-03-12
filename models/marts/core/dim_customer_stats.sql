{{
    config(
        materialized='table'
    )
}}

with transactions as(
    select * from {{ref('fct_transactions')}}
),

customers as(
    select * from {{ref('stg_customers')}}
),

customer_stats as (
    select
        t.customer_id,
        c.name,
        c.email,
        COUNT(DISTINCT t.movie_title) as num_movies_seen,
        COUNT(DISTINCT t.cinema_id) as num_cinemas_visited,
        SUM(t.tickets_bought) as total_tickets_purchased,
        SUM(t.total) as total_spending,
        MIN(t.transaction_date) as first_transaction_date,
        MAX(t.transaction_date) as last_transaction_date
    from transactions t
    JOIN customers c ON t.customer_id = c.customer_id
    group by
        t.customer_id,
        c.name,
        c.email
)

select * from customer_stats
