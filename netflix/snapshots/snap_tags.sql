{% snapshot snap_tags %}

{{
    config(
        target_schema = 'snapshots',
        unique_key = ['user_id', 'movie_id', 'tag'],
        strategy = 'timestamp',
        updated_at = 'tag_timestamp',
        invalid_hard_deletes = 'true'
    )
}}

select
    {{ dbt_utils.generate_surrogate_key(['user_id', 'movie_id', 'tag'])}} as row_key,
    user_id,
    movie_id,
    tag,
    CAST(tag_timestamp as TIMESTAMP_NTZ) as tag_timestamp
from {{ref("src_tags")}}

{% endsnapshot %}