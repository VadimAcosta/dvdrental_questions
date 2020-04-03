-- find the cheapest rental bracket, the cheapest rental_rate

SELECT DISTINCT rental_rate
FROM film
	ORDER by rental_rate
	LIMIT 1;
