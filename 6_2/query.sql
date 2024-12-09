select 
	c.category_name, count(p.product_id) as product_count, max(p.list_price) as most_expensive_product
from 
	categories c join products p 
on
	c.category_id = p.category_id 
group by c.category_name 
order by product_count desc;

