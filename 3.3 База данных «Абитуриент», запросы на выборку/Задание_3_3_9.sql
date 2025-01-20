--Посчитать количество баллов каждого абитуриента 
--на каждую образовательную программу, на которую он подал заявление, 
--по результатам ЕГЭ. 
--В результат включить название образовательной программы, 
--фамилию и имя абитуриента, а также столбец с суммой баллов, 
--который назвать itog. 
--Информацию вывести в отсортированном сначала по образовательной программе, 
--а потом по убыванию суммы баллов виде.

SELECT p.name_program, e.name_enrollee, SUM(es.result) AS itog
FROM program_subject ps
    INNER JOIN program p USING(program_id)
    INNER JOIN program_enrollee pe USING(program_id)
    INNER JOIN enrollee e USING(enrollee_id)
    INNER JOIN enrollee_subject es ON es.subject_id = ps.subject_id AND
                                  es.enrollee_id = pe.enrollee_id
GROUP BY 1, 2
ORDER BY 1, 3 DESC;
