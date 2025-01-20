--Сравнить ежемесячную выручку от продажи книг за текущий и предыдущий годы. 
--Для этого вывести год, месяц, сумму выручки в отсортированном сначала 
--по возрастанию месяцев, затем по возрастанию лет виде. 
--Название столбцов: Год, Месяц, Сумма.

SELECT YEAR(date_payment) AS Год,
	   MONTHNAME(date_payment) AS Месяц,
	   SUM(amount*price) AS Сумма
FROM buy_archive
GROUP BY Год, Месяц

UNION ALL
SELECT YEAR(date_step_end) AS Год,
	   MONTHNAME(date_step_end) AS Месяц,
	   SUM(bb.amount*price) AS Сумма
FROM buy_book bb
      JOIN buy_step bs ON bb.buy_id = bs.buy_id 
  				  AND bs.date_step_end 
  				  AND bs.step_id = 1
      JOIN book USING(book_id)
GROUP BY Год, Месяц
ORDER BY Месяц, Год;