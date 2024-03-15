{{
    config(
        materialized='table'
    )
}}

with tickets as(

    select * from {{ ref('stg_tickets') }}

),

transactions as (
    select * from {{ref('stg_transactions')}}
),

dim_screenings as (

    select * from {{ ref('dim_screenings') }}

),

transaction_tickets as (
    select
        t.ticket_id,
        ti.screening_id,
        t.customer_id, 
        t.num_bought,
        ti.ticket_price,
        t.transaction_date
    from transactions t
    join tickets ti on t.ticket_id = ti.ticket_id
),

final as (

    SELECT 
        tt.ticket_id,
        ds.cinema_id,
        ds.movie_title,
        tt.customer_id,
        tt.ticket_price * tt.num_bought as total,
        tt.num_bought as tickets_bought,
        tt.transaction_date
    FROM transaction_tickets tt
    JOIN dim_screenings ds 
    ON tt.screening_id = ds.screening_id

)

select * from final
