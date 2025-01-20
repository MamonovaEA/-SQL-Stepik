--Посчитать, сколько студентов относится к каждой группе. 
--Столбцы назвать Группа, Интервал, Количество. 
--Указать границы интервала.

SELECT
    rate_group Группа, 
    CASE rate_group
        WHEN 'I'   THEN 'от 0 до 10'
        WHEN 'II'  THEN 'от 11 до 15'
        WHEN 'III' THEN 'от 16 до 27'
        ELSE 'больше 27'
    END Интервал,
    COUNT(*) Количество
FROM
(
    SELECT 
        CASE
            WHEN COUNT(DISTINCT step_id) <= 10 THEN 'I'
            WHEN COUNT(DISTINCT step_id) <= 15 THEN 'II'
            WHEN COUNT(DISTINCT step_id) <= 27 THEN 'III'
            ELSE 'IV'
        END rate_group
    FROM step_student
    WHERE result = 'correct'
    GROUP BY student_id
) query_in
GROUP BY rate_group
ORDER BY 1;
