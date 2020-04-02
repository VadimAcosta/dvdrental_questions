-- List all payments with below average payment amounts

SELECT *
FROM payment
	WHERE amount < (SELECT AVG(amount) FROM payment);