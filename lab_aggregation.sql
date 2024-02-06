SELECT 
    MAX(length) AS max_duration, 
    MIN(length) AS min_duration 
FROM film;

#option 1
SELECT 
    FLOOR(AVG(length) / 60) AS average_hours, 
    ROUND(AVG(length) % 60) AS average_minutes 
FROM film;

# option 2
SELECT 
    CONCAT(
        FLOOR(AVG(length) / 60), ' hours ', 
        ROUND(AVG(length) % 60), ' minutes'
    ) AS average_duration
FROM film;

SELECT 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days 
FROM rental;

SELECT 
    *, 
    MONTH(rental_date) AS rental_month, 
    DAYNAME(rental_date) AS rental_weekday 
FROM rental 
LIMIT 20;

SELECT DAYOFWEEK(rental_date), COUNT(*)
FROM rental
GROUP BY DAYOFWEEK(rental_date);

SELECT 
    *, 
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend' 
        ELSE 'workday' 
    END AS DAY_TYPE 
FROM rental;

SELECT 
    title, 
    IFNULL(rental_duration, 'Not Available') AS rental_duration 
FROM film 
ORDER BY title;

#option 1
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, 
    SUBSTRING(email, 1, 3) AS email_start 
FROM customer 
ORDER BY last_name;

#option 2
SELECT 
    CONCAT(first_name, ' ', last_name, ' ', SUBSTRING(email, 1, 3)) AS full_name_with_email_start 
FROM customer 
ORDER BY last_name;

SELECT 
    COUNT(*) AS total_films 
FROM film;

SELECT 
    rating, 
    COUNT(*) AS number_of_films 
FROM film 
GROUP BY rating;

SELECT 
    rating, 
    COUNT(*) AS number_of_films 
FROM film 
GROUP BY rating 
ORDER BY number_of_films DESC;

SELECT 
    rating, 
    ROUND(AVG(length), 2) AS mean_duration 
FROM film 
GROUP BY rating 
ORDER BY mean_duration DESC;

SELECT 
    rating, 
    ROUND(AVG(length), 2) AS mean_duration 
FROM film 
GROUP BY rating 
HAVING mean_duration > 120;

SELECT 
    last_name 
FROM actor 
GROUP BY last_name 
HAVING COUNT(last_name) = 1;




