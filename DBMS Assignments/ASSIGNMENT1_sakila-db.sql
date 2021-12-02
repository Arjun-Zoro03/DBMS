-- 1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.
SELECT film.title 
FROM film 
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'Comedy'
AND film.rating = 'PG-13';

-- 2. Find out the top 3 rented horror movies.
SELECT film.title 
FROM film 
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE category.name = 'Horror'
GROUP BY film.film_id
ORDER BY film.film_id DESC
LIMIT 3;

-- 3. Find out the list of customers from India who have rented sports movies.
SELECT customer.first_name, customer.last_name
FROM category
INNER JOIN film_category ON category.category_id = film_category.category_id
INNER JOIN film ON film.film_id = film_category.film_id
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN customer ON customer.customer_id = rental.customer_id
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id
WHERE category.name = 'Sports'
AND country.country = 'India';

-- 4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.
SELECT customer.first_name, customer.last_name
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film on film.film_id = film_actor.film_id
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN customer ON customer.customer_id = rental.customer_id
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id
WHERE actor.first_name = 'NICK'
AND actor.last_name = 'WAHLBERG'
AND country.country = 'Canada';

-- 5. Find out the number of movies in which “SEAN WILLIAMS” acted.
SELECT COUNT(*) as number_of_movies
FROM film 
INNER JOIN film_actor on film.film_id = film_actor.film_id
INNER JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name = 'SEAN'
AND actor.last_name = 'WILLIAMS';
