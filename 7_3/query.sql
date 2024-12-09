select 
	product_name, list_price, discount_percent 
from 
	products 
where
    discount_percent NOT IN (SELECT discount_percent FROM products GROUP BY discount_percent HAVING COUNT(discount_percent) > 1)
order by 
	product_name;




