select 
	count(order_id) as order_count, sum(tax_amount) as tax_total, avg(tax_amount) as tax_average
from
	orders;
	
