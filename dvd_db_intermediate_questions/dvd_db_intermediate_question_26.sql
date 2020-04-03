-- Get the average purchase for each customer, 
-- as well as the standard deviation.

-- Which customer is the most / least predictable in their behavior?
-- hint: think about standard deviation.

-- Most Predictable 

SELECT 
	customer_id, 
	AVG(amount), 
	stddev_samp(amount) as std
FROM payment
GROUP BY customer_id
ORDER BY std DESC
LIMIT 1;

-- Least Predictable 

SELECT 
	customer_id, 
	AVG(amount), 
	stddev_samp(amount) as std
FROM payment
GROUP BY customer_id
ORDER BY std
LIMIT 1;