-- How might you construct a query to generate a list of 
-- movies to recommend to customers that they haven't rented yet,  
-- based on the customer's favorite genres, according to their rental history?

WITH
rental_data AS (
    SELECT 
        film_category.category_id AS category_id,
        category.name AS genre,
        film.film_id AS film_id,
        film.title AS film_title,
        rental.rental_id AS Rental_ID,
        rental.customer_id AS customer_id,
        customer.first_name AS first_name,
        customer.last_name As last_name
        FROM category 
    INNER JOIN film_category ON category.category_id = film_category.category_id
    INNER JOIN film ON film_category.film_id = film.film_id
    INNER JOIN inventory ON film.film_id = inventory.inventory_id
    INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
    INNER JOIN customer ON rental.customer_id = customer.customer_id
    ORDER BY customer_id
), 
preferred_genre_customer AS (
    WITH customer_genre_count AS (
        SELECT
            customer.customer_id AS customer_id,
            category.name AS genre,
            COUNT(rental.Rental_ID) AS rental_count
            FROM category 
            JOIN film_category ON category.category_id = film_category.category_id
            JOIN film ON film_category.film_id = film.film_id
            JOIN inventory ON film.film_id = inventory.inventory_id
            JOIN rental ON inventory.inventory_id = rental.inventory_id
            JOIN customer ON rental.customer_id = customer.customer_id
            GROUP BY customer.customer_id, category.name
            ORDER BY customer.customer_id ASC, rental_count DESC)
    SELECT DISTINCT
    customer_id,
    FIRST_VALUE (genre) 
        OVER (
            PARTITION BY customer_id
            ORDER BY rental_count DESC) AS preferred_genre
    FROM customer_genre_count
    ORDER BY customer_id
)
SELECT DISTINCT
    rental_data.customer_id AS customer_id,
    rental_data.first_name AS first_name,
    rental_data.last_name AS last_name,
    preferred_genre_customer.preferred_genre AS preferred_genre,
    FIRST_VALUE (rental_data.film_title)
        OVER (
            PARTITION BY rental_data.customer_id
            ORDER BY COUNT(rental_data.rental_id) DESC) AS suggested_movie
    FROM rental_data
        JOIN preferred_genre_customer ON rental_data.customer_id = preferred_genre_customer.customer_id
    WHERE rental_data.film_id != rental_data.customer_id
    GROUP BY    rental_data.customer_id, 
                rental_data.first_name, 
                rental_data.last_name, 
                preferred_genre_customer.preferred_genre, 
                rental_data.film_title

Potential Solution ADV1


SELECT r.cust, r.genre
FROM    (SELECT cust.customer_id AS cust,
        cat.name as genre,
        COUNT(cat.name) AS count_per_genre,
        RANK() OVER (PARTITION BY cust.customer_id ORDER BY COUNT(cat.name) DESC) AS RANK
        FROM (SELECT * FROM customer WHERE active = 0) cust
        JOIN rental AS rent ON cust.customer_id = rent.customer_id
        JOIN inventory AS inv ON rent.inventory_id = inv.inventory_id
        JOIN film ON inv.film_id = film.film_id
        JOIN film_category AS fcat ON film.film_id = fcat.film_id
        JOIN category AS cat ON fcat.category_id = cat.category_id
        GROUP BY 1, 2
        ORDER BY 1, 3 DESC) r
WHERE r.rank=1;
