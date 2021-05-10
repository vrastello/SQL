-- Find the first_name and last_name of all actors who have never been in an Animation film.
-- Order by the actor_id in ascending order.

-- Put your query for q4 here

SElECT A.actor_id, A.first_name, A.last_name FROM actor A WHERE A.actor_id NOT IN 
(SELECT A.actor_id FROM category C INNER JOIN film_category FC 
ON FC.category_id = C.category_id INNER JOIN film F ON FC.film_id = F.film_id 
AND FC.category_id = (SELECT C.category_id FROM category C WHERE C.name = "Animation")
INNER JOIN film_actor FA ON FA.film_id = F.film_id  
INNER JOIN actor A ON FA.actor_id = A.actor_id) ORDER BY A.actor_id ASC
