SELECT 
	"SHIPPED" as ship_status, order_id, order_date 
FROM 
	orders
WHERE 
	ship_date is not null

UNION

SELECT 
	"NOT SHIPPED" as ship_status, order_id, order_date 
FROM 
	orders
WHERE 
	ship_date is null

ORDER BY
	order_date;
	
