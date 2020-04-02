-- Show the payment_id's of all transactions after or on May 1st 2007

SELECT payment_date 
From payment
	WHERE payment_date > '2007-05-01'
	ORDER BY payment_date DESC;