--Which are the 10 kids films with the longest description?
-- G, PG, PG-13
--hint: google "SQL count length of string"

SELECT *
FROM film
	WHERE rating IN ('G','PG','PG-13')
	ORDER BY LENGTH (description)
LIMIT 10;