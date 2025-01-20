--Создать новую таблицу store, в которую занести данные из таблиц book и supply, 
--при условии, что количество книг будет больше среднего количества книг по двум таблицам; 
--если книга есть в обеих таблицах, то стоимость выбрать большую из двух. 
--Отсортировать данные из таблицы их по имени автора в алфавитном порядке и по убыванию цены. 
--Вывести данные из полученной таблицы.

CREATE TABLE store AS
with t1 AS
    (SELECT title, author, price, amount
    FROM book
    UNION ALL
    SELECT title, author, price, amount
    FROM supply
    )
    
SELECT title, 
    author, 
    MAX(price) AS price, 
    sum(amount) AS amount
FROM t1
GROUP BY title, author
HAVING amount > (SELECT AVG(amount) FROM t1)
ORDER BY author, price DESC;

SELECT * 
FROM store

