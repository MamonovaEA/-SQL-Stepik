--В таблицу buy_book добавить заказ с номером 5. Э
--тот заказ должен содержать книгу Пастернака «Лирика» 
--в количестве двух экземпляров и книгу Булгакова «Белая гвардия» в одном экземпляре.

INSERT INTO buy_book (buy_id, book_id, amount)
VALUES
    (5, (SELECT book_id FROM 
         book JOIN author USING(author_id) 
         WHERE title='Лирика' AND name_author LIKE 'Пастернак%'), 2),
    (5, (SELECT book_id 
         FROM book JOIN author USING(author_id) 
         WHERE title='Белая Гвардия' AND name_author LIKE 'Булгаков%'), 1);
SELECT * FROM buy_book;
