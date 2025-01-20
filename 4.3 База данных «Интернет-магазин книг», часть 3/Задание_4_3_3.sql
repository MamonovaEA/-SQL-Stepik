--Для клиентов у которых сумма заказов выше средней по суммам заказов клиентов 
--(общей стоимости всех заказов клиентов), вывести имя, общую сумму всех заказов, 
--количество заказов, количество заказанных книг. 
--Этим клиентам мы предложим специальную программу лояльности! 
--Информацию отсортировать по имени клиентов ( в алфавитном порядке).

SELECT name_client, SUM(price * bb.amount) AS Общая_сумма_заказов, COUNT(DISTINCT bb.buy_id) AS Заказов_всего,         SUM(bb.amount) AS Книг_всего
FROM book
    JOIN buy_book bb USING(book_id)
    JOIN buy USING(buy_id)
    JOIN client USING(client_id)
GROUP BY name_client
HAVING SUM(price * bb.amount) > (SELECT AVG(pr)
                                 FROM (SELECT SUM(price * buy_book.amount) AS pr
                                       FROM book
                                           JOIN buy_book USING(book_id)
                                           JOIN buy USING(buy_id)
                                       GROUP BY buy.client_id) test_1
                                 )
ORDER BY name_client
