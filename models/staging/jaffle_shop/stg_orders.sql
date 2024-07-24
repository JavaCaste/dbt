select
    id as order_id,
    user_id as customer_id,
    user_id as user_id,
    order_date,
    status
from {{ source('jaffle_shop', 'orders') }}
