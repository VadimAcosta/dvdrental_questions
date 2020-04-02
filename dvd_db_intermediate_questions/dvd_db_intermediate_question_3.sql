-- Return all transactions where the amount is greater than average

SELECT *
FROM payment
	WHERE amount > (SELECT AVG(amount) FROM payment);
	