--lIST all films with shorter than average length.

SELECT *
FROM payment
	WHERE amount > (SELECT AVG(amount) FROM payment);