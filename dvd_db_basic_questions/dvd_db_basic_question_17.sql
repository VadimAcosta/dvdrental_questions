-- What rating ('PG', 'G', etc) has the least films?

SELECT 
	rating 
FROM film
	GROUP BY rating
	ORDER BY COUNT(*)
	LIMIT 1;