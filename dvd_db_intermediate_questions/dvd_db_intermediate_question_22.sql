-- Return all films that have the rating that is biggest category 
-- (ie. rating with the highest count of films)

WITH biggest_category AS 

(
SELECT rating 
FROM film
	GROUP BY rating
	ORDER BY COUNT(*) DESC
LIMIT 1
)


SELECT title, rating
FROM film
	WHERE rating = (SELECT * FROM biggest_category);