--Вывести название, жанр и цену тех книг, количество которых больше 8, 
--в отсортированном по убыванию цены виде. 

SELECT title, name_genre, price
FROM book AS b
INNER JOIN genre AS g
    ON b.genre_id = g.genre_id
WHERE b.amount > 8
ORDER BY 3 DESC;