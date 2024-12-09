SELECT product_name, list_price, discount_percent, ROUND((list_price*(discount_percent/100)),2) as discount_amount, ROUND(list_price-(list_price*(discount_percent/100)),2) as discount_price 
FROM products 
ORDER BY list_price-(list_price*(discount_percent/100)) DESC
LIMIT 5;