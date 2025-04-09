WITH
 l AS (
    SELECT *
    FROM {{ ref('dim_listings_cleansed') }}
),
h AS (
    SELECT * 
    FROM {{ ref('dim_hosts_cleansed') }}
)
SELECT
l.listing_id,
l.LISTING_NAME,
l.room_type,
l.MINIMUM_NIGHTS,
l.PRICE,
l.host_id,
h.host_name,
h.IS_SUPERHOST AS host_is_super,
l.CREATED_AT,
GREATEST(l.UPDATED_AT,h.UPDATED_AT) AS UPDATED_AT
FROM l
LEFT JOIN h ON (l.host_id=h.host_id)