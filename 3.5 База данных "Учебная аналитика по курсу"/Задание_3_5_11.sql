--Для студента с именем student_59 вывести следующую информацию по всем его попыткам:

-- 1 информация о шаге: номер модуля, символ '.', 
--позиция урока в модуле, символ '.', позиция шага в модуле;

-- 2 порядковый номер попытки для каждого шага - 
--определяется по возрастанию времени отправки попытки;

-- 3 результат попытки;

-- 4 время попытки (преобразованное к формату времени) - определяется как разность 
--между временем отправки попытки и времени ее начала, 
--в случае если попытка длилась более 1 часа, 
--то время попытки заменить на среднее время всех попыток пользователя по всем шагам без учета тех, 
--которые длились больше 1 часа;

-- 5 относительное время попытки  - определяется как отношение времени попытки 
--к суммарному времени всех попыток  шага, округленное до двух знаков после запятой.

--Столбцы назвать  Студент,  Шаг, Номер_попытки, Результат, Время_попытки и Относительное_время. 
--Информацию отсортировать сначала по возрастанию id шага, 
--а затем по возрастанию номера попытки (определяется по времени отправки попытки).

SET @avg_time := (SELECT CEIL(AVG(submission_time - attempt_time))
FROM step_student INNER JOIN student USING(student_id)
WHERE student_name = "student_59" AND (submission_time - attempt_time) < 3600);
WITH get_stat
AS
(
SELECT student_name, CONCAT(module_id, ".", lesson_position, ".", step_position) AS less, step_id, RANK() OVER (PARTITION BY CONCAT(module_id, ".", lesson_position, ".", step_position) ORDER BY submission_time) AS rang, result, 
CASE
    WHEN (submission_time - attempt_time) > 3600 THEN @avg_time
    ELSE (submission_time - attempt_time)
END AS qr
FROM student 
    INNER JOIN step_student USING(student_id)
    INNER JOIN step USING(step_id)
    INNER JOIN lesson USING(lesson_id)
WHERE student_name = "student_59"
)
SELECT student_name AS Студент, less AS Шаг, rang AS Номер_попытки, result AS Результат, SEC_TO_TIME(CEIL(qr)) AS Время_попытки, ROUND((qr / (SUM(qr) OVER (PARTITION BY less ORDER BY less)) * 100), 2) AS Относительное_время
FROM get_stat
ORDER BY step_id, 3;
