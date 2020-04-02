-- List all purchases from the longest standing customer
-- (ie customer who has the earliest payment_date)

SELECT * 
FROM payment
	WHERE customer_id = (SELECT customer_id
			     FROM payment
			         ORDER BY payment_date
				 LIMIT 1);