-- List all films with the lowest rental rate (using a WHERE clause)

SELECT title, 
	rental_rate 
FROM film
	WHERE rental_rate = (SELECT MIN(rental_rate) FROM film);