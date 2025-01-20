--Заполнить таблицу step_keyword следующим образом: 
--если ключевое слово есть в названии шага, 
--то включить в step_keyword строку с id шага и id ключевого слова.

INSERT INTO step_keyword
SELECT step.step_id, keyword.keyword_id 
FROM 
    keyword
    CROSS JOIN step
WHERE step.step_name REGEXP CONCAT(' ', CONCAT(keyword.keyword_name, '\\b'))
GROUP BY step.step_id, keyword.keyword_id
ORDER BY keyword.keyword_id;
