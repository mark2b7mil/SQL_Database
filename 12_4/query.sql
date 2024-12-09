create or replace view order_item_products as 
	select o.order_id, o.order_date, o.tax_amount, o.ship_date, p.product_name, oi.item_price, oi.discount_amount, oi.item_price-oi.discount_amount as final_price,
	oi.quantity, (oi.item_price-oi.discount_amount)*oi.quantity as item_total
	from orders o 
	join order_items oi on o.order_id = oi.order_id
	join products p on oi.product_id = p.product_id;

create or replace view best_products as 
select product_name, count(order_id) as order_count, sum(item_total) as order_total
from order_item_products
group by product_name
order by order_total desc limit 5;










