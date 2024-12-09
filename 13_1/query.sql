create procedure test()
begin
	declare var int default 0;
	select count(product_id)
	into var
	from products;
	if var >= 7 then 
		select 'The number of products is greater than or equal to 7' as message;
	else 
		select 'The number of products is less than 7' as message;
	end if;
end












