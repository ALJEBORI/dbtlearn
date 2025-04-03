WITH RAW_REVIEWS AS (
select * from AIRBNB.RAW.RAW_REVIEWS
)
select
LISTING_ID, 
DATE as review_date, 
REVIEWER_NAME,
COMMENTS as review_text, 
SENTIMENT as review_sentiment
from RAW_REVIEWS