-- Which actor has appeared in the most films?

SELECT 
	concat (act.first_name,' ', act.last_name) AS "name",
	COUNT(*)
FROM actor AS act
JOIN film_actor AS flact
ON act.actor_id = flact.actor_id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 1;