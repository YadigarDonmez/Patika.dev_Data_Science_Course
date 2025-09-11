

-- 1. List title and description columns from the film table, ordered alphabetically by title
SELECT title, description
FROM film
ORDER BY title ASC;


-- 2. Select all columns from film table where length is greater than 60 AND less than 75
SELECT *
FROM film
WHERE length > 60 AND length < 75;

-- 3. Select all columns from film table where rental_rate = 0.99 
-- AND replacement_cost is either 12.99 OR 28.99
SELECT *
FROM film
WHERE rental_rate = 0.99 
  AND (replacement_cost = 12.99 OR replacement_cost = 28.99);


-- 4. Find the last_name of customers whose first_name is 'Mary'
SELECT last_name
FROM customer
WHERE first_name = 'Mary';


-- 5. Select all columns where length is not greater than 50 
-- AND rental_rate is NOT 2.99 or 4.99
SELECT *
FROM film
WHERE length <= 50
  AND rental_rate NOT IN (2.99, 4.99);
