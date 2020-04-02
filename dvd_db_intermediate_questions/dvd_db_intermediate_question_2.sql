-- What is the average customer lifetime spending?

-- With CTE
WITH customer_totals AS

(
	
SELECT 
	customer_id,
	SUM(amount) as total 
FROM payment 
	GROUP BY customer_id
)

SELECT 
	ROUND (AVG(total), 2)
FROM customer_totals; 


-- With Subquery

SELECT 
	ROUND (AVG(total),2)
FROM (SELECT SUM(amount) as total 
	  FROM payment 
	  GROUP BY customer_id) as customer_totals;