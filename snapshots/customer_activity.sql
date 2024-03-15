{% snapshot customers_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key='customer_id',

      strategy='timestamp',
      updated_at='last_transaction_date',
    )
}}

select customer_id, name, num_movies_seen, num_cinemas_visited, total_tickets_purchased, total_spending, last_transaction_date from raw.dbt_rn.dim_customer_stats

{% endsnapshot %}