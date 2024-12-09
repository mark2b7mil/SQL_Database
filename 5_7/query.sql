UPDATE 
	customers 
set
	first_name = 'Al', email_address = 'allan.sherwood@yahoo.com'
WHERE 
	last_name = 'Sherwood' and first_name = 'Allan';
	
/*Write a SELECT statement that returns these columns:
The count of the number of orders in the Orders table named order_count
The sum of the tax_amount columns in the Orders table named tax_total
The average of the tax_amount columns in the Orders table named tax_average
