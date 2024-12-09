select 
	order_date, DATE_FORMAT(order_date,"%Y") as order_year, DATE_FORMAT(order_date,"%b-%d-%Y" ) as order_date_formatted
	, DATE_FORMAT(order_date,"%l:%i %p" ) as order_time
	, DATE_FORMAT(order_date,"%m/%d/%y %H:%i" ) as order_datetime
from 
	orders
order by 
	order_date asc;



