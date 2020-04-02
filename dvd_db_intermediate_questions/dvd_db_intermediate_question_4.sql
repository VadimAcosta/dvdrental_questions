-- List all purchases with the staff ID that has serviced the fewest transactions.
-- ie. the staff_id with the smallest COUNT(*)

SELECT *
FROM payment
	WHERE staff_id = 
	    (SELECT staff_id
	     FROM payment
	         GROUP BY staff_id
		 ORDER BY COUNT(*)
		 LIMIT 1);