create function discount_price(it_id int)
returns decimal(10,2)
begin
declare discount_price decimal(10,2);

select (item_price - discount_amount) into discount_price
from order_items
where item_id = it_id;

return discount_price;
end

/*
Write a script that creates a stored function named discount_price that calculates the discount price of an item in the Order_Items table 
(discount amount subtracted from item price). To do that, this function should accept one parameter for the item ID, 
and it should return the value of the discount price for that item.
*/
