--Удалить всех авторов, которые пишут в жанре "Поэзия". 
--Из таблицы book удалить все книги этих авторов. 
--В запросе для отбора авторов использовать полное название жанра, а не его id.

DELETE FROM author
USING 
    book
    INNER JOIN author ON author.author_id = book.author_id
    INNER JOIN genre ON book.genre_id = genre.genre_id
WHERE genre.name_genre = 'Поэзия';