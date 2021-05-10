-- Find the first_name, last_name and total_combined_film_length of Animation films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Animation films) and the total length of Animation films they have been in.
-- Look at the category table to figure out how to filter data for Animation films.
-- Order your results by the actor_id in ascending order.
-- Put query for Q3 here

SELECT A.actor_id, A.first_name, A.last_name, SUM(ifnull(F.length,0)) AS "total_combined_film_length"
FROM category C INNER JOIN film_category FC ON FC.category_id = C.category_id 
INNER JOIN film F ON FC.film_id = F.film_id 
AND FC.category_id = (SELECT C.category_id FROM category C WHERE C.name = "Animation")
INNER JOIN film_actor FA ON FA.film_id = F.film_id  
RIGHT JOIN actor A ON FA.actor_id = A.actor_id
GROUP BY A.actor_id
ORDER BY A.actor_id ASC
