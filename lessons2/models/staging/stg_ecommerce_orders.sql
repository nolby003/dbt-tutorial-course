with source as (

    select * from {{ source('thelook_ecommerce', 'orders') }}

)

select
    order_id,
    user_id,
    status as order_status,
    created_at as order_created_date,
    returned_at as order_returned_date,
    shipped_at as order_shipped_date,
    delivered_at as order_delivered_date,
    num_of_item as order_num_items

from source

