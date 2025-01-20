--Удалить все жанры, к которым относится меньше 4-х наименований книг. 
--В таблице book для этих жанров установить значение Null.

DELETE FROM genre
WHERE genre_id in (select genre_id 
                          from book 
                   group by genre_id 
                   having count(amount) < 4);