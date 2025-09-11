-- Create film table
CREATE TABLE film (
    film_id INT PRIMARY KEY,
    title VARCHAR(100),
    description VARCHAR(255),
    length INT,
    rental_rate DECIMAL(4,2),
    replacement_cost DECIMAL(5,2)
);

-- Create customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Sample data for film table
INSERT INTO film (film_id, title, description, length, rental_rate, replacement_cost)
VALUES
(1, 'The Matrix', 'A computer hacker learns about the true nature of reality', 136, 3.99, 19.99),
(2, 'Inception', 'A thief who steals corporate secrets through dream-sharing', 148, 4.99, 24.99),
(3, 'Toy Story', 'A story about toys coming to life', 81, 2.99, 14.99),
(4, 'Interstellar', 'A team travels through a wormhole in space', 169, 4.99, 29.99),
(5, 'The Godfather', 'The aging patriarch transfers control of his empire', 175, 3.99, 19.99),
(6, 'The Shawshank Redemption', 'Two imprisoned men bond over years', 142, 2.99, 12.99),
(7, 'Finding Nemo', 'A clownfish searches for his lost son', 100, 0.99, 12.99);

-- Sample data for customer table
INSERT INTO customer (customer_id, first_name, last_name)
VALUES
(1, 'Mary', 'Smith'),
(2, 'John', 'Doe'),
(3, 'Alice', 'Johnson'),
(4, 'Bob', 'Brown'),
(5, 'Mary', 'Williams');

CREATE TABLE actor (
    actor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


INSERT INTO actor (actor_id, first_name, last_name)
VALUES
(1, 'Penelope', 'Guiness'),
(2, 'Nick', 'Wahlberg'),
(3, 'Ed', 'Chase'),
(4, 'Johnny', 'Depp'),
(5, 'Scarlett', 'Johansson'),
(6, 'Penelope', 'Cruz');


-- Select all columns from the film table where replacement_cost is between 12.99 and 16.99
-- Note: BETWEEN is inclusive, so it includes 12.99 and 16.99
SELECT *
FROM film
WHERE replacement_cost BETWEEN 12.99 AND 16.99;

-- Select first_name and last_name where first_name is Penelope, Nick, or Ed
SELECT first_name, last_name
FROM actor
WHERE first_name IN ('Penelope', 'Nick', 'Ed');


-- Select all columns from the film table where rental_rate is 0.99, 2.99, or 4.99 
-- AND replacement_cost is 12.99, 15.99, or 28.99
SELECT *
FROM film
WHERE rental_rate IN (0.99, 2.99, 4.99)
  AND replacement_cost IN (12.99, 15.99, 28.99);
