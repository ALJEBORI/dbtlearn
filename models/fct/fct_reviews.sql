{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}
WITH src_reviews as (
select * from {{ ref('src_reviews') }}
)
select
*
from src_reviews
where  review_text is not null
{% if is_incremental()  %}
    AND review_date > coalesce((select max(review_date) from {{ this }}), '1900-01-01')
{% endif %}