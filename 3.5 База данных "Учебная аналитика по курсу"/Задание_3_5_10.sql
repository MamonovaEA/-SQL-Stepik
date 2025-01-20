--Проанализировать, в каком порядке и с каким интервалом 
--пользователь отправлял последнее верно выполненное 
--задание каждого урока. Учитывать только студентов, прошедших 
--хотя бы один шаг из всех трех уроков. 
--В базе занесены попытки студентов  для трех уроков курса, 
--поэтому анализ проводить только для этих уроков.

--Для студентов прошедших как минимум по одному шагу в каждом уроке, 
--найти последний пройденный шаг каждого урока - крайний шаг, и указать:

-- 1 имя студента;
-- 2 номер урока, состоящий из номера модуля и через точку позиции каждого урока в модуле;
-- 3 время отправки  - время подачи решения на проверку;
-- 4 разницу во времени отправки между текущим и предыдущим крайним шагом в днях, 
--при этом для первого шага поставить прочерк ("-"), -
--а количество дней округлить до целого в большую сторону.

--Столбцы назвать  Студент, Урок,  Макс_время_отправки и Интервал. 
--Отсортировать результаты по имени студента в алфавитном порядке, 
--а потом по возрастанию времени отправки.

WITH get_time_lesson(student_name,  lesson, max_submission_time)
AS(
    SELECT student_name,  CONCAT(module_id, '.', lesson_position), MAX(submission_time)
    FROM step_student INNER JOIN step USING (step_id)
                          INNER JOIN lesson USING (lesson_id)
                          INNER JOIN student USING(student_id)
    WHERE  result = 'correct'  
    GROUP BY 1,2
    ORDER BY 1),
get_students(student_name)
AS(
    SELECT student_name 
    FROM get_time_lesson
    GROUP BY student_name
    HAVING COUNT(lesson) = 3)
SELECT student_name as Студент,  
       lesson as Урок, 
       FROM_UNIXTIME(max_submission_time) as Макс_время_отправки, 
       IFNULL(CEIL((max_submission_time - LAG(max_submission_time) OVER (PARTITION BY student_name ORDER BY max_submission_time )) / 86400),'-') as Интервал 
FROM get_time_lesson
WHERE student_name in (SELECT * FROM get_students)
ORDER BY 1,3;
