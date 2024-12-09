select 
	order_id, order_date, DATE_ADD(order_date, interval 2 day) as approx_ship_date, ship_date, DATEDIFF(ship_date, order_date) as days_to_ship
from 
	orders
WHERE 
	MONTH(order_date) = 3 and year(order_date) = 2018 and ship_date is not null
order by 
	order_id asc;


