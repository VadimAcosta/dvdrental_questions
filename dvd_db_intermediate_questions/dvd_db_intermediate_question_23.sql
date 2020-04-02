-- Return all purchases from the longest standing customer
-- (ie customer who has the earliest payment_date)

WITH oldest_customer AS 

(
SELECT customer_id
FROM payment
	ORDER BY payment_date
	LIMIT 1
)

SELECT * 
FROM payment
	WHERE customer_id = (SELECT * FROM oldest_customer);