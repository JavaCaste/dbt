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

select * from scd_customers

{% if is_incremental() %}
where {{ dbt_utils.dateadd(day, 1, record_start_time) }} > {{current_date}}
{% endif %}
