--Поиск шагов, в которых встречаются три заданных ключевых слова 
--одновременно, в примере MAX, MIN и AVG

SELECT 
   GROUP_CONCAT(keyword_name) AS Поиск,
   CONCAT(module_id, ".", lesson_position, ".", step_position, " ", 
          CONCAT(LEFT(step_name, 20), "...")) AS Шаг,
   link AS Ссылка_на_шаг
FROM step
        INNER JOIN lesson USING(lesson_id)
        INNER JOIN module USING(module_id)
        INNER JOIN step_keyword USING(step_id)
        INNER JOIN keyword USING(keyword_id)
WHERE keyword_name IN ("MAX", "AVG", "MIN")
GROUP BY ШАГ, link
HAVING COUNT(*) = 3
ORDER BY 2;