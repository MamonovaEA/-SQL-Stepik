--В последний заказ (таблица buy_book) клиента Баранов Павел 
--добавить по одному экземпляру всех книг Достоевского, 
--которые есть в таблице book.

set @m:= (SELECT MAX(buy_id)
          FROM buy_book 
              JOIN buy using(buy_id) 
              JOIN client using(client_id)
          WHERE name_client = 'Баранов Павел');
          
INSERT INTO buy_book(buy_id, book_id, amount)
SELECT @m AS buy_id, 
    book_id,1 AS amount
FROM 
    author 
    JOIN book using(author_id)
WHERE name_author like 'Достоевский%';