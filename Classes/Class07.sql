
USE sakila;

SELECT
    f.title,
    f.rating,
    f.length
FROM
    film f
WHERE
    f.length =(
        SELECT
            MIN(f2.length)
        FROM
            film f2
    );

SELECT
    f.title,
    f.rating,
    f.length
FROM
    film f
WHERE
    f.length < ALL(
        SELECT
            MIN(f2.length)
        FROM
            film f2
    );


SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    (
        SELECT
            DISTINCT p.amount
        FROM
            payment p
        WHERE
            c.customer_id = p.customer_id
            AND p.amount <= ALL (
                SELECT
                    p2.amount
                FROM
                    payment p2
                WHERE
                    c.customer_id = p2.customer_id
            )
    ) AS lowest_payment
FROM
    customer c;


SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    (
        SELECT
            MIN(p.amount)
        FROM
            payment p
        WHERE
            c.customer_id = p.customer_id
    ) as lowest_payment,
    (
        SELECT
            a.address
        FROM
            address a
        WHERE
            c.address_id = a.address_id
    )
FROM
    customer c;


SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    CONCAT(max(p.amount), '  ', min(p.amount)) AS 'Max Min'
FROM
    customer c,
    payment p
WHERE
    c.customer_id = p.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;