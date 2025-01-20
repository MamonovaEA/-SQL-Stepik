--Если в таблицах supply  и book есть одинаковые книги, которые имеют равную цену,  
--вывести их название и автора, а также посчитать общее количество экземпляров книг 
--в таблицах supply и book,  столбцы назвать Название, Автор  и Количество.

SELECT book.title AS Название, name_author AS Автор, sum(book.amount + supply.amount) AS Количество
FROM 
    author 
    INNER JOIN book USING (author_id)   
    INNER JOIN supply ON book.title = supply.title 
                         AND author.name_author = supply.author
WHERE book.price = supply.price
GROUP BY book.title, name_author;