-- find all film with 'Fred' in the title

SELECT *
FROM film
	WHERE LOWER(title) LIKE '%fred%';

--find all films that mention squirrels in the description

SELECT *
FROM film
	WHERE LOWER(description) LIKE '%squirrel%';

--find the intersection of the two previous subqueries
-- hint: there are two

SELECT *
FROM film
	WHERE LOWER(title) LIKE '%fred%'

INTERSECT

SELECT *
FROM film
	WHERE LOWER(description) LIKE '%squirrel%';

SELECT *
FROM film;