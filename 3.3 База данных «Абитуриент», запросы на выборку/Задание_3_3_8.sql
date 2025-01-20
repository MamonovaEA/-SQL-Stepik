--Вывести образовательные программы, на которые для 
--поступления необходимы предмет «Информатика» и «Математика» 
--в отсортированном по названию программ виде.

SELECT name_program
FROM program
    JOIN program_subject ps USING(program_id)
    JOIN subject s ON ps.subject_id=s.subject_id AND name_subject IN ('Информатика','Математика')
GROUP BY 1
HAVING COUNT(name_subject)=2
ORDER BY 1
