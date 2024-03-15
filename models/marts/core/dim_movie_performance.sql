{{
    config(
        materialized='table'
    )
}}

with transactions as(
    select * from {{ref('fct_transactions')}}
),

movies as(
    select * from {{ref('stg_movies')}}
),

movie_performance as (
    select
        t.movie_title,
        m.movie_genre,
        m.release_year,
        SUM(t.tickets_bought) as tickets_sold,
        SUM(t.total) as revenue,
        RANK() OVER (ORDER BY revenue DESC) AS movie_ranking,
    from transactions t
    JOIN movies m ON m.movie_title = t.movie_title
    GROUP BY t.movie_title, m.movie_genre, m.release_year
)

select * from movie_performance
