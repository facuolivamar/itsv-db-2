USE sakila;

-- SELECT *
--   FROM film
--       INNER JOIN `language`
--               ON film.language_id = `language`.language_id;
              
-- -- Try this              
-- SELECT * 
--   FROM `language`, film 
--  WHERE film.language_id = `language`.language_id;

-- SELECT *
--   FROM film
--       INNER JOIN `language`
--           USING (language_id);


SELECT * 
  FROM film 
       INNER JOIN film_category 
               ON film.film_id = film_category.film_id 
       INNER JOIN category 
               ON film_category.category_id = category.category_id; 

-- same?
SELECT *
  FROM film, film_category, category
 WHERE film.film_id = film_category.film_id
   AND film_category.category_id = category.category_id;               

-- with using
SELECT * 
  FROM film 
       INNER JOIN film_category 
            USING ( film_id ) 
       INNER JOIN category 
            USING ( category_id );               


-- natural join the same table... ???
SELECT *
  FROM actor a1
       NATURAL JOIN actor a2;

