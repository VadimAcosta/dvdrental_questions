-- get all customers whose last names contain 'dan' (eg Dan, Daniel, Jordan) 

SELECT *
FROM customer 
	WHERE LOWER(last_name) LIKE '%dan%';