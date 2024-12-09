select 
	p.list_price, format(p.list_price,1) as price_format, convert(p.list_price, unsigned) as price_convert, cast(p.list_price as unsigned) as price_cast 
from 
	products p
order by 
	p.list_price asc;





