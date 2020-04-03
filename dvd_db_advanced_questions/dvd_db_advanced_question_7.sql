-- Return the titles and descriptions of all films, with a new column "Holiday",
-- that contains the holiday referenced in the film, if any, otherwise is blank.
-- all holiday's welcome :) 

-- EXAMPLE: 
-- title: "Fiction Christmas" -> 'Christmas'
-- description: "The story of a chritmas elf who ...." --> 'Christmas'
-- "Something About Mary" --> ""

-- BONUS: return all of the holiday films first, and sort all films with their 
-- respective holiday category in alphabetical order.

-- BONUS BONUS:
-- Our marketing team is doing a holiday promo. All holiday films 1/2.
-- Can you return the same results, but with the price reflecting the discount?

-- Feel free to peek at your previous warmup to remind yourself of the syntax.

-- HINTS:

-- get the title and descriptiom of all films.
SELECT title, description 
FROM film;

-- Set up the logic to check if a film is a holiday film.
SELECT title, description 
FROM film
WHERE title ILIKE '%halloween%' OR
	  description ILIKE '%halloween%';

  
-- CREATE the CASE WHEN LOGIC
-- CASE
-- WHEN (condition) THEN <output>
-- WHEN (condition) THEN <output>
-- ELSE <output>
-- END as <alias>

-- EXAMPLE:
--  SELECT 
-- 	name,
--   	CASE 
--      WHEN (monthlymaintenance > 100) THEN 'expensive'
--  	ELSE 'cheap'
--  	END AS cost <<-- this whole thing outputs a column ('cost') with output ('expensive','cheap')
-- 						depending on the condition being met in each row
--  FROM ...

SELECT title, description,
	CASE
	WHEN title ILIKE '%halloween%' OR description ILIKE '%halloween%' THEN 'Halloween'
	WHEN title ILIKE '%christmas%' OR description ILIKE '%christmas%' THEN 'Christmas'
	WHEN title ILIKE '%valentine%' OR description ILIKE '%valentine%' THEN 'Valentines Day'
	ELSE ''
	END as holiday
FROM film;

-- Do the previous query, but return all of the holiday films first, and sort all films with their 
-- respective holiday category in alphabetical order.
SELECT title, description,
	CASE
	WHEN title ILIKE '%halloween%' OR description ILIKE '%halloween%' THEN 'Halloween'
	WHEN title ILIKE '%christmas%' OR description ILIKE '%christmas%' THEN 'Christmas'
	WHEN title ILIKE '%valentine%' OR description ILIKE '%valentine%' THEN 'Valentines Day'
	ELSE ''
	END as holiday
FROM film
ORDER BY holiday DESC, title;

-- Apply the promo by wrapping the previous query in a CTE, then doing another CASE WHEN statement
WITH with_holidays AS (
SELECT title, description, rental_rate,
	CASE
	WHEN title ILIKE '%halloween%' OR description ILIKE '%halloween%' THEN 'Halloween'
	WHEN title ILIKE '%christmas%' OR description ILIKE '%christmas%' THEN 'Christmas'
	WHEN title ILIKE '%valentine%' OR description ILIKE '%valentine%' THEN 'Valentines Day'
	ELSE ''
	END as holiday
FROM film
ORDER BY holiday DESC, title)
SELECT *,
	CASE
	WHEN holiday = '' THEN rental_rate
	ELSE ROUND(rental_rate/2, 2)
	END as promo
FROM with_holidays;