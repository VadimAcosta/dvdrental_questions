-- Nostalgic family friendly English films on a budget with a short attention span!:
-- return all films with language ID of 1 and is rated G, PG, or PG-13,
-- and have a rental rate less than $3 and a replacement cost less than $10,
-- and last less than an hour and a half long, from the year 2006 or earlier

SELECT *
FROM film
	WHERE language_id = 1 
	AND rating IN ('G', 'PG', 'PG-13') 
	AND rental_rate < 3 
	AND replacement_cost < 15 
	AND release_year <= 2006 
	AND length < 90;


-- BONUS
-- Of the films from the previous query, which ones talk about a 'Moose' in the description?

SELECT *
FROM film
	WHERE language_id = 1 
	AND rating IN ('G', 'PG', 'PG-13') 
	AND rental_rate < 3 
	AND replacement_cost < 15 
	AND release_year <= 2006 
	AND length < 90
	AND LOWER(description) LIKE '%moose%';