WITH

-- Aggregate measures
order_item_measures AS (
	SELECT
		order_id,
		SUM(item_sale_price) AS total_sale_price,
		SUM(product_cost) AS total_product_cost,
		SUM(item_profit) AS total_profit,
		SUM(item_discount) AS total_discount,

	FROM {{ ref('int_ecommerce_order_items_products') }}
	GROUP BY 1
)

SELECT
	od.order_id,
	od.order_created_date,
	od.order_shipped_date,
	od.order_delivered_date,
	od.order_returned_date,
	od.order_status,
	od.order_num_items,
	om.total_sale_price,
	om.total_product_cost,
	om.total_profit,
	om.total_discount,

FROM {{ ref('stg_ecommerce_orders') }} AS od
LEFT JOIN order_item_measures AS om
	ON od.order_id = om.order_id