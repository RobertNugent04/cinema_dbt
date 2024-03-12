{{
    config(
        materialized='table'
    )
}}

with transactions as(
    select * from {{ref('fct_transactions')}}
),

movie_performance as (
    select
        t.movie_title,
        SUM(t.tickets_bought) as tickets_sold,
        SUM(t.total) as revenue,
        RANK() OVER (ORDER BY revenue DESC) AS movie_ranking,
    from transactions t
    GROUP BY t.movie_title
)

select * from movie_performance
