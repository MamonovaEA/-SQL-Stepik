--Вывести все жанры, которые не представлены в книгах на складе.

SELECT name_genre
FROM genre AS g 
LEFT JOIN book AS b
    ON g.genre_id = b.genre_id
WHERE title IS NULL;