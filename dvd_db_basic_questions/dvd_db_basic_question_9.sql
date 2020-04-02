-- English films for todlers
-- return all films with language ID of 1 and is rated G

SELECT *
FROM film
	WHERE language_id = 1 
	AND rating = 'G';