SELECT 
	c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM 
	addresses AS a natural join customers AS c 
WHERE
	c.email_address = 'allan.sherwood@yahoo.com'
ORDER BY 
	a.zip_code ASC;


