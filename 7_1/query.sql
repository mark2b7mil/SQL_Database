select
	product_id, product_name, list_price 
from
	products
WHERE 
	list_price > (select avg(list_price) from products)
order by 
	list_price desc;



