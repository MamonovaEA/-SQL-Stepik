--Вывести информацию о командировках сотрудника(ов), которые были самыми короткими по времени. 
--В результат включить столбцы name, city, date_first, date_last.

SELECT name, city, date_first, date_last
FROM trip
WHERE
    ABS(DATEDIFF(date_first, date_last) - 1) = (
        SELECT
            MIN(ABS(DATEDIFF(date_first, date_last) - 1))
        FROM trip);