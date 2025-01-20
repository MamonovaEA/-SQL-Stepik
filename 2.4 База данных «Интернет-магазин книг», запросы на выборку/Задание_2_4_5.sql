--Вывести информацию о каждом заказе: его номер, 
--кто его сформировал (фамилия пользователя) и его стоимость 
--(сумма произведений количества заказанных книг и их цены), 
--в отсортированном по номеру заказа виде. 
--Последний столбец назвать Стоимость.

SELECT buy_id, name_client, SUM(price * buy_book.amount) as Стоимость
FROM buy
    INNER JOIN client using(client_id)
    INNER JOIN buy_book using(buy_id)
    INNER JOIN book using(book_id)
GROUP BY buy_book.buy_id
ORDER BY 1;