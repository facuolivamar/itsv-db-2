-- Exercises
USE sakila;

-- Find the films with less duration, show the title and rating.
SELECT length, title, rating
FROM film 
WHERE length <= ALL (
    SELECT length 
    FROM film
    );

-- Write a query that returns the tiltle of the film which duration is the lowest. If there are more than one film with the lowest durtation, the query returns an empty resultset.


-- 
SELECT f1.length, GROUP_CONCAT(f1.title) AS title
FROM film AS f1
WHERE f1.length <= ALL (
    SELECT f2.length 
    FROM film AS f2
)
GROUP BY f1.length
HAVING COUNT(*) = 1;

-- Generate a report with list of customers showing the lowest payments done by each of them. Show customer information, the address and the lowest amount, provide both solution using ALL and/or ANY and MIN.

SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  a.address,
  MIN(p.amount) AS lowest_payment
FROM
  customer AS c
  JOIN address AS a ON c.address_id = a.address_id
  JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY
  c.customer_id,
  c.first_name,
  c.last_name,
  a.address
HAVING
  MIN(p.amount);

SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  a.address,
  p.amount AS lowest_payment
FROM
  customer AS c
  JOIN address AS a ON c.address_id = a.address_id
  JOIN payment AS p ON c.customer_id = p.customer_id
  WHERE p.amount <= ALL (
    SELECT amount
    FROM payment
    WHERE customer_id = c.customer_id
  );

-- Generate a report that shows the customer's information with the highest payment and the lowest payment in the same row.
SELECT c.customer_id, c.first_name, c.last_name, c.email,
    max_payment.amount AS highest_payment,
    min_payment.amount AS lowest_payment
FROM customer AS c

JOIN payment AS max_payment ON c.customer_id = max_payment.customer_id
JOIN payment AS min_payment ON c.customer_id = min_payment.customer_id

WHERE max_payment.amount = (
    SELECT MAX(amount) FROM payment WHERE customer_id = c.customer_id
)
AND min_payment.amount = (
    SELECT MIN(amount) FROM payment WHERE customer_id = c.customer_id
);

