-- List all films that have the rating that is biggest category 
-- (ie. rating with the highest count of films)

SELECT 
	title, 
	rating
FROM film
	WHERE rating = (SELECT rating 
			FROM film
			    GROUP BY rating
			    ORDER BY COUNT(*)
			    LIMIT 1);