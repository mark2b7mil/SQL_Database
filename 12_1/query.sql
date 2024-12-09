create or replace view customer_addresses as 
select c.customer_id, c.email_address, c.last_name, c.first_name, a.line1 as bill_line1, a.line2 as bill_line2, a.city as bill_city,
	a.state as bill_state, a.zip_code as bill_zip, a2.line1 as ship_line1, a2.line2 as ship_line2, a2.city as ship_city,
	a2.state as ship_state, a2.zip_code as ship_zip
from customers c 
join addresses a on c.customer_id = a.customer_id and c.billing_address_id = a.address_id 
join addresses a2 on c.customer_id = a2.customer_id and c.shipping_address_id = a2.address_id ;







