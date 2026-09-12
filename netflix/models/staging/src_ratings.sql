with raw_ratings as (
    select * from MOVIELENS.RAW.RAW_RATINGS
)
select 
    USERID as user_id,
	MOVIEID as movie_id,
	RATING,
	TO_TIMESTAMP_LTZ(TIMESTAMP) as rating_timestamp
from raw_ratings