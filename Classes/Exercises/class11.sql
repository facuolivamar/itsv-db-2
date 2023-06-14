-- Exercises
-- Find all the film titles that are not in the inventory.
-- SELECT film.film_id, film.title
-- FROM film
-- JOIN inventory ON film.film_id = inventory.film_id
-- GROUP BY film.film_id
-- HAVING film.film_id NOT IN (
--     SELECT i2.film_id
--     FROM inventory AS i2
--     JOIN inventory ON f2.film_id = inventory.film_id
-- ); MAL ( uso JOIN al pedo )

SELECT film.title
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL;
-- chatGPT

SELECT f1.film_id, f1.title
FROM film AS f1
WHERE f1.film_id NOT IN (
    SELECT i1.film_id
    FROM inventory AS i1
);
-- propio

-- Find all the films that are in the inventory but were never rented.
-- Show title and inventory_id.
-- This exercise is complicated.
-- hint: use sub-queries in FROM and in WHERE or use left join and ask if one of the fields is null

SELECT i1.film_id, f1.title, i1.inventory_id
FROM film AS f1
JOIN inventory AS i1 USING ( film_id )
WHERE i1.inventory_id NOT IN(
    SELECT r1.inventory_id
    FROM rental AS r1
);
-- propio

SELECT f.film_id, f.title
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.inventory_id IS NULL;
-- chatGPT

-- Generate a report with:
-- customer (first, last) name, store id, film title,
-- when the film was rented and returned for each of these customers
-- order by store_id, customer last_name
SELECT c.first_name, c.last_name, c.store_id, f.title, r.rental_date, r.return_date
FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
ORDER BY c.store_id, c.last_name;


-- Show sales per store (money of rented films)
-- show store's city, country, manager info and total sales (money)
-- (optional) Use concat to show city and country and manager first and last name

SELECT store.store_id, SUM(payment.amount) AS store_sales, CONCAT(city.city, " ", country.country) AS location, CONCAT(staff.first_name, " ", staff.last_name) as manager
FROM payment
JOIN customer ON customer.customer_id = payment.customer_id
JOIN store ON store.store_id = customer.store_id
JOIN staff ON store.manager_staff_id = staff.staff_id
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY store.store_id;
-- propio

SELECT CONCAT(city.city, ', ', country.country) AS location,
       CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name,
       SUM(payment.amount) AS total_sales
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
JOIN staff AS manager ON store.manager_staff_id = manager.staff_id
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;
-- chatGPT ESTA MAL


-- Which actor has appeared in the most films?
SELECT CONCAT(a.first_name, " ", a.last_name) AS actor_name, COUNT(*) AS films
FROM actor AS a
JOIN film_actor ON a.actor_id = film_actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
GROUP BY a.actor_id
HAVING films >= ALL(
    SELECT COUNT(*) AS films2
    FROM actor AS a2
    JOIN film_actor ON a2.actor_id = film_actor.actor_id
    JOIN film ON film.film_id = film_actor.film_id
    GROUP BY a2.actor_id
) ;

