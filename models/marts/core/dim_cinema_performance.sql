{{
    config(
        materialized='table'
    )
}}

with transactions as(
    select * from {{ref('fct_transactions')}}
),

cinemas as(
    select * from {{ref('stg_cinemas')}}
),

cinema_performance as (
    select
        t.cinema_id,
        c.cinema_name,
        c.cinema_location,
        COUNT(DISTINCT t.movie_title) as num_movies_shown,
        COUNT(DISTINCT t.customer_id) as num_customers,
        SUM(t.tickets_bought) as total_tickets_sold,
        SUM(t.total) as total_revenue,
        MIN(t.transaction_date) as first_transaction_date,
        MAX(t.transaction_date) as last_transaction_date
    from transactions t
    JOIN cinemas c ON t.cinema_id = c.cinema_id
    GROUP BY 
        t.cinema_id,
        c.cinema_name,
        c.cinema_location
    
)

select * from cinema_performance
