--Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),  
--а количество или 2, или 3, или 5, или 7 .

SELECT title, author
FROM book
WHERE price >= 540.5 
    AND price <= 800
    AND amount IN (2,3,5,7);