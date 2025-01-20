--Вывести номера заказов (buy_id) и названия этапов,  
--на которых они в данный момент находятся. 
--Если заказ доставлен –  информацию о нем не выводить. 
--Информацию отсортировать по возрастанию buy_id.

SELECT buy_id, name_step
FROM buy_step
     JOIN step USING(step_id)
WHERE date_step_beg IS NOT NULL and date_step_end IS NULL
ORDER BY buy_id