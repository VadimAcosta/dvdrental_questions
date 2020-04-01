-- Which store has served the most customers?

SELECT 
	store_id,
	COUNT (customer_id)
FROM customer
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 1;