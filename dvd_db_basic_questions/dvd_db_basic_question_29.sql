-- find all film with 'Fred' in the title

SELECT *
FROM film
	WHERE LOWER(title) LIKE '%fred%';