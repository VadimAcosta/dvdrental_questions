--List the customer ID’s of ALL customers who have spent more money than $100 in their life.

WITH customer_totals AS 
(
  SELECT customer_id, 
         SUM(amount) as total
  FROM payment
  	 GROUP BY customer_id
)

SELECT 
	customer_id, 
	total 
FROM customer_totals 
	WHERE total > 100;