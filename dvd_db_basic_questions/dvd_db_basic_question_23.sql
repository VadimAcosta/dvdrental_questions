--How many films are as long as the longest film?
-- RETURN an exact number

SELECT length, COUNT(*)
FROM film
	GROUP BY length
	ORDER BY length DESC
LIMIT 1;