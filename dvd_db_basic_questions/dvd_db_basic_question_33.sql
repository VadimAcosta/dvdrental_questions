-- Get the average and standard deviation of purchase amounts in our database.

SELECT 
	AVG(amount), 
	stddev_samp(amount)
FROM payment;