-- Family friendly English films
-- return all films with language ID of 1 and is rated G, PG, or PG-13

SELECT *
FROM film
	WHERE language_id = 1 
	AND rating IN ('G', 'PG', 'PG-13');