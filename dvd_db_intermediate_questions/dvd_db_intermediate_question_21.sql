--Which are the 10 longest R rated movies, SORTED IN ALPHABETICAL ORDER?
-- hint: might need a subquery

SELECT * 
FROM 
(
SELECT *
FROM film
	WHERE rating='R'
	ORDER BY length DESC
LIMIT 10
) as longest_10

ORDER BY title;