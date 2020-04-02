-- find all films that mention squirrels in the description

SELECT *
FROM film
	WHERE LOWER(description) LIKE '%squirrel%';