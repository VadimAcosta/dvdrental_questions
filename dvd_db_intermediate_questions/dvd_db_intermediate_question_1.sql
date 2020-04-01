-- Find the names and the payment amounts for customers 
-- with a lifetime purchase amount of greater than $150

SELECT 
	(customer.customer_id),
	customer.first_name ||' '||customer.last_name as "customer_name",
	SUM (payment.amount)
FROM customer
LEFT JOIN payment
	ON customer.customer_id = payment.customer_id
	GROUP BY 1
	HAVING sum(payment.amount) > 150
	ORDER BY 3 DESC;
