{{ config(
  materialized='incremental',
  unique_key='customer_history_sk',
  tags = ["incremental_model"])
}}

with 

customer_history as (
    select * from {{ source('scd', 'customer_history') }}
),

scd_customers as (
    select
       * 
    from customer_history
)

select * from scd_customers where record_end_time is null

{% if is_incremental() %}
where  record_start_time  > current_date - interval '1 day'
{% endif %}
