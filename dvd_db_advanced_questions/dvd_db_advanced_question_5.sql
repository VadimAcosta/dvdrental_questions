-- Get all actors that have been in the same films as the most popular actor
-- OPTION: Try to get it all in one go, or do this in steps (see 1-3)

-- 1. Get the actor_id of the most popular actor (ie the actor who as been in the most films)

-- 2. Using the answer from above (actor_id 107), get a list of all the films that
-- actor has been in.

-- 3. USING the list from the previous answer (going to have to use a CTE or subquery),
-- get a list of the names of all the actors that have been in those films 
-- (ie all the actors that have acted with the most popular actor)
-- BONUS: exclude the most popular actor from the list.


-- 4. Can you do all of the above in one SQL execution (using multiple subqueries/CTE's)?
-- Get all actors that have been in the same films as the most popular actor
-- BONUS: exclude the most popular actor from the list.
                                                        
                                                

--ANSWER

-- Get all actors that have been in the same films as the most popular actor
-- OPTION: Try to get it all in one go, or do this in steps (see 1-3)

                                                        
-- 1. Get the actor_id of the most popular actor (ie the actor who as been in the most films)
SELECT a.actor_id, COUNT(*)
FROM film_actor as fa
	JOIN film as f ON fa.film_id=f.film_id
	JOIN actor as a ON fa.actor_id=a.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(*) DESC
LIMIT 1;

                                                        
-- 2. Using the answer from above (actor_id 107), get a list of all the films that
-- actor has been in.

SELECT f.film_id, fa.actor_id
FROM film as f
JOIN film_actor as fa ON f.film_id = fa.film_id
WHERE fa.actor_id = 107;

                                                        
-- 3. USING the list from the previous answer (going to have to use a CTE or subquery),
-- get a list of the names of all the actors that have been in those films 
-- (ie all the actors that have acted with the most popular actor)
-- BONUS: exclude the most popular actor from the list.
WITH top_actor AS (
SELECT a.actor_id, COUNT(*)
FROM film_actor as fa
	JOIN film as f ON fa.film_id=f.film_id
	JOIN actor as a ON fa.actor_id=a.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(*) DESC
LIMIT 1)
,
films_list AS (
SELECT f.film_id, fa.actor_id
FROM film as f
JOIN film_actor as fa ON f.film_id = fa.film_id
WHERE fa.actor_id IN (SELECT actor_id FROM top_actor)
)

SELECT DISTINCT fa.actor_id, a.first_name||' '||a.last_name as name
FROM film as f
	JOIN film_actor as fa ON f.film_id=fa.film_id
	JOIN actor as a ON a.actor_id=fa.actor_id
WHERE f.film_id IN (SELECT film_id FROM films_list) AND
	fa.actor_id != (SELECT actor_id FROM top_actor);

                                                        
-- 4. Can you do all that in one SQL execution (using multiple subqueries/CTE's)?
-- BONUS: exclude the most popular actor from the list.
-- Same as above

