## Aggregations

-- *  The MIN() function returns the smallest value of the selected column.

-- *  The MAX() function returns the largest value of the selected column.

-- *  The COUNT() function returns the number of rows that matches a specified criteria.

-- *  The AVG() function returns the average value of a numeric column.

-- *  The SUM() function returns the total sum of a numeric column.

USE sakila;

-- Find the minimum payment of users whose last name starts with R
SELECT MAX(amount)
  FROM customer, payment
 WHERE customer.customer_id = payment.customer_id
   AND customer.last_name LIKE 'R%';

--
SELECT COUNT(*)
  FROM inventory
  WHERE store_id = 1;

SELECT COUNT(DISTINCT film_id)
  FROM inventory
  WHERE store_id = 1;

-- wrong result
SELECT AVG(length)
  FROM film, inventory
 WHERE film.film_id = inventory.film_id
   AND inventory.store_id = 1;

-- right result
SELECT AVG (length)
  FROM film
 WHERE film_id IN (SELECT film_id
                    FROM inventory
 					WHERE store_id = 1);

-- same AS above
SELECT  str1.av
FROM ( SELECT AVG(length) av
         FROM film
        WHERE film_id IN (SELECT film_id
 		             	        	FROM inventory
 					                 WHERE store_id = 1)) AS str1;

SELECT other_stores.av
FROM ( SELECT AVG(length) av
         FROM film
        WHERE film_id NOT IN (SELECT film_id
 		             			FROM inventory
 					           WHERE store_id = 1)) AS other_stores;


-- complex example: Calculate diff between average film length
-- in store 1 vs other stores

SELECT  str1.av - other_stores.av
FROM (
SELECT AVG(length) av
  FROM film
 WHERE film_id IN (SELECT film_id
 					 FROM inventory
 					WHERE store_id = 1)) AS str1,
(SELECT AVG(length) av
  FROM film
 WHERE film_id NOT IN (SELECT film_id
 					 FROM inventory
 					WHERE store_id = 1)) AS other_stores;


-- Find films durations per rating and special_features
 SELECT rating, special_features, `length`
  FROM film
 ORDER BY rating, special_features;

-- Using other aggretation functions
SELECT rating, special_features, MIN(`length`), MAX(`length`)
  FROM film
 GROUP BY rating, special_features;

-- Working with aggregated columns on outer select.
SELECT mx - mn AS diff
FROM (SELECT rating, special_features, MIN(`length`) AS mn, MAX(`length`) AS mx
 	    FROM film
        GROUP BY rating, special_features) t1;


