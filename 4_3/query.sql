SELECT 
	c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity 
FROM 
	customers as c natural join orders as o natural join order_items as oi natural join products as p 
ORDER BY 
	c.last_name, o.order_date, p.product_name;

/*Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables.
This statement should return these columns: last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
Use aliases for the tables.
Sort the final result set by the last_name, order_date, and product_name columns.


