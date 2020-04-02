-- Gets the emails of all customers that shop at store 1 that are inactive.

SELECT 
	customer_id, 
	email, active
FROM customer
	WHERE store_id = 1 AND active = 0
	ORDER BY last_update;