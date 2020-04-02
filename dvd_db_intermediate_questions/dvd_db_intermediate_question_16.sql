-- Returns the average of the amount of stock each store has in their inventory. 

-- Subquery

SELECT ROUND (AVG(stock),2)
FROM (SELECT COUNT(inventory_id) as stock
      FROM inventory
           GROUP BY store_id) as store_stock;

--CTE

WITH store_stock AS (
	SELECT COUNT(inventory_id) as stock
	FROM inventory
	    GROUP BY store_id)
	

SELECT ROUND (AVG(stock),2)
FROM store_stock;
