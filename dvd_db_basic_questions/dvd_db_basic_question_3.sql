-- Get the customer ID’s of the top 5 customers, by money spent

SELECT 
	customer_id,
	SUM (amount) as "money_spent"
FROM payment
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 5;