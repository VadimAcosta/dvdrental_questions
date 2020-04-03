-- Get the average purchase per employee, as well as the standard deviation.


SELECT 
	staff_id, 
	AVG(amount), 
	stddev_samp(amount)
FROM payment
	GROUP BY staff_id;