-- List all films with shorter than average length.

SELECT
	title, 
	length
FROM film
	WHERE length > (SELECT AVG(length) FROM film);