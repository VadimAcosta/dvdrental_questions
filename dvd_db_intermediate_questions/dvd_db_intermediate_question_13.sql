-- Creates a list of customer's and there total spendings out of customers who are currently
-- active and shop at store #1

SELECT customer_id, SUM(amount)
FROM payment 
WHERE customer_id IN (SELECT customer_id
		      FROM customer
			  WHERE store_id = 1 AND active = 0
			  ORDER BY last_update)
   			  GROUP BY customer_id;
