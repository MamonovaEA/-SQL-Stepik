--Вывести два города, в которых чаще всего были в командировках сотрудники. 
--Вычисляемый столбец назвать Количество.

SELECT city, count(name) as 'Количество'
FROM trip
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2