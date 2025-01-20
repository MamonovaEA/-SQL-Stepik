--Исправить запрос примера так: для шагов, которые  
--не имеют неверных ответов,  указать 100 как процент 
--успешных попыток, если же шаг не имеет верных ответов, указать 0. 
--Информацию отсортировать сначала по возрастанию успешности, 
--а затем по названию шага в алфавитном порядке.

WITH table1 (step_name, correct, count) AS (   
SELECT 
  step_name, 
  SUM( IF (result = 'correct' , 1 , 0)) AS s, 
  COUNT(result) AS c
  FROM step 
  JOIN step_student USING (step_id)
  GROUP BY step_name
    )

SELECT  step_name AS Шаг, ROUND((correct/count)*100) AS Успешность
FROM table1
ORDER BY 2, 1
