USE sakila;

-- Exercises:
-- Get the amount of cities per country in the database. Sort them by country, country_id.

SELECT country.country, country.country_id, COUNT(*) as amountOfCities
FROM country
JOIN city ON city.country_id = country.country_id
GROUP BY city.country_id
HAVING COUNT(*)
ORDER BY country.country, country.country_id;

-- Get the amount of cities per country in the database. Show only the countries with more than 10 cities, order from the highest amount of cities to the lowest
SELECT country.country, country.country_id, COUNT(*) as amountOfCities
FROM country
JOIN city ON city.country_id = country.country_id
GROUP BY city.country_id
HAVING COUNT(*) > 10
ORDER BY COUNT(*) DESC;

-- Generate a report with customer (first, last) name, address, total films rented and the total money spent renting films.
SELECT customer.customer_id, customer.first_name, customer.last_name,
 SUM(payment.amount) AS moneySpent,
 COUNT(*) AS total_films_rented
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id;

-- Show the ones who spent more money first .
SELECT customer.customer_id, customer.first_name, customer.last_name,
 SUM(payment.amount) AS moneySpent,
 COUNT(*) AS total_films_rented
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY moneySpent DESC;

SELECT category.name, AVG(film.length) AS average_duration
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.category_id
HAVING average_duration > (
    SELECT AVG(film.length)
    FROM film
);


-- Order by average in descending order
SELECT category.name, AVG(film.length) AS average_duration
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.category_id
HAVING average_duration > (
    SELECT AVG(film.length)
    FROM film
)
ORDER BY average_duration DESC;


-- Show sales per film rating
SELECT film.rating, COUNT(*) AS total_sales
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.rating;

SELECT film.rating, SUM(payment.amount) AS total_sales
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON payment.rental_id = rental.rental_id
GROUP BY film.rating;
