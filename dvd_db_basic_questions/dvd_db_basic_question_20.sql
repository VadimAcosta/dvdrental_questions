-- Shows all payment ID's and payment date's with a transaction amount less than $3.

SELECT 
	payment_id, 
	payment_date
FROM payment
	WHERE amount < 3;