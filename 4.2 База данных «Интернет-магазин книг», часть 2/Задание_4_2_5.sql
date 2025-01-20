--Для нечетного количества книг посчитать разницу максимальной стоимости (цена * количество) 
--и стоимостью всех экземпляров конкретной книги. 
--Отсортировать по этой разнице по убыванию. 
--Вывести название, автора, количество, разницу с максимальной стоимостью.

SELECT title, 
    author, 
    amount, 
    (SELECT price * amount
         FROM book
         WHERE amount % 2 = 1
         ORDER BY price * amount DESC
         LIMIT 1) - amount * price AS Разница_с_макс_стоимостью
FROM book
WHERE amount % 2 = 1
ORDER BY Разница_с_макс_стоимостью DESC

