--Удалить из таблицы fine информацию о нарушениях, 
--совершенных раньше 1 февраля 2020 года. 

DELETE FROM fine
WHERE date_violation < DATE(20200201) 
    AND date_payment IS NOT NULL;