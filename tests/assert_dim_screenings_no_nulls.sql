with dim_screenings_data as (
    select * from {{ ref('dim_screenings') }}
)

select
    SCREENING_ID,
    SCREENING_DATE,
    MOVIE_TITLE,
    LANGUAGE
from dim_screenings_data

-- Add assertions here
where SCREENING_ID is null or SCREENING_DATE is null or MOVIE_TITLE is null or LANGUAGE is null
