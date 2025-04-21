WITH mart_fulmoon_reviews AS (
  SELECT  * FROM {{ ref('mart_fulmoon_reviews') }}
)
SELECT 
is_full_moon,
review_sentiment,
COUNT(*) AS reviews
FROM mart_fulmoon_reviews
GROUP BY 
is_full_moon, review_sentiment
ORDER BY is_full_moon,review_sentiment