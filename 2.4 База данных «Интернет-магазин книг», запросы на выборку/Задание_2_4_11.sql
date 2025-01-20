--Для каждой отдельной книги необходимо вывести информацию 
--о количестве проданных экземпляров и их стоимости за 2020 и 2019 год . 
--За 2020 год проданными считать те экземпляры, которые уже оплачены. 
--Вычисляемые столбцы назвать Количество и Сумма. 
--Информацию отсортировать по убыванию стоимости.

WITH Title_sales AS (
SELECT title, buy_book.amount, price
FROM book
    INNER JOIN buy_book USING(book_id)
    INNER JOIN buy USING(buy_id) 
    INNER JOIN buy_step USING(buy_id)
    INNER JOIN step USING(step_id)
WHERE  date_step_end IS NOT Null and name_step = "Оплата"
    
UNION ALL
    
SELECT title, buy_archive.amount, buy_archive.price
    FROM buy_archive
    INNER JOIN book USING(book_id)
)
SELECT title, SUM(amount) AS Количество, SUM(amount*price) AS Сумма
FROM Title_sales
GROUP BY title
ORDER BY Сумма DESC;
