{{
    config(
        materialized='table'
    )
}}

with screenings as(

    select * from {{ ref('stg_screenings') }}

),

movies as (

    select * from {{ ref('stg_movies') }}

),

final as (

    SELECT 
        s.movie_id,
        s.cinema_id,
        s.screening_date,
        m.movie_title,

    FROM 
        screenings s
    LEFT JOIN 
        movies m ON s.movie_id = m.movie_id
)

select * from final
