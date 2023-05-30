use sakila;


## Conditions
SELECT title, rating, length
FROM film
WHERE length > 100;

SELECT title, `length` FROM film
WHERE `length` BETWEEN 100 AND 120;


## Mutilple Tables
SELECT city, district
FROM address, city
WHERE address.city_id = city.city_id;


## Adding distinct
SELECT country, city
FROM address, city, country
WHERE address.city_id = city.city_id
AND city.country_id = country.country_id;


## Conditions with columns in different tables 
SELECT title, name
FROM film, `language`
WHERE film.language_id = language.language_id
AND film.`length` > 100 AND language.name = 'English';


## Ambigous column names
SELECT title, film_category.category_id
 FROM film, film_category, category
WHERE film.film_id = film_category.film_id 
  AND film_category.category_id = category.category_id;
 

## Adding Order BY
SELECT title, special_features, rental_rate, name
 FROM film, film_category, category
WHERE film.film_id = film_category.film_id 
  AND film_category.category_id = category.category_id
ORDER BY rental_rate DESC;

### More than one column
SELECT title, special_features, rental_rate, name
 FROM film, film_category, category
WHERE film.film_id = film_category.film_id 
  AND film_category.category_id = category.category_id
ORDER BY rental_rate DESC, special_features ASC;

## Using Limit
SELECT * FROM actor
LIMIT 10;


## Like

SELECT *
FROM film
WHERE special_features LIKE '%Trailers%';

SELECT *
FROM film
WHERE special_features LIKE '%Trailers%';
-- When searching for characters _ %, they have to be escaped with \ (default escape character)

SELECT * FROM address
WHERE address LIKE '%\_%';

## Arithmetics
SELECT title, description, rental_rate * 150 AS "In Pesos" 
FROM film;

SELECT title, description, rental_rate * 150 AS "In Pesos" 
FROM film;