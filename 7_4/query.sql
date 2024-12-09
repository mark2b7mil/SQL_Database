select 
	format(list_price,1) as price_format, convert(list_price, unsigned) as price_convert, cast(list_price as unsigned) as price_cast
from 
	products
order by 
	list_price asc;





