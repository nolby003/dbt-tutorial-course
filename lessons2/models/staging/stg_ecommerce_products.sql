with source as (

    select * from {{ source('thelook_ecommerce', 'products') }}

)

select
    id as product_id,
    cost as product_cost,
    category as product_category,
    name as product_name,
    brand as product_brand,
    retail_price as product_retail_price,
    department as product_department,
    sku as product_sku,
    distribution_center_id as product_dc_id

from source
