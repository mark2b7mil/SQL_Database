SELECT 
c.category_name, p.product_name, p.list_price
FROM 
categories AS c 
JOIN 
products AS p 
ON c.category_id = p.category_id 
ORDER BY c.category_name, p.product_name ASC;
