--Вывести жанр (или жанры), в котором было заказано 
--больше всего экземпляров книг, указать это количество. 
--Последний столбец назвать Количество.

WITH ranked_genres AS (
    SELECT 
        name_genre, 
        SUM(bb.amount) Количество,
        ROW_NUMBER() OVER (ORDER BY SUM(bb.amount) DESC) AS rn
    FROM genre  
    JOIN book USING(genre_id)
    JOIN buy_book bb USING(book_id)
    GROUP BY name_genre
)
SELECT name_genre, Количество
FROM ranked_genres
WHERE rn = 1;