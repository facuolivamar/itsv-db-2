drop database if exists class01;
create database class01;
use class01;


CREATE TABLE contacts
( contact_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  last_name VARCHAR(30) NOT NULL,
  first_name VARCHAR(25),
  birthday DATE
);


ALTER TABLE contacts
  ADD column_drop varchar(40) NOT NULL
    AFTER contact_id;

ALTER TABLE contacts
  MODIFY last_name varchar(50) NULL;

ALTER TABLE contacts
  DROP COLUMN column_drop;

ALTER TABLE contacts
  RENAME TO people;

CREATE TABLE products
( product_name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  category VARCHAR(25) ,
  CONSTRAINT products_pk PRIMARY KEY (product_name, location)
);

CREATE TABLE inventory
( inventory_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  quantity INT,
  min_level INT,
  max_level INT
);


ALTER TABLE inventory ADD 
  CONSTRAINT fk_inventory_products
    FOREIGN KEY (product_name, location)
    REFERENCES products (product_name, location);


SELECT * FROM inventory;
SELECT * FROM products;
SELECT * FROM people;
