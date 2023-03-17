-- Create a new database called imdb
drop database if exists imdb;
create database imdb;
use imdb;

-- Create tables: film (film_id, title, description, release_year); actor (actor_id, first_name, last_name) , film_actor (actor_id, film_id)
--    Use autoincrement id
--    Create PKs
CREATE TABLE film (
  film_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  release_year YEAR
);

CREATE TABLE actor (
  actor_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE film_actor (
  -- film_actor_id INT AUTO_INCREMENT PRIMARY KEY,
  actor_id INT,
  film_id INT,
  PRIMARY KEY (actor_id, film_id),
  FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
  FOREIGN KEY (film_id) REFERENCES film(film_id)
);

-- Alter table add column last_update to film and actor
ALTER TABLE film ADD COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE actor ADD COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- Alter table add foreign keys to film_actor table
ALTER TABLE film_actor ADD FOREIGN KEY (actor_id) REFERENCES actor(actor_id);

ALTER TABLE film_actor ADD FOREIGN KEY (film_id) REFERENCES film(film_id);


-- Insert some actors, films and who acted in each film
INSERT INTO actor (first_name, last_name) VALUES ('Johnny', 'Depp'), ('Tom', 'Hanks'), ('Meryl', 'Streep'), ('Leonardo', 'DiCaprio');

INSERT INTO film (title, description, release_year) VALUES ('Pirates of the Caribbean: The Curse of the Black Pearl', 'Blacksmith Will Turner teams up with eccentric pirate "Captain" Jack Sparrow to save his love, the governor\'s daughter, from Jack\'s former pirate allies, who are now undead.', 2003), ('Forrest Gump', 'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.', 1994), ('The Devil Wears Prada', 'A smart but sensible new graduate lands a job as an assistant to Miranda Priestly, the demanding editor-in-chief of a high fashion magazine.', 2006), ('The Wolf of Wall Street', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.', 2013);

INSERT INTO film_actor (actor_id, film_id) VALUES (1, 1), (2, 2), (3, 3), (4, 4), (1, 4), (3, 4);


SELECT * FROM film;
SELECT * FROM actor;
SELECT * FROM film_actor;
