--Провести аналитику по трем ценовым категориям 
--(до 600 руб, от 600 руб до 700 руб, свыше 700 руб) 
--и вывести среднюю цену  книги, общую стоимость остатков книг  
--в этой ценовой позиции и количество позиций. 
--Среднюю цену и стоимость округлить до двух знаков после запятой. 
--Информацию отсортировать по возрастанию нижней границы ценовой категории.

SELECT beg_range, end_range,
     ROUND(AVG(price), 2) AS Средняя_цена,
     SUM(price * amount) AS Стоимость,
     COUNT(amount) AS Количество
FROM(
    SELECT beg_range, end_range, price, amount
    FROM stat 
    JOIN book ON beg_range<price AND end_range>price
    ) table1    
GROUP BY beg_range, end_range
ORDER BY 1
