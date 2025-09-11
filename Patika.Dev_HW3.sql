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
