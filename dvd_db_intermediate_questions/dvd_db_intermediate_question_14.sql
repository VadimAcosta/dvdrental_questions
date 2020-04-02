-- Return a list of all movie categories and the number of movies that are in each, 
-- in order of largest category to smallest.

SELECT 
	c.category_id, 
	COUNT(f.film_id) as total
FROM film as f
JOIN film_category as c ON f.film_id=c.film_id
	GROUP BY c.category_id
	ORDER BY total DESC ;