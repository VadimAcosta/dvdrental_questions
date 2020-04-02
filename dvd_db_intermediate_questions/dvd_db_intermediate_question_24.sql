-- get all customers whose first names contain 'dan' (eg Dan, Daniel, Jordan)

SELECT *
FROM customer 
	WHERE LOWER(first_name) LIKE '%dan%';

-- get all customers whose last names contain 'dan' (eg Dan, Daniel, Jordan) 

SELECT *
FROM customer 
	WHERE LOWER(last_name) LIKE '%dan%';

-- now add the results of the first query to the results of the second (UNION)

(
SELECT *
from customer 
	HERE LOWER(first_name) LIKE '%dan%'
)

UNION 

(
SELECT *
from customer 
	WHERE LOWER(last_name) LIKE '%dan%'
);

-- find customers exist in both queries
-- hint: there's one

(
SELECT *
FROM customer 
	WHERE LOWER(first_name) LIKE '%dan%'
)

INTERSECT

(
SELECT *
FROM customer 
	WHERE LOWER(last_name) LIKE '%dan%'
);