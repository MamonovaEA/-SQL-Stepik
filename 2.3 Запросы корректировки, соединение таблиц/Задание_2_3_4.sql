--Занести для книги «Стихотворения и поэмы» Лермонтова жанр «Поэзия», 
--а для книги «Остров сокровищ» Стивенсона - «Приключения». 

UPDATE book, genre
SET book.genre_id =
    CASE
        WHEN book_id = 10 THEN (SELECT genre_id FROM genre WHERE name_genre = 'Поэзия')
        WHEN book_id = 11 THEN (SELECT genre_id FROM genre WHERE name_genre = 'Приключения')
        ELSE book.genre_id
    END;
SELECT * FROM book;