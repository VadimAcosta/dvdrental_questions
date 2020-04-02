-- Returns the average customer lifetime spending, for each staff member.
-- HINT: you can work off the example

-- Subquery

SELECT staff_id, ROUND(AVG(total),2)
FROM (SELECT 
	  staff_id, 
	  SUM(amount) as total
      FROM payment 
	  GROUP BY customer_id, staff_id) as customer_totals
	GROUP BY staff_id;

-- CTE

WITH customer_totals AS 

(
SELECT 
	staff_id, 
	SUM(amount) as total
FROM payment 
	GROUP BY customer_id, staff_id
)

SELECT staff_id, ROUND (AVG(total),2)
FROM customer_totals
GROUP BY staff_id;