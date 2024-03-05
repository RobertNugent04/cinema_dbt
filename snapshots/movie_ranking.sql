{% snapshot ranking_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key='movie_id',

      strategy='timestamp',
      updated_at='last_updated',
    )
}}

select movie_id, theater_id, ranking_in_theater, last_updated from raw_2.dbt_rn.movie_performance

{% endsnapshot %}