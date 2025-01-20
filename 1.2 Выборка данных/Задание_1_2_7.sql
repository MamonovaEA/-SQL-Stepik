--Вывести название и автора тех книг, название которых состоит из двух и более слов, 
--а инициалы автора содержат букву «С». Считать, что в названии слова отделяются друг от друга пробелами 
--и не содержат знаков препинания, между фамилией автора и инициалами обязателен пробел, 
--инициалы записываются без пробела в формате: буква, точка, буква, точка. 
--Информацию отсортировать по названию книги в алфавитном порядке.

SELECT title, author       
FROM book 
WHERE title LIKE '_% _%'
    AND (author LIKE "% С._." OR author LIKE "% _.С.")
ORDER BY title;