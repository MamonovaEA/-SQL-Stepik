--Вычислить прогресс пользователей по курсу. 
--Прогресс вычисляется как отношение верно пройденных шагов 
--к общему количеству шагов в процентах, округленное до целого. 
--В нашей базе данные о решениях занесены не для всех шагов, 
--поэтому общее количество шагов определить как количество различных шагов в таблице step_student.
--Тем пользователям, которые прошли все шаги (прогресс = 100%) выдать "Сертификат с отличием". 
--Тем, у кого прогресс больше или равен 80% -  "Сертификат". 
--Для остальных записей в столбце Результат задать пустую строку ("").
--Информацию отсортировать по убыванию прогресса, затем по имени пользователя в алфавитном порядке.

WITH get_passed (student_name, pssd)
    AS
        (
           SELECT student_name, COUNT(DISTINCT step_id) AS passed
           FROM student JOIN step_student USING(student_id)
           WHERE result = "correct"
           GROUP BY student_id
           ORDER BY passed
         )
SELECT student_name AS Студент, ROUND(100*pssd/(SELECT COUNT(DISTINCT step_id) FROM step_student)) AS Прогресс,
    CASE
        WHEN ROUND(100*pssd/(SELECT COUNT(DISTINCT step_id) FROM step_student)) =  100 THEN "Сертификат с отличием"
        WHEN ROUND(100*pssd/(SELECT COUNT(DISTINCT step_id) FROM step_student)) >= 80 THEN "Сертификат"
        ELSE ""
    END AS Результат
FROM get_passed
ORDER BY Прогресс DESC, Студент
