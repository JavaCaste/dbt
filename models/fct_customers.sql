
{{ config(materialized='view')}}

with

final as(
    select 
    customer_id,
    first_name||' '||last_name as full_name,
    number_of_orders
    from {{ ref('dim_customers') }}
    -- remove customers with no orders
    where number_of_orders > 1
    order by number_of_orders desc
)

select * from final