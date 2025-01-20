--Вывести авторов и названия книг и их цену в двух столбцах - рубли и копейки.  
--Информацию отсортировать по убыванию копеек. 

SELECT author, title, 
    LEFT(price, 3) AS Рубли, 
    RIGHT(CEIl(RIGHT(price, 2)), 2) AS Копейки
FROM 
    book
ORDER BY Копейки DESC
