-- 1. Find out the number of documentaries with deleted scenes.
SELECT COUNT(*) 
FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'Documentary' 
AND film.special_features = 'Deleted Scenes';

-- 2. Find out the total sales from Animation movies.
SELECT SUM(payment.amount) AS total_sales 
FROM payment
INNER JOIN rental ON rental.rental_id = payment.rental_id
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
INNER JOIN film ON film.film_id = inventory.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'Animation';

-- 3.Find out the number of sci-fi movies rented by the store managed by Jon Stephens.
SELECT COUNT(DISTINCT (inventory.film_id))
FROM staff
INNER JOIN rental ON staff.staff_id = rental.staff_id
INNER JOIN store ON store.store_id = staff.store_id
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
INNER JOIN film ON film.film_id = inventory.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'Sci-Fi'
AND staff.first_name = 'Jon' 
AND staff.last_name = 'Stephens';


-- 4.Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.
SELECT category.name,COUNT(category.name) 
FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
INNER JOIN film ON film.film_id = inventory.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
WHERE customer.first_name ='PATRICIA' 
AND customer.last_name = 'JOHNSON'
GROUP BY category.name
ORDER COUNT(category.name) DESC
LIMIT 3
;

-- 5.Find out the number of R rated movies rented by “SUSAN WILSON”
SELECT COUNT(*)
FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
INNER JOIN inventory ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN customer ON rental.customer_id = customer.customer_id
WHERE film.rating = 'R' 
AND customer.first_name="SUSAN" 
AND customer.last_name ="WILSON";
