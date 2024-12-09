SELECT 
	c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity 
FROM 
	customers as c natural join orders as o natural join order_items as oi natural join products as p 
ORDER BY 
	c.last_name, o.order_date, p.product_name;



