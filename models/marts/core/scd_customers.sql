with 

customer_history as (
    select * from {{ source('scd', 'customer_history') }}
),

scd_customers as (
    select
       * 
    from customer_history
)

select * from scd_customers
