-- Returns the genre and average rental rate for each genre of film.

-- subquery

SELECT AVG(rental_rate)
FROM film JOIN film_category ON film.film_id=film_category.film_id
	GROUP BY category_id;

-- CTE 

WITH movies AS (
SELECT * 
FROM film 
JOIN film_category 
	ON film.film_id=film_category.film_id
)

SELECT 
	category_id, 
	ROUND (AVG(rental_rate),2)
FROM movies
	GROUP BY category_id
	RDER BY category_id;
