--Вывести авторов и суммарную стоимость их книг, 
--если хотя бы одна их книга имеет цену выше средней по складу. 
--Средняя цена рассчитывается как простое среднее, с помощью avg(). 
--Информацию отсортировать по убыванию суммарной стоимости.

SET @avg_price := (SELECT AVG(price) FROM book);

SELECT author,  
    SUM(price * amount) AS Стоимость 
FROM book
WHERE author in (SELECT author FROM book WHERE price > @avg_price)
GROUP BY author
ORDER BY 2 DESC;
