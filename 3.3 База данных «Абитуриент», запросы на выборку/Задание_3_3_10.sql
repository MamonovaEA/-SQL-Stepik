--Вывести название образовательной программы и фамилию тех абитуриентов, 
--которые подавали документы на эту образовательную программу, 
--но не могут быть зачислены на нее. 
--Эти абитуриенты имеют результат по одному или нескольким предметам ЕГЭ, 
--необходимым для поступления на эту образовательную программу, 
--меньше минимального балла. 
--Информацию вывести в отсортированном сначала по программам, 
--а потом по фамилиям абитуриентов виде.

SELECT name_program, name_enrollee
FROM enrollee
     JOIN program_enrollee USING(enrollee_id)
     JOIN program USING(program_id)
     JOIN program_subject USING(program_id)
     JOIN subject USING(subject_id)
     JOIN enrollee_subject USING(subject_id)
WHERE enrollee_subject.enrollee_id = enrollee.enrollee_id and result < min_result
ORDER BY 1, 2
