--Посчитать количество экземпляров  книг каждого автора из таблицы author.  
--Вывести тех авторов,  количество книг которых меньше 10, в отсортированном 
--по возрастанию количества виде. 
--Последний столбец назвать Количество.

SELECT name_author, sum(amount) AS Количество
FROM 
    author LEFT JOIN book
    on author.author_id = book.author_id
GROUP BY name_author
HAVING Количество<10 or Количество is NULL
ORDER BY Количество ASC; 