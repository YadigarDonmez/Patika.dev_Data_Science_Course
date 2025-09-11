CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country VARCHAR(100)
);


INSERT INTO country (country_id, country)
VALUES
(1, 'Australia'),
(2, 'Argentina'),
(3, 'Austria'),
(4, 'Canada'),
(5, 'Germany'),
(6, 'Finland'),
(7, 'Albania'),
(8, 'Brazil'),
(9, 'Japan'),
(10, 'Iceland');


-- Select countries where the name starts with 'A' and ends with 'a'
SELECT country
FROM country
WHERE country LIKE 'A%a';


-- Select countries with at least 6 characters and ending with 'n'
SELECT country
FROM country
WHERE LEN(country) >= 6
  AND country LIKE '%n';

-- Select titles that contain at least 4 'T' or 't' characters
SELECT title
FROM film
WHERE (LEN(UPPER(title)) - LEN(REPLACE(UPPER(title), 'T', ''))) >= 4;


-- Select all columns from the film table where the title starts with 'C', 
-- the title length is greater than 90, and rental_rate is 2.99
SELECT *
FROM film
WHERE title LIKE 'C%'
  AND LEN(title) > 90
  AND rental_rate = 2.99;


--HOMEWORK 4

CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100)
);

INSERT INTO city (city_id, city_name)
VALUES
(1, 'London'),
(2, 'Paris'),
(3, 'Berlin'),
(4, 'Rome'),
(5, 'Madrid'),
(6, 'New York'),
(7, 'Rio'),
(8, 'Reykjavik'),
(9, 'Rotterdam'),
(10, 'Riga');

-- Select distinct replacement_cost values from the film table
SELECT DISTINCT replacement_cost
FROM film;

-- Count how many distinct replacement_cost values are in the film table
SELECT COUNT(DISTINCT replacement_cost) AS distinct_count
FROM film;

-- Count how many films have a title starting with 'T' and rating equal to 'G'
SELECT COUNT(*) AS count_titles
FROM film
WHERE UPPER(title) LIKE 'T%'  -- Title starts with 'T' or 't'
  AND rating = 'G';            -- Rating is 'G'

  
 -- Count how many countries have names with exactly 5 characters
SELECT COUNT(*) AS count_countries
FROM country
WHERE LEN(country) = 5;


-- Count how many city names end with 'R' or 'r'
SELECT COUNT(*) AS count_cities
FROM city
WHERE UPPER(city_name) LIKE '%R';


--Homework 5

-- 1. Film names ending with 'n', top 5 longest films
WITH LongestFilms AS (
    SELECT TOP 5 *
    FROM film
    WHERE title LIKE '%n'
    ORDER BY length DESC
),
-- 2. Film names ending with 'n', 5 shortest films excluding the 5 shortest (6th to 10th)
ShortestFilms AS (
    SELECT *
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY length ASC) AS rn, *
        FROM film
        WHERE title LIKE '%n'
    ) AS t
    WHERE rn BETWEEN 6 AND 10
),
-- 3. Customers in store_id 1, ordered by last_name descending, top 4
TopCustomers AS (
    SELECT TOP 4 *
    FROM customer
    WHERE store_id = 1
    ORDER BY last_name DESC
    
 -- Homework 6
 
 -- Calculate the average rental_rate of all films
SELECT AVG(rental_rate) AS avg_rental_rate
FROM film;


-- Count films whose title starts with 'C'
SELECT COUNT(*) AS count_C_titles
FROM film
WHERE title LIKE 'C%';


-- Find the length of the longest film with rental_rate = 0.99
SELECT MAX(length) AS longest_length
FROM film
WHERE rental_rate = 0.99;


-- Count distinct replacement_cost values for films longer than 150 minutes
SELECT COUNT(DISTINCT replacement_cost) AS distinct_replacement_costs
FROM film
WHERE length > 150;


--Homework 7

-- Group films by rating and count how many films in each group
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;


-- Group films by replacement_cost and show only those with more than 50 films
SELECT replacement_cost, COUNT(*) AS film_count
FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50;


--Homewrok 8

-- 1️⃣ Create employee table
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    birthday DATE,
    email VARCHAR(100)
);

-- 2️⃣ Insert 50 example rows
INSERT INTO employee (id, name, birthday, email) VALUES
(1, 'Alice Smith', '1990-05-12', 'alice.smith@example.com'),
(2, 'Bob Johnson', '1985-09-23', 'bob.johnson@example.com'),
(3, 'Carol White', '1992-12-01', 'carol.white@example.com'),
(4, 'David Brown', '1988-03-17', 'david.brown@example.com'),
(5, 'Eva Green', '1995-07-30', 'eva.green@example.com'),
(6, 'Frank Black', '1991-02-11', 'frank.black@example.com'),
(7, 'Grace Blue', '1987-08-05', 'grace.blue@example.com'),
(8, 'Henry Yellow', '1993-11-19', 'henry.yellow@example.com'),
(9, 'Ivy Red', '1990-01-21', 'ivy.red@example.com'),
(10, 'Jack Purple', '1989-06-30', 'jack.purple@example.com'),
(11, 'Karen Gray', '1992-04-17', 'karen.gray@example.com'),
(12, 'Leo White', '1986-10-12', 'leo.white@example.com'),
(13, 'Mona Black', '1991-09-03', 'mona.black@example.com'),
(14, 'Nina Green', '1988-05-24', 'nina.green@example.com'),
(15, 'Oscar Blue', '1994-12-29', 'oscar.blue@example.com'),
(16, 'Pam Red', '1990-03-15', 'pam.red@example.com'),
(17, 'Quinn Purple', '1987-07-07', 'quinn.purple@example.com'),
(18, 'Rick Gray', '1993-08-21', 'rick.gray@example.com'),
(19, 'Sara White', '1992-02-25', 'sara.white@example.com'),
(20, 'Tom Black', '1989-12-30', 'tom.black@example.com'),
(21, 'Uma Green', '1995-11-10', 'uma.green@example.com'),
(22, 'Victor Blue', '1991-04-14', 'victor.blue@example.com'),
(23, 'Wendy Red', '1986-06-18', 'wendy.red@example.com'),
(24, 'Xander Purple', '1993-09-22', 'xander.purple@example.com'),
(25, 'Yara Gray', '1990-05-05', 'yara.gray@example.com'),
(26, 'Zack White', '1988-07-12', 'zack.white@example.com'),
(27, 'Amy Black', '1992-01-19', 'amy.black@example.com'),
(28, 'Brian Green', '1989-03-25', 'brian.green@example.com'),
(29, 'Cathy Blue', '1991-10-14', 'cathy.blue@example.com'),
(30, 'Derek Red', '1987-08-30', 'derek.red@example.com'),
(31, 'Elena Purple', '1993-11-08', 'elena.purple@example.com'),
(32, 'Fred Gray', '1990-02-02', 'fred.gray@example.com'),
(33, 'Gina White', '1995-06-17', 'gina.white@example.com'),
(34, 'Hank Black', '1988-09-19', 'hank.black@example.com'),
(35, 'Irene Green', '1991-12-05', 'irene.green@example.com'),
(36, 'Jake Blue', '1989-01-11', 'jake.blue@example.com'),
(37, 'Kathy Red', '1992-04-23', 'kathy.red@example.com'),
(38, 'Liam Purple', '1990-07-07', 'liam.purple@example.com'),
(39, 'Mia Gray', '1986-08-14', 'mia.gray@example.com'),
(40, 'Noah White', '1993-03-19', 'noah.white@example.com'),
(41, 'Olivia Black', '1991-05-21', 'olivia.black@example.com'),
(42, 'Paul Green', '1988-10-12', 'paul.green@example.com'),
(43, 'Queen Blue', '1990-06-30', 'queen.blue@example.com'),
(44, 'Ryan Red', '1987-12-01', 'ryan.red@example.com'),
(45, 'Sophia Purple', '1992-08-15', 'sophia.purple@example.com'),
(46, 'Tyler Gray', '1991-09-27', 'tyler.gray@example.com'),
(47, 'Ursula White', '1989-04-04', 'ursula.white@example.com'),
(48, 'Victor Black', '1995-02-14', 'victor.black@example.com'),
(49, 'Willa Green', '1990-11-22', 'willa.green@example.com'),
(50, 'Xenia Blue', '1988-03-08', 'xenia.blue@example.com');

-- 3️⃣ UPDATE examples

-- Update email by name
UPDATE employee SET email = 'alice.new@example.com' WHERE name = 'Alice Smith';

-- Update name by id
UPDATE employee SET name = 'Robert Johnson' WHERE id = 2;

-- Update email by birthday
UPDATE employee SET email = 'birthday.updated@example.com' WHERE birthday = '1992-12-01';

-- Update name by email
UPDATE employee SET name = 'David B.' WHERE email = 'david.brown@example.com';

-- Update birthday by id
UPDATE employee SET birthday = '1991-01-01' WHERE id = 5;

-- 4️⃣ DELETE examples

-- Delete by id
DELETE FROM employee WHERE id = 1;

-- Delete by name
DELETE FROM employee WHERE name = 'Robert Johnson';

-- Delete by birthday
DELETE FROM employee WHERE birthday = '1991-01-01';

-- Delete by email
DELETE FROM employee WHERE email = 'birthday.updated@example.com';

-- Delete another id
DELETE FROM employee WHERE id = 4;


--Homework 9

-- -------------------------------
-- 1️⃣ city + country
-- -------------------------------
SELECT c.city, co.country
FROM city c
INNER JOIN country co ON c.country_id = co.country_id;

-- -------------------------------
-- 2️⃣ customer + payment
-- -------------------------------
SELECT p.payment_id, c.first_name, c.last_name
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id;

-- -------------------------------
-- 3️⃣ customer + rental
-- -------------------------------
SELECT r.rental_id, c.first_name, c.last_name
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id;


--Homework 10
-- -------------------------------
-- 1️⃣ city + country (LEFT JOIN)
-- -------------------------------
SELECT c.city, co.country
FROM city c
LEFT JOIN country co ON c.country_id = co.country_id;

-- -------------------------------
-- 2️⃣ customer + payment (RIGHT JOIN)
-- -------------------------------
SELECT p.payment_id, c.first_name, c.last_name
FROM payment p
RIGHT JOIN customer c ON p.customer_id = c.customer_id;

-- -------------------------------
-- 3️⃣ customer + rental (FULL JOIN)
-- -------------------------------
SELECT r.rental_id, c.first_name, c.last_name
FROM rental r
FULL JOIN customer c ON r.customer_id = c.customer_id;


--Homework 11
-- -------------------------------
-- 1️⃣ actor + customer first_name (tüm veriler, benzersiz)
-- -------------------------------
SELECT first_name FROM actor
UNION
SELECT first_name FROM customer;

-- -------------------------------
-- 2️⃣ actor ∩ customer first_name (kesişen veriler, benzersiz)
-- -------------------------------
SELECT first_name FROM actor
INTERSECT
SELECT first_name FROM customer;

-- -------------------------------
-- 3️⃣ actor - customer first_name (actor'da var, customer'da yok, benzersiz)
-- -------------------------------
SELECT first_name FROM actor
EXCEPT
SELECT first_name FROM customer;

-- -------------------------------
-- 1️⃣ tekrar: actor + customer first_name (tüm veriler, tekrarları dahil et)
-- -------------------------------
SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer;

-- -------------------------------
-- 2️⃣ tekrar: actor ∩ customer first_name (kesişen veriler, tekrarları dahil et)
-- -------------------------------
SELECT first_name FROM actor
INTERSECT ALL
SELECT first_name FROM customer;

-- -------------------------------
-- 3️⃣ tekrar: actor - customer first_name (actor'da var, customer'da yok, tekrarları dahil et)
-- -------------------------------
SELECT first_name FROM actor
EXCEPT ALL
SELECT first_name FROM customer;


--Homework 12

-- -------------------------------
-- 1️⃣ length ortalamasından uzun kaç film var?
-- -------------------------------
SELECT COUNT(*) AS count_longer_than_avg
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- -------------------------------
-- 2️⃣ en yüksek rental_rate değerine sahip kaç film var?
-- -------------------------------
SELECT COUNT(*) AS count_max_rental_rate
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

-- -------------------------------
-- 3️⃣ en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri listele
-- -------------------------------
SELECT *
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film)
  AND replacement_cost = (SELECT MIN(replacement_cost) FROM film);

-- -------------------------------
-- 4️⃣ en fazla alışveriş yapan müşteriler(payment)
-- -------------------------------
SELECT c.customer_id, c.first_name, c.last_name, COUNT(p.payment_id) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(p.payment_id) = (
    SELECT MAX(pay_count)
    FROM (
        SELECT COUNT(payment_id) AS pay_count
        FROM payment
        GROUP BY customer_id
    ) AS subquery
);

