-- Get the actor_id of the most popular actor (ie the actor who as been in the most films)

SELECT a.actor_id, COUNT(*)
FROM film_actor as fa
	JOIN film as f ON fa.film_id=f.film_id
	JOIN actor as a ON fa.actor_id=a.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(*) DESC
LIMIT 1;