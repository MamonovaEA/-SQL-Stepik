--В таблицу buy_step для заказа с номером 5 включить все этапы из таблицы step, 
--которые должен пройти этот заказ. 
--В столбцы date_step_beg и date_step_end всех записей занести Null.

INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end)
SELECT buy_id, step_id, Null, Null
FROM buy
CROSS JOIN step
WHERE buy_id = 5;
