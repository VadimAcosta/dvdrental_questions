-- Our marketing analytics team has decided to do a promotion to get more customers to come into our store.
-- They've decided that they want all of the cheapest PG-13 films to now be rented at $0.10, 
-- and all PG-13 films in the NEXT HIGHER rental bracket above one dollar to now by rented at $1.00.
-- Return a list of all PG-13 films with the current and new rental rates - with films in the cheapest
-- rental bracket discounted to $0.10, and films in the rental bracket next above a dollar now being $1**. 

-- **To clarify - if the rental brackets were 0.99, 1.99, 2.99, 3.99, we want the new prices to be
-- 0.10, 1.00, 2.99, 3.99

-- HINT: you can hardcode the rental bracket rates (just typing in the number - eg 1.99) first to make sure 
-- you can get your CASE WHEN statement to work, THEN see if you can put it all together with softcoding 
-- (using a CTE/subquery to return the number - eg. 1.99)

-- HINTS:
-- get all PG-13 films
SELECT title, rental_rate
FROM film
WHERE rating = 'PG-13';

-- find the cheapest rental bracket, the cheapest rental_rate
SELECT DISTINCT rental_rate
FROM film
ORDER by rental_rate
LIMIT 1;

-- find the NEXT HIGHER rental_rate above $1
SELECT DISTINCT rental_rate
FROM film
WHERE rental_rate > 1
ORDER by rental_rate
LIMIT 1;

-- Go back and make a new column "new_rate", with a CASE WHEN statement to return the new price for all PG-13 films.
-- HINT: try hardcoding first
SELECT title, rental_rate,
	CASE
	WHEN rental_rate = 0.99 THEN 0.10
	WHEN rental_rate = 2.99 THEN 1
	ELSE rental_rate
	END AS new_rate
FROM film
WHERE rating = 'PG-13';





-- Do the previous query with softcoding (opposite of hardcoding)
WITH lowest_rate AS (
SELECT DISTINCT rental_rate
FROM film
ORDER by rental_rate
LIMIT 1
)
, rate_next_above_1 AS (
SELECT DISTINCT rental_rate
FROM film
WHERE rental_rate > 1
ORDER by rental_rate
LIMIT 1
)

SELECT title, rental_rate,
	CASE
	WHEN rental_rate = (SELECT * FROM lowest_rate) THEN 0.10
	WHEN rental_rate = (SELECT * FROM rate_next_above_1) THEN 1
	ELSE rental_rate
	END AS new_rate
FROM film
WHERE rating = 'PG-13';






-- OR AN ALTERNATIVE
WITH rental_brackets AS (
SELECT DISTINCT rental_rate
FROM film
ORDER by rental_rate
)
SELECT title, rental_rate,
	CASE
	WHEN rental_rate = (SELECT * FROM rental_brackets LIMIT 1) THEN 0.10
	WHEN rental_rate = (SELECT * FROM rental_brackets WHERE rental_rate > 1 LIMIT 1) THEN 1
	ELSE rental_rate
	END AS new_rate
FROM film
WHERE rating = 'PG-13';


-- A NESTED CASE WHEN - if you wanted to return a list of all films, but with the PG-13 films modified.
WITH rental_brackets AS (
SELECT DISTINCT rental_rate
FROM film
ORDER by rental_rate
)
SELECT title, rental_rate, 
	CASE 
	WHEN rating = 'PG-13' THEN 
		CASE
		WHEN rental_rate = (SELECT * FROM rental_brackets LIMIT 1) THEN 0.10
		WHEN rental_rate = (SELECT * FROM rental_brackets WHERE rental_rate > 1 LIMIT 1) THEN 1
		ELSE rental_rate
		END
	ELSE rental_rate
	END AS new_rate,
	rating
FROM film;