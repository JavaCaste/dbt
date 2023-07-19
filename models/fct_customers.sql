with

final as(
    select 
    customer_id,
    number_of_orders
    from {{ ref('dim_customers') }}
)

select * from final