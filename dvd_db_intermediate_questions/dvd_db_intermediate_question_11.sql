-- Returns the title and ID of the film with the lowest replacement cost

SELECT 
	title, 
	film_id
FROM film
	WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film);