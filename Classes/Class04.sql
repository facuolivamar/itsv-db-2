USE sakila;

-- 1 Show title and special_features of films that are PG-13
SELECT
	title,
	special_features
FROM
	film
WHERE
	rating = 'PG-13';

-- 2 Get a list of all the different films duration.
SELECT DISTINCT length from film;

-- 3 Show title, rental_rate and replacement_cost of films that have replacement_cost from 20.00 up to 24.00
SELECT
	title,
	rental_rate,
	replacement_cost
FROM
	film
WHERE
	replacement_cost BETWEEN 20.00
	AND 24.00;

-- #4 Show title, category and rating of films that have 'Behind the Scenes' as special_features
SELECT
	f.title,
    f.special_features,
	c.name as category,
	f.rating
FROM
	film as f
	INNER JOIN film_category as fc ON f.film_id = fc.film_id
	INNER JOIN category as c ON c.category_id = fc.category_id
WHERE
	f.special_features = 'Behind the Scenes';

-- 5 Show first name and last name of actors that acted in 'ZOOLANDER FICTION'
SELECT
	a.first_name,
	a.last_name
FROM
	film AS f
	INNER JOIN film_actor AS fa ON f.film_id = fa.film_id
	INNER JOIN actor AS a ON fa.actor_id = a.actor_id
WHERE
	f.title = "ZOOLANDER FICTION";

-- 6 Show the address, city and country of the store with id 1
SELECT
	ad.address,
	ci.city,
	co.country
FROM
	store as st
	INNER JOIN address as ad ON st.address_id = ad.address_id
	INNER JOIN city as ci ON ad.city_id = ci.city_id
	INNER JOIN country as co ON ci.country_id = co.country_id;

-- 7 Show pair of film titles and rating of films that have the same rating.
SELECT
	f1.title,
	f1.rating,
	f2.title,
	f2.rating
FROM
	film f1,
	film f2
WHERE
	f1.rating = f2.rating
	AND f1.film_id <> f2.film_id

-- 8 Get all the films that are available in store id 2 and the manager first/last name of this store (the manager will appear in all the rows).
SELECT
	f.title,
	sto.store_id,
  sta.first_name,
  sta.last_name
FROM
	film as f
	INNER JOIN inventory as inv ON f.film_id = inv.film_id
	INNER JOIN store as sto ON inv.store_id = sto.store_id
  INNER JOIN staff as sta ON sto.manager_staff_id = sta.staff_id
WHERE
  sto.store_id = 2;
