-- get all customers whose first names contain 'dan' (eg Dan, Daniel, Jordan)

SELECT *
from customer 
	WHERE LOWER(first_name) LIKE '%dan%';