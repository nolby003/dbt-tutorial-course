with products as (
    select
        product_id,
        product_department,
        product_cost,
        product_retail_price
    from {{ ref('stg_ecommerce_products') }}
)

select

    order_items.order_item_id,
    order_items.order_id,
    order_items.user_id,
    order_items.product_id,

    order_items.item_sale_price,

    products.product_department,
    products.product_cost,
    products.product_retail_price,

    order_items.item_sale_price - products.product_cost as item_profit,
    products.product_retail_price - order_items.item_sale_price as item_discount

from {{ ref('stg_ecommerce_order_items') }} as order_items
left join products on order_items.product_id = products.product_id
