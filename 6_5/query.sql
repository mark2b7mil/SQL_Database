select
	c.email_address, count(distinct oi.order_id) as order_count, sum((oi.item_price - oi.discount_amount)*oi.quantity) as order_total
from
	customers c 
	join orders o on c.customer_id = o.customer_id 
	join order_items oi on oi.order_id = o.order_id 
WHERE 
	oi.item_price > 400
group by
	o.customer_id 
having
	order_count > 1 
order by 
	order_total desc;

