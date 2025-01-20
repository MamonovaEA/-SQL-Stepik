--Для повышения успеваемости, предоставить возможность студентам снова пройти тестирование.

--Для студентов, у которых количество попыток меньше 3 и максимальный балл < 70, 
--в таблицу attempt добавить новые попытки по соответствующим предметам с текущей датой.

INSERT INTO attempt (student_id, subject_id, date_attempt)
SELECT student_id, subject_id, CURDATE()
FROM attempt
GROUP BY 1, 2 HAVING COUNT(*) < 3 AND MAX(result) < 70;

SELECT * FROM attempt;