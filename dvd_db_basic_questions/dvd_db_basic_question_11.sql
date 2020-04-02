-- Family friendly English films on a budget:
-- return all films with language ID of 1 and is rated G, PG, or PG-13,
-- and have a rental rate less than $3 and a replacement cost less than $10

SELECT *
FROM film
	WHERE language_id = 1 
	AND rating IN ('G', 'PG', 'PG-13') 
	AND rental_rate < 3 
	AND replacement_cost < 15;