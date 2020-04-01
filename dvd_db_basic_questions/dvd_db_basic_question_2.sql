-- Figure out the average replacement cost of our movies, by rating

SELECT 
	DISTINCT (rating),
	ROUND (AVG (replacement_cost),2) AS "average_replacement_cost"
FROM film
	GROUP BY 1;