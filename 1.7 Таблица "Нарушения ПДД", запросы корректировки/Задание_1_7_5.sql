--В таблице fine увеличить в два раза сумму неоплаченных штрафов 
--для отобранных на предыдущем шаге записей. 

UPDATE fine AS f, (
	   SELECT name, number_plate, violation
  		 FROM fine
 		GROUP BY name, number_plate, violation
	   HAVING count(*) >= 2
	   ) AS dv
   SET f.sum_fine = f.sum_fine*2
 WHERE f.date_payment IS Null
	   AND (f.name = dv.name
	   AND f.violation = dv.violation);

SELECT * FROM fine;