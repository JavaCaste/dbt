with

final as(
    select 
    customer_id,
    number_of_orders
    from {{ ref('customers') }}
)

select * from final