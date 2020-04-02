-- What is the customer ID who made the earliest payment?

SELECT customer_id
FROM payment
	ORDER BY payment_date
	LIMIT 1;