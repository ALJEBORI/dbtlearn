WITH scr_listings as (
    select * 
    from {{ref('scr_listings') }}
)
select
listing_id,
LISTING_NAME,
 room_type,
 CASE
 WHEN MINIMUM_NIGHTS=0 THEN 1
 ELSE MINIMUM_NIGHTS
 END AS MINIMUM_NIGHTS,
 host_id,
 REPLACE(price_str,'$')::NUMBER(10,2) AS PRICE,
 CREATED_AT,
 UPDATED_AT
 from scr_listings
