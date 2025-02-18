--Посчитать среднее время, за которое пользователи проходят урок по следующему алгоритму:

--1 для каждого пользователя вычислить время прохождения шага как сумму времени, 
--потраченного на каждую попытку (время попытки - это разница 
--между временем отправки задания и временем начала попытки), 
--при этом попытки, которые длились больше 4 часов не учитывать, 
--так как пользователь мог просто оставить задание открытым в браузере, 
--а вернуться к нему на следующий день;

--2 для каждого студента посчитать общее время, которое он затратил на каждый урок;

--3 вычислить среднее время выполнения урока в часах, 
--результат округлить до 2-х знаков после запятой;

--4 вывести информацию по возрастанию времени, пронумеровав строки, 
--для каждого урока указать номер модуля и его позицию в нем.

--Столбцы результата назвать Номер, Урок, Среднее_время

SELECT ROW_NUMBER() OVER (ORDER BY Среднее_время) AS Номер,
    Урок, Среднее_время
FROM(
    SELECT 
        Урок, ROUND(AVG(difference), 2) AS Среднее_время
FROM
     (SELECT student_id,
             CONCAT(module_id, '.', lesson_position, ' ', lesson_name) AS Урок,
             SUM((submission_time - attempt_time) / 3600) AS difference
      FROM module INNER JOIN lesson USING (module_id)
                  INNER JOIN step USING (lesson_id)
                  INNER JOIN step_student USING (step_id)
      WHERE submission_time - attempt_time <= 4 * 3600
      GROUP BY 1, 2) AS query_1
GROUP BY 1) AS TA
order by 3;
