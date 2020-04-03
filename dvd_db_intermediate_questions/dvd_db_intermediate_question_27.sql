-- what is the average and standard deviation for the number of 
-- purchases per customer?

WITH transactions_per_customer as 

(
 SELECT 
	customer_id, 
	COUNT(*)
FROM payment
GROUP BY customer_id
)

SELECT 
	AVG(count), 
	stddev_samp(count)
FROM transactions_per_customer;