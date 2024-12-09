create or replace view order_item_products as 
select o.order_id, o.order_date, o.tax_amount, o.ship_date, p.product_name, oi.item_price, oi.discount_amount, oi.item_price-oi.discount_amount as final_price,
	oi.quantity, (oi.item_price-oi.discount_amount)*oi.quantity as item_total 
from orders o 
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id ;


/*Create a view named order_item_products that returns columns from the Orders, Order_Items, and Products tables.
This view should return these columns from the Orders table: order_id, order_date, tax_amount, and ship_date.
This view should return the product_name column from the Products table.
This view should return these columns from the Order_Items table: item_price, discount_amount, final_price 
(the discount amount subtracted from the item price), quantity, and item_total (the calculated total for the item).





