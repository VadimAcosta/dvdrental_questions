--Which are the 10 longest R rated movies?

SELECT *
FROM film
	WHERE rating='R'
	ORDER BY length DESC
LIMIT 10;

-- What are the NEXT 10 longest R rated movies?
-- hint: google "how to get next 10 records in sql"

SELECT *
FROM film
	WHERE rating='R'
	ORDER BY length DESC
LIMIT 10 OFFSET 10;