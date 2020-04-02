-- Returns tile and ID of the film with the highest rental_rate

SELECT title, film_id
FROM film
	WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);