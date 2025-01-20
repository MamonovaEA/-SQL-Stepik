--Вывести студентов (различных студентов), имеющих максимальные результаты попыток. 
--Информацию отсортировать в алфавитном порядке по фамилии студента.
--Максимальный результат не обязательно будет 100%, 
--поэтому явно это значение в запросе не задавать.

SELECT name_student, result
FROM student
    INNER JOIN attempt USING(student_id)
WHERE result = (
         SELECT MAX(result) 
         FROM attempt
      )
ORDER BY name_student;
