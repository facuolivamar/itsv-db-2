USE sakila;
-- Exercises
-- List all the actors that share the last name. Show them in order
SELECT last_name, GROUP_CONCAT(first_name) AS each_actor_first_name, GROUP_CONCAT(last_name) AS each_actor_last_name
FROM actor
GROUP BY last_name 
HAVING COUNT(*) > 1 
ORDER BY last_name;

-- Find actors that don't work in any film
SELECT a1.actor_id, a1.first_name, a1.last_name
FROM actor AS a1
WHERE a1.actor_id NOT IN (
    SELECT a2.actor_id
    FROM actor AS a2
    JOIN film_actor ON a2.actor_id = film_actor.actor_id
);

-- Find customers that rented only one film
SELECT c.customer_id, c.first_name, c.last_name
FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(*) = 1;

-- Find customers that rented more than one film
SELECT c.customer_id, c.first_name, c.last_name
FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(*) > 1;

-- List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'
SELECT actor.actor_id,  actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
-- WHERE film.title LIKE "%BETRAYED REAR" OR film.title LIKE "%CATCH AMISTAD"
WHERE film.title IN ('BETRAYED REAR', 'CATCH AMISTAD')
ORDER BY actor.actor_id;

-- List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'
SELECT actor.actor_id,  actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'BETRAYED REAR' AND actor.actor_id NOT IN (
    SELECT actor.actor_id
    FROM actor
    JOIN film_actor ON actor.actor_id = film_actor.actor_id
    JOIN film ON film_actor.film_id = film.film_id
    WHERE film.title = 'CATCH AMISTAD'
    );

-- List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'
SELECT actor.actor_id,  actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'BETRAYED REAR' AND actor.actor_id IN (
    SELECT actor.actor_id
    FROM actor
    JOIN film_actor ON actor.actor_id = film_actor.actor_id
    JOIN film ON film_actor.film_id = film.film_id
    WHERE film.title = 'CATCH AMISTAD'
    );

-- List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'
SELECT actor.actor_id,  actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id NOT IN (
    SELECT actor.actor_id
    FROM actor
    JOIN film_actor ON actor.actor_id = film_actor.actor_id
    JOIN film ON film_actor.film_id = film.film_id
    WHERE film.title IN ('BETRAYED REAR', 'CATCH AMISTAD')
    );
