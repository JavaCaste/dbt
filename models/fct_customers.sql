
{{ config(materialized='view')}}

with

final as(
    select 
    customer_id,
    number_of_orders
    from {{ ref('dim_customers') }}
    -- remove customers with no orders
    where number_of_orders > 0
)

select * from final