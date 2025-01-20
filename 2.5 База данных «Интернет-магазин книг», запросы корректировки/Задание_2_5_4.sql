--Количество тех книг на складе, которые были включены в заказ с номером 5, 
--уменьшить на то количество, которое в заказе с номером 5  указано.

UPDATE book, buy_book
SET    book.amount = book.amount - buy_book.amount
WHERE  buy_book.buy_id = 5 AND book.book_id = buy_book.book_id;

SELECT * FROM book
