--Для каждого автора из таблицы author вывести количество книг, написанных им в каждом жанре.

--Вывести: ФИО автора, жанр, количество.

--Отсортировать: по фамилии, затем - по убыванию количества написанных книг, 
--а затем в алфавитном порядке по названию жанра.

--Важно! Реализовать задание одним запросом на выборку.

SELECT name_author, 
    name_genre, 
    COUNT(title) AS Количество
FROM author 
    CROSS JOIN genre 
    LEFT JOIN book ON book.author_id = author.author_id AND genre.genre_id = book.genre_id
GROUP BY 
    name_author, name_genre
ORDER BY 
    name_author, Количество DESC, name_genre