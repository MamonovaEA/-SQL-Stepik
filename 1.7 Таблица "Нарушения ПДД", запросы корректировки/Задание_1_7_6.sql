--Необходимо:
--в таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment; 
--уменьшить начисленный штраф в таблице fine в два раза  
--(только для тех штрафов, информация о которых занесена в таблицу payment) , 
--если оплата произведена не позднее 20 дней со дня нарушения.

UPDATE fine f, payment p
SET f.date_payment = p.date_payment,
    f.sum_fine = IF(DATEDIFF(f.date_payment, f.date_violation) <= 20, f.sum_fine / 2, f.sum_fine)
WHERE f.name = p.name AND
      f.number_plate = p.number_plate AND
      f.violation = p.violation AND
      f.date_violation = p.date_violation AND
      f.date_payment IS NULL;

SELECT name, violation, sum_fine, date_violation, date_payment
FROM fine;