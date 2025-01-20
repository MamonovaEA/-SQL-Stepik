--В таблице city для каждого города указано количество дней, 
--за которые заказ может быть доставлен в этот город (рассматривается только этап Транспортировка). 
--Для тех заказов, которые прошли этап транспортировки, 
--вывести количество дней за которое заказ реально доставлен в город. 
--А также, если заказ доставлен с опозданием, указать количество дней задержки, 
--в противном случае вывести 0. В результат включить номер заказа (buy_id), 
--а также вычисляемые столбцы Количество_дней и Опоздание. 
--Информацию вывести в отсортированном по номеру заказа виде.

SELECT buy_id, DATEDIFF(date_step_end, date_step_beg) AS Количество_дней, 
        IF(DATEDIFF(date_step_end, date_step_beg)<=days_delivery, 0, DATEDIFF(date_step_end, date_step_beg) -               days_delivery) AS Опоздание
FROM buy_step JOIN buy USING(buy_id)
              JOIN client USING(client_id)
              JOIN city USING(city_id)              
WHERE step_id=3 AND DATEDIFF(date_step_end, date_step_beg) IS NOT NULL
ORDER BY 1