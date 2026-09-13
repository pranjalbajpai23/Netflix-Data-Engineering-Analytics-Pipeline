{{
    config(
        materialized = 'table'
    )
}}

with fct_rating as (
    select * from  {{ref("fact_ratings")}}
),
seed_dates as (
    select * from {{ref("seed_movie_release_date")}}
)

select 
    f.*,
    CASE
        when s.release_date is null then 'unknown'
        else 'known'
        end as release_info
from fct_rating f 
left join seed_dates s on f.movie_id=s.movie_id
