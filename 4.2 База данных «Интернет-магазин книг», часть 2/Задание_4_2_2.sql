--Вывести жанр(ы), в котором было заказано меньше всего экземпляров книг, 
--указать это количество. Учитывать только жанры, в которых была заказана хотя бы одна книга.
--При реализации в основном запросе не используйте LIMIT, 
--поскольку жанров с минимальным количеством заказанных книг может быть несколько.

WITH tab(name_genre, Количество) AS
    (SELECT name_genre, SUM(buy_book.amount) AS Количество
     FROM genre 
        INNER JOIN book USING(genre_id)
        INNER JOIN buy_book USING(book_id)
     GROUP BY name_genre
    )
SELECT name_genre, Количество
FROM tab
WHERE Количество = (SELECT MIN(Количество) FROM tab)
