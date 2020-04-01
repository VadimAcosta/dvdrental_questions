-- Per employee, how much revenue has each employee realized from DVD rentals, 
-- and how many transactions have each employee handled?

SELECT 
	staff_id, 
	sum (amount) as "total_revenue",
	COUNT (*) as "number_of_transactions"
FROM payment 	
	GROUP BY 1
	ORDER BY 1;

