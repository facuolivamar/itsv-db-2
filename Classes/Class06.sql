USE sakila;

#1
SELECT
    DISTINCT a1.first_name,
    a1.last_name,
    a1.actor_id
FROM
    actor a1,
    actor a2
WHERE
    a1.last_name = a2.last_name
ORDER BY
    a1.last_name;

#2
SELECT
    first_name,
    last_name,
    actor_id
FROM
    actor
WHERE
    EXISTS (
        SELECT
            actor_id
        FROM
            film_actor
    );

#3 hay dos opciones
SELECT
    first_name,
    last_name
FROM
    customer c
WHERE
    1 =(
        SELECT
            COUNT(*)
        FROM
            rental r
        WHERE
            c.customer_id = r.customer_id
    );

SELECT
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.customer_id NOT IN (
        SELECT
            r.customer_id
        FROM
            rental r
        GROUP BY
            r.customer_id
        HAVING
            count(*) > 1
    )
order by
    c.customer_id;

#4 Find customers that rented more than one film
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    (
        SELECT
            COUNT(*)
        FROM
            rental re
        WHERE
            c.customer_id = re.customer_id
    )
FROM
    customer c
WHERE
    1 < (
        SELECT
            COUNT(*)
        FROM
            rental r
        WHERE
            c.customer_id = r.customer_id
    );

#5 List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'
SELECT
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    actor_id IN(
        SELECT
            fa.actor_id
        FROM
            film_actor fa
        WHERE
            fa.film_id IN(
                SELECT
                    f.film_id
                FROM
                    film f
                WHERE
                    title LIKE 'BETRAYED REAR'
                    OR title LIKE 'CATCH AMISTAD'
            )
    );

#6 List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'
SELECT
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.actor_id IN(
        SELECT
            fa.actor_id
        FROM
            film_actor fa
        WHERE
            fa.film_id IN(
                SELECT
                    f.film_id
                FROM
                    film f
                WHERE
                    title LIKE 'BETRAYED REAR'
            )
    )
    AND a.actor_id NOT IN(
        SELECT
            fa.actor_id
        FROM
            film_actor fa
        WHERE
            fa.film_id IN(
                SELECT
                    f.film_id
                FROM
                    film f
                WHERE
                    title LIKE 'CATCH AMISTAD'
            )
    );

#7 List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'
SELECT
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.actor_id IN(
        SELECT
            fa.actor_id
        FROM
            film_actor fa
        WHERE
            fa.film_id IN(
                SELECT
                    f.film_id
                FROM
                    film f
                WHERE
                    title LIKE 'BETRAYED REAR'
            )
    )
    AND a.actor_id IN(
        SELECT
            fa.actor_id
        FROM
            film_actor fa
        WHERE
            fa.film_id IN(
                SELECT
                    f.film_id
                FROM
                    film f
                WHERE
                    title LIKE 'CATCH AMISTAD'
            )
    );

#8 List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'
SELECT
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.actor_id NOT IN(
        SELECT
            fa.actor_id
        FROM
            film_actor fa
        WHERE
            fa.film_id IN(
                SELECT
                    f.film_id
                FROM
                    film f
                WHERE
                    title LIKE 'BETRAYED REAR'
            )
    )
    OR a.actor_id NOT IN(
        SELECT
            fa.actor_id
        FROM
            film_actor fa
        WHERE
            fa.film_id IN(
                SELECT
                    f.film_id
                FROM
                    film f
                WHERE
                    title LIKE 'CATCH AMISTAD'
            )
    );
# Ejercicio de practica
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    GROUP_CONCAT(f.title)
FROM
    customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
WHERE
    1 < (
        SELECT
            COUNT(*)
        FROM
            rental r
        WHERE
            c.customer_id = r.customer_id
    )
GROUP BY
    c.customer_id;