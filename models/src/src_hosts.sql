WITH RAW_hosts as (
    select * from {{ source('airbnb', 'hosts') }}
)
select 
id as host_id,
name as host_name,
IS_SUPERHOST,
CREATED_AT,
UPDATED_AT
from RAW_hosts