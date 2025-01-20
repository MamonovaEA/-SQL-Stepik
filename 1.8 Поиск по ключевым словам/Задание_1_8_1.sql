--Поиск шагов, в которых встречается заданное ключевое слово, в примере MAX: 

SELECT 
   keyword_name AS Поиск,
   CONCAT(module_id, ".", lesson_position, ".",step_position, " ", 
          CONCAT(LEFT(step_name, 23), "...")) AS Шаг,
   link AS Ссылка_на_шаг
FROM step
        INNER JOIN lesson USING(lesson_id)
        INNER JOIN module USING(module_id)
        INNER JOIN step_keyword USING(step_id)
        INNER JOIN keyword USING(keyword_id)
WHERE keyword_name = "MAX"
ORDER BY 2;