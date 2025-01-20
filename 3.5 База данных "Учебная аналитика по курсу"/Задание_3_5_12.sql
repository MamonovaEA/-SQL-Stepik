--Выделить группы обучающихся по способу прохождения шагов:

-- I группа - это те пользователи, которые после верной попытки 
--решения шага делают неверную;

-- II группа - это те пользователи, которые делают больше одной 
--верной попытки для одного шага;

-- III группа - это те пользователи, которые не смогли 
--решить задание какого-то шага.

--Вывести группу (I, II, III), имя пользователя, 
--количество шагов, которые пользователь выполнил по соответствующему способу. 
--Столбцы назвать Группа, Студент, Количество_шагов. 
--Отсортировать информацию по возрастанию номеров групп, 
--потом по убыванию количества шагов и, наконец, по имени студента в алфавитном порядке.

WITH qr
AS
(
SELECT student_name, step_id, count(result) AS sm
FROM step_student INNER JOIN student USING(student_id)
WHERE result = "correct"
GROUP BY 1, 2
HAVING count(result) > 1
)
SELECT "I" AS Группа, student_name AS Студент, count(step_id) AS Количество_шагов
FROM (
SELECT student_name, step_id, IF(result = "correct" AND submission_time < MAX(submission_time) OVER (PARTITION BY student_name, step_id), IF(LEAD(result) OVER (PARTITION BY student_id, step_id ORDER BY submission_time) = "wrong", 1, 0), 0) AS change_res
FROM step_student INNER JOIN student USING(student_id))qr1
WHERE change_res = 1
GROUP BY 1, 2
UNION 
SELECT "II" AS Группа, student_name AS Студент, count(step_id) AS Количество_шагов
FROM qr
GROUP BY 1, 2
UNION
SELECT "III" AS Группа, student_name AS Студент, count(DISTINCT step_id) AS Количество_шагов
FROM (
    SELECT student_id, step_id, SUM(new_result) OVER (PARTITION BY student_id, step_id) AS sum_result
    FROM (
        SELECT student_id, step_id, IF(result = "wrong", 0, 1) AS new_result 
            FROM step_student)qr_1)qr_2 INNER JOIN student USING(student_id)
WHERE sum_result = 0
GROUP BY student_id
ORDER BY Группа, Количество_шагов DESC, Студент;
