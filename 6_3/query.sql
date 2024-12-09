select 
	c.email_address, sum(o.item_price*o.quantity) as item_price_total, sum(o.discount_amount*o.quantity) as discount_amount_total
from 
	customers c 
	inner join orders oo on c.customer_id = oo.customer_id 
	inner join order_items o on o.order_id = oo.order_id 
group by
	c.customer_id  
order by 
	item_price_total desc;

