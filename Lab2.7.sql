-- LAB 2-07

USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query. OK

SELECT fc.category_id, c.name, COUNT(fc.film_id) AS number_of_films
FROM sakila.film_category fc
LEFT JOIN sakila.category c
ON fc.category_id = c.category_id
GROUP BY fc.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005. OK

SELECT p.staff_id, s.first_name, s.last_name, SUM(p.amount) AS Rung_Up_Amount
FROM sakila.payment p
LEFT JOIN sakila.staff s
ON p.staff_id = s.staff_id
GROUP BY staff_id;

-- 3. Which actor has appeared in the most films? OK

SELECT fa.actor_id, COUNT(fa.film_id) AS num_movies, a.first_name, a.last_name
FROM sakila.film_actor fa
LEFT JOIN sakila.actor a
ON fa.actor_id = a.actor_id
GROUP BY actor_id
ORDER BY num_movies DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT r.customer_id, c.first_name, c.last_name, count(r.inventory_id) AS number_of_films
FROM sakila.rental r
JOIN sakila.customer c
ON r.customer_id = c.customer_id
GROUP BY customer_id
ORDER BY count(inventory_id) DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(DISTINCT(a.actor_id)) AS number_of_actors
FROM sakila.film f
JOIN film_actor fa
ON f.film_id = fa.film_id
JOIN sakila.actor a
ON fa.actor_id = a.actor_id
GROUP BY f.title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT p.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_payment
FROM sakila.payment p
JOIN sakila.customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC;

-- 8. List number of films per category.

SELECT fc.category_id, c.name, COUNT(fc.film_id) AS number_of_films
FROM sakila.film_category fc
LEFT JOIN sakila.category c
ON fc.category_id = c.category_id
GROUP BY fc.category_id;