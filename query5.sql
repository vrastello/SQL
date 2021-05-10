-- Find the film_title of all films which feature both RALPH CRUZ and WILL WILSON
-- Order the results by film_title in ascending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.


-- Put your query for q5 here.

SELECT tbl1.title AS "film_title" FROM
(SELECT F.title, F.film_id, A.first_name, A.last_name FROM actor A 
INNER JOIN film_actor FA ON A.actor_id = FA.actor_id
INNER JOIN film F ON FA.film_id = F.film_id
WHERE A.first_name = "RALPH" AND A.last_name = "CRUZ") AS tbl1
INNER JOIN
(SELECT F.title, F.film_id, A.first_name, A.last_name FROM actor A 
INNER JOIN film_actor FA ON A.actor_id = FA.actor_id
INNER JOIN film F ON FA.film_id = F.film_id
WHERE A.first_name = "WILL" AND A.last_name = "WILSON") AS tbl2
ON tbl1.title = tbl2.title ORDER BY tbl1.title ASC
