--Создать таблицу student,  в которую включить абитуриентов, 
--которые могут быть рекомендованы к зачислению  в соответствии с планом набора. 
--Информацию отсортировать сначала в алфавитном порядке по названию программ, 
--а потом по убыванию итогового балла.

CREATE TABLE student
SELECT name_program, name_enrollee, itog FROM enrollee
	JOIN applicant_order USING (enrollee_id)
	JOIN program USING (program_id)
WHERE str_id<=plan
ORDER BY name_program, itog DESC
