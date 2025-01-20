--Посчитать, сколько раз была заказана каждая книга, для книги вывести ее автора 
--(нужно посчитать, в каком количестве заказов фигурирует каждая книга).  
--Вывести фамилию и инициалы автора, название книги, последний столбец назвать Количество. 
--Результат отсортировать сначала  по фамилиям авторов, а потом по названиям книг.

SELECT author.name_author, book.title, COUNT(buy_book.book_id) AS Количество
FROM
    book
    INNER JOIN author ON author.author_id = book.author_id
    LEFT JOIN buy_book ON buy_book.book_id = book.book_id
    LEFT JOIN buy ON buy.buy_id = buy_book.buy_id
GROUP BY author.name_author, book.title
ORDER BY author.name_author, book.title