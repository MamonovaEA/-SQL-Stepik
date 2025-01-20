--Повысить итоговые баллы абитуриентов в таблице applicant 
--на значения дополнительных баллов.

UPDATE applicant JOIN (
    SELECT enrollee_id, IFNULL(SUM(bonus), 0) AS Бонус FROM enrollee_achievement
    LEFT JOIN achievement USING(achievement_id)
    GROUP BY enrollee_id 
    ) AS t USING(enrollee_id)
SET itog = itog + Бонус;
