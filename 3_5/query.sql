SELECT item_id, item_price, discount_amount, quantity, (item_price*quantity) as price_total,
(discount_amount*quantity) as discount_total, (item_price-discount_amount)*quantity as item_total
FROM order_items
WHERE (item_price-discount_amount)*quantity > 500
ORDER BY item_total DESC;