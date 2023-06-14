-- SELECT A.ID, A.Nombre, B.Total 
-- FROM TablaA A 
-- JOIN (SELECT ID, COUNT() AS Total FROM TablaB GROUP BY ID HAVING COUNT() > 2) B 
-- ON A.ID = B.ID;

USE sakila;

-- Mostraron aquellas películas cuya cantidad de actores sea mayor o igual al promedio de actores por películas.
--  Además mostrar su cantidad de actores y una lista de los nombres de esos actores.

SELECT film_actor.film_id, film.title, COUNT(*) AS cantidad_de_actores, GROUP_CONCAT(actor.first_name) AS actores
FROM film_actor
JOIN film ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.film_id
HAVING cantidad_de_actores >=(
    SELECT AVG(cantidad_de_actores2)
    FROM (
        SELECT fa2.film_id, COUNT(*) AS cantidad_de_actores2
        FROM film_actor AS fa2
        GROUP BY fa2.film_id
    ) AS table2
)
ORDER BY film_actor.film_id;



-- Obtener las rentas de películas realizadas por clientes que tienen un número de pagos superior al promedio
--  de pagos por cliente.
-- Mostrar el nombre del cliente, el título de la película y la fecha de renta.


-- SELECT rental.rental_id, customer.customer_id
SELECT CONCAT(customer.first_name, " ", customer.last_name) AS name, film.title, rental.rental_date
FROM rental
JOIN customer ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE customer.customer_id IN (
    SELECT c2.customer_id
    FROM customer AS c2
    JOIN payment ON payment.customer_id = c2.customer_id
    GROUP BY c2.customer_id
    HAVING COUNT(*) > (
        SELECT AVG(cantidad_de_pagos2)
        FROM (
            SELECT c3.customer_id, COUNT(*) AS cantidad_de_pagos2
            FROM customer AS c3
            JOIN payment ON payment.customer_id = c3.customer_id
            GROUP BY c3.customer_id
        ) AS table2
    )
)
ORDER BY customer.customer_id;


-- Listar todos pagos cuyo monto no sea ni maximo ni minimo, que sean de los rentalsd cuyas IDs son
--  11, 56, 45, 34 y 89, y cuyo mes de retorno sea menor a todos los meses de retorno.

SELECT payment.rental_id, rental.return_date
FROM payment
JOIN rental ON rental.rental_id = payment.rental_id
WHERE payment.amount < (
    SELECT MAX(p2.amount)
    FROM payment AS p2)
    AND payment.amount > (
    SELECT MIN(p3.amount)
    FROM payment AS p3) AND payment.rental_id IN (11, 56, 45, 34, 89)
    AND rental.return_date < CURRENT_DATE
ORDER BY payment.rental_id;


-- 145