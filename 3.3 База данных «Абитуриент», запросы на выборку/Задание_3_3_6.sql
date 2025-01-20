--Посчитать, сколько дополнительных баллов получит каждый абитуриент. 
--Столбец с дополнительными баллами назвать Бонус. 
--Информацию вывести в отсортированном по фамилиям виде.

SELECT name_enrollee,
       IFNULL(SUM(achievement.bonus),0) AS Бонус
FROM enrollee
     LEFT JOIN enrollee_achievement USING(enrollee_id)
     LEFT JOIN achievement USING(achievement_id)
GROUP BY 1
ORDER BY 1;
