--Вывести города, в которых живут клиенты, оформлявшие заказы в интернет-магазине. 
--Указать количество заказов в каждый город, этот столбец назвать Количество. 
--Информацию вывести по убыванию количества заказов, 
--а затем в алфавитном порядке по названию городов.

SELECT city.name_city, COUNT(client_id) AS Количество
FROM buy
    INNER JOIN client USING (client_id)
    INNER JOIN city USING (city_id)
GROUP BY buy.client_id
ORDER BY Количество DESC, name_city;