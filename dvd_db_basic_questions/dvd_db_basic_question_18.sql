--Return a list of all movie categories and the number of movies that are in each, 
--in order of largest category to smallest.

SELECT 
	c.name, 
	COUNT(f.film_id) as total
FROM film as f
JOIN film_category AS fc  ON f.film_id=fc.film_id
JOIN category AS c ON fc.category_id=c.category_id
	GROUP BY c.category_id
	RDER BY total DESC ;