with cinemas as(

    select * from {{ ref('stg_cinemas') }}

),

movies as (

    select * from {{ ref('stg_movies') }}

),

final as (

    SELECT 
        m.movie_id,
        m.movie_title,
        m.movie_genre,
        c.cinema_name,
        c.cinema_location
    FROM
        movies m,
        cinemas c
)

select * from final
