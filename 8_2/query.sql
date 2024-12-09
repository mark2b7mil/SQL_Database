select 
	p.list_price, p.discount_percent, (p.list_price*(p.discount_percent/100)) as discount_amount
from 
	products p
order by 
	discount_amount asc;




