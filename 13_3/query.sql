create procedure test()
begin
declare product varchar(100);
declare price decimal(10,2);
declare ret_string varchar(500);
declare no_row tinyint default false;

declare curs cursor for
select product_name, list_price
from products
where list_price > 700
order by list_price desc;

declare continue handler for not found
set no_row = true;
	
open curs;
fetch curs into product, price;
while (no_row = false) do
set ret_string = concat(ret_string,'*', product, '*,*', price, '*|');
fetch curs into product, price;
end while;

select ret_string as message;
end

/*Write a script that creates and calls a stored procedure named test. 
This stored procedure should create a cursor for a result set that consists of the product_name and list_price columns for each product 
with a list price that’s greater than $700. The rows in this result set should be sorted in descending sequence by list price. 
The procedure should return a 1 row, 1 column result set with a column named result.  
The procedure should set the return value to a string variable that includes the product_name and list price for each product so it looks something like this:
*Gibson SG*,*2517.00*|*Gibson Les Paul*,*1199.00*|
Here, each value is enclosed in asterisk(*), each column is separated by a     comma (,) and each row is separated by a pipe character (|).*/
