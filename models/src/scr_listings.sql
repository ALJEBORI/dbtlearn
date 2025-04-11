WITH RAW_LISTINGS AS (
  select * from {{ source('airbnb', 'listings') }}
)
select 
ID as listing_id, 
NAME AS listing_name, 
LISTING_URL, 
ROOM_TYPE, 
MINIMUM_NIGHTS,
HOST_ID, 
PRICE as price_str,
CREATED_AT,
UPDATED_AT
from RAW_LISTINGS