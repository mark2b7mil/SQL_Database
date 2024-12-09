select k.email_address, max(k.order_total) as max_order_total, min(k.order_id) as min_order_id
from ( select
		c.email_address, oi.order_id, sum((oi.item_price - oi.discount_amount)*oi.quantity) as order_total
	from
		customers c
		join orders o on c.customer_id = o.customer_id
		join order_items oi on o.order_id = oi.order_id
	group by 
		c.email_address, oi.order_id ) as k
group by
	k.email_address
order by 
	max_order_total desc;



