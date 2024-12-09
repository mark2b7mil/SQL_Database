create procedure test(out mess varchar(100))
begin
	declare var int default 0;
	select count(product_id)
	into var
	from products;
	if var >= 7 then 
		select 'The number of products is greater than or equal to 7' into mess;
		select 'The number of products is greater than or equal to 7' as message;
	else 
		select 'The number of products is less than 7' into mess;
		select 'The number of products is less than 7' as message;
	end if;
end

/*
Write a script that creates a stored procedure named test. 
This stored procedure should declare a variable and set it to the count of all products in the Products table. 
The stored procedure should accept an OUT  parameter where a message is passed out of the procedure.  
If the count is greater than or equal to 7, the stored procedure should return the value “The number of products is greater than or equal to 7”. 
Otherwise, it should return the value “The number of products is less than 7”.
*/
