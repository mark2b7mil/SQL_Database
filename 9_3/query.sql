select 
	card_number, LENGTH(card_number) as card_number_length,
	SUBSTRING(card_number, -4) as last_four_digits,
	if(length(card_number)=16, concat('XXXX-XXXX-XXXX-', SUBSTRING(card_number, -4)), concat('XXXX-XXXXXX-X', SUBSTRING(card_number, -4))) as formatted_number
from 
	orders
order by 
	card_number asc;



