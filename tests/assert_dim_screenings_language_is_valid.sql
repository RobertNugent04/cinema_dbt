with dim_screenings_data as (
    select * from {{ ref('dim_screenings') }}
)

select
    screening_date,
    movie_title,
    language
from dim_screenings_data

where 
    LANGUAGE not in ('English', 'Spanish', 'French', 'German', 'Italian', 'Japanese', 'Chinese', 'Korean', 'Other')
