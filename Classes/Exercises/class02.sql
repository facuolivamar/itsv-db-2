-- Create a new database called imdb
DROP DATABASE IF EXISTS imdb;
CREATE DATABASE imdb;
USE imdb;


-- Create tables: film (film_id, title, description, release_year); 
-- actor (actor_id, first_name, last_name) , 
-- film_actor (actor_id, film_id)

CREATE TABLE film (
    title varchar(25),
    description varchar(250),
    release_year year
);

CREATE TABLE actor (
    first_name varchar(25),
    last_name varchar(25)
);

CREATE TABLE film_actor (
    actor_id int,
    film_id int
);

-- Use autoincrement id
-- Create PKs
-- Alter table add column last_update to film and actor

ALTER TABLE film
  ADD COLUMN last_update DATE,
  ADD COLUMN film_id INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE actor
  ADD COLUMN last_update DATE,
  ADD COLUMN actor_id INT AUTO_INCREMENT PRIMARY KEY;

SELECT *
FROM film;


-- Alter table add foreign keys to film_actor table

ALTER TABLE film_actor
  ADD FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
  ADD FOREIGN KEY (film_id) REFERENCES film(film_id);


-- Insert some actors, films and who acted in each film

INSERT INTO film (title, description, release_year, last_update)
VALUES 
('film one', 'this is the film one', '2004', '2022-10-29'),
('film two', 'this is the film two', '2004', '2022-10-29'),
('film three', 'this is the film three', '2004', '2022-10-29');

INSERT INTO actor (first_name, last_name, last_update)
VALUES 
('Facundo', 'Oliva Marchetto', '2022-10-29'),
('Agustin', 'Oliva Marchetto', '2023-5-27'),
('Bautista', 'Oliva Marchetto', '2023-3-9');

INSERT INTO film_actor (actor_id, film_id)
VALUES
(1, 3),
(2, 2),
(3, 1);

-- SELECTs extra
-- SELECT * FROM film_actor, actor, film;

SELECT film.title, actor.first_name, actor.last_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id;

