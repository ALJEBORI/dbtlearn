WITH RAW_LISTINGS AS (
  SELECT
    *
  FROM AIRBNB.raw.raw_listings
), __dbt__cte__scr_listings AS (
  SELECT
    ID AS listing_id,
    NAME AS listing_name,
    LISTING_URL,
    ROOM_TYPE,
    MINIMUM_NIGHTS,
    HOST_ID,
    PRICE AS price_str,
    CREATED_AT,
    UPDATED_AT
  FROM RAW_LISTINGS AS RAW_LISTINGS
), scr_listings AS (
  SELECT
    *
  FROM __dbt__cte__scr_listings
)
SELECT
  listing_id,
  LISTING_NAME,
  room_type,
  CASE WHEN MINIMUM_NIGHTS = 0 THEN 1 ELSE MINIMUM_NIGHTS END AS MINIMUM_NIGHTS,
  host_id,
  CAST(REPLACE(price_str, '$') AS DECIMAL(10, 2)) AS PRICE,
  CREATED_AT,
  UPDATED_AT
FROM scr_listings