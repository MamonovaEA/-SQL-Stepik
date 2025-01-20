--Вывести образовательные программы, для которых минимальный балл ЕГЭ 
--по каждому предмету больше или равен 40 баллам. 
--Программы вывести в отсортированном по алфавиту виде.

SELECT name_program
FROM (
    SELECT name_program, MIN(min_result) r
    FROM program
        NATURAL JOIN program_subject
    GROUP BY 1
    HAVING r >= 40) table1
ORDER BY 1