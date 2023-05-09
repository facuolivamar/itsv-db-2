use sakila;

SHOW TABLES;

-- SELECT title, rating, length
-- FROM film
-- WHERE length > 100 AND rating = 'G';

-- SELECT title, `length` FROM film
-- WHERE `length` BETWEEN 100 AND 120;

-- SELECT city, district
-- FROM address, city
-- WHERE address.city_id = city.city_id;

-- SELECT title, name, length
-- FROM film, `language`
-- WHERE film.language_id = language.language_id
-- AND film.`length` > 100 AND language.name = 'English'

-- SELECT title, film_category.category_id
--  FROM film, film_category, category
-- WHERE film.film_id = film_category.film_id 
--   AND film_category.category_id = category.category_id;

-- SELECT title, special_features, rental_rate, name
--  FROM film, film_category, category
-- WHERE film.film_id = film_category.film_id 
--   AND film_category.category_id = category.category_id
-- ORDER BY rental_rate ASC;

-- SELECT title, special_features, rental_rate, name
--  FROM film, film_category, category
-- WHERE film.film_id = film_category.film_id 
--   AND film_category.category_id = category.category_id
-- ORDER BY rental_rate DESC, special_features ASC;

-- SELECT * FROM actor
-- LIMIT 10;

