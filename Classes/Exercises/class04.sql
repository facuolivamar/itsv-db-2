USE sakila;

-- Show title and special_features of films that are PG-13

SELECT title, special_features
FROM film
WHERE film.rating = 'PG-13';

-- Get a list of all the different films duration.

SELECT DISTINCT film.length, film.title, film.film_id
FROM film
ORDER BY `length`;

-- Show title, rental_rate and replacement_cost of films that have replacement_cost from 20.00 up to 24.00


SELECT replacement_cost, title, rental_rate
FROM film
WHERE film.replacement_cost >= 20.00
AND film.replacement_cost <= 24.00
ORDER BY replacement_cost ASC;

-- Show title, category and rating of films that have 'Behind the Scenes' as special_features

-- category


SELECT film.title, category.name, film.rating, film.special_features
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE film.special_features LIKE '%Behind the Scenes%'
ORDER BY film.title;


-- Show first name and last name of actors that acted in 'ZOOLANDER FICTION'
SELECT actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title LIKE 'ZOOLANDER FICTION';

-- Show the address, city and country of the store with id 1
SELECT address.address, city.city, country.country
FROM store
JOIN address ON address.address_id = store.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON country.country_id = city.country_id
WHERE store.store_id = 1;

-- Show pair of film titles and rating of films that have the same rating.

SELECT f1.title, f1.rating, f2.title, f2.rating
FROM film as f1
JOIN film as f2 ON f1.rating = f2.rating AND f1.film_id <> f2.film_id;


-- Get all the films that are available in store id 2 and the manager first/last name of this store (the manager will appear in all the rows).

SELECT film.title, film.film_id, staff.first_name, staff.last_name
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN store ON inventory.store_id = store.store_id
JOIN staff ON store.store_id = staff.store_id
WHERE store.store_id = 2;
