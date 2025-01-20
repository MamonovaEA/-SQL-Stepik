--Реализовать поиск по ключевым словам. 
--Вывести шаги, с которыми связаны ключевые слова MAX и AVG одновременно. 
--Для шагов указать id модуля, позицию урока в модуле, 
--позицию шага в уроке через точку, после позиции шага перед заголовком - пробел. 
--Позицию шага в уроке вывести в виде двух цифр (если позиция шага меньше 10, то перед цифрой поставить 0). 
--Столбец назвать Шаг. 
--Информацию отсортировать по первому столбцу в алфавитном порядке.

SELECT 
    concat(module_id,'.',lesson_position,
           IF(step_position < 10, ".0","."),
           step_position," ",step_name) AS Шаг
FROM
   step
   JOIN lesson USING(lesson_id)
   JOIN module USING(module_id)
   JOIN step_keyword USING (step_id)
   JOIN keyword USING(keyword_id)
WHERE keyword_name = 'MAX' OR keyword_name ='AVG'
GROUP BY ШАГ
HAVING COUNT(*) = 2
ORDER BY 1;
