--Составить рейтинг книг в зависимости от того, 
--какая книга принесет больше всего выручки (в процентах), 
--при условии продажи всех книг. 
--Рейтинг отсортировать по убыванию выручки. 
--Выручка в процентах вычисляется как стоимость всех экземпляров книги деленное 
--на суммарную стоимость всех экземпляров книг на складе и умноженное на 100, 
--полученный результат округлить до двух знаков после запятой.
--Судя по результату, магазин хорошо вложился в Стихи Есенина

SET @c := (SELECT SUM(t) 
           FROM 
               (SELECT SUM(price*amount) AS t 
                    FROM book) AS t1);

SELECT author, 
    title, 
    price, 
    amount, 
    ROUND(((price*amount) / @c) * 100,2) AS income_percent
FROM 
    book
ORDER BY income_percent DESC;