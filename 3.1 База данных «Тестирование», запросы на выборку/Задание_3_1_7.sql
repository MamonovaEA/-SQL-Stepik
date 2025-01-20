--Вывести вопросы, которые были включены в тест для Семенова Ивана 
--по дисциплине «Основы SQL» 2020-05-17  (значение attempt_id для этой попытки равно 7). 
--Указать, какой ответ дал студент и правильный он или нет (вывести Верно или Неверно). 
--В результат включить вопрос, ответ и вычисляемый столбец  Результат.

SELECT name_question, 
       name_answer, 
       IF(is_correct, 'Верно', 'Неверно') AS Результат
FROM question
     INNER JOIN testing USING(question_id)
     INNER JOIN answer USING(answer_id)
WHERE attempt_id = 7