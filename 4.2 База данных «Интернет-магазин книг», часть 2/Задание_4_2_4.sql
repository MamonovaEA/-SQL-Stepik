--Объявить столбец "категории цены" (price_category): 
--<500 - "низкая", 500 - 700 - "средняя", более 700 - "высокая"
--Вывести автора, название, категорию, стоимость (цена * количество), 
--исключив из авторов Есенина, из названий "Белую гвардию". 
--Отсортировать по убыванию стоимости и названию (по возрастанию)

SELECT author, title,
    CASE
        WHEN price < 500 THEN 'низкая'
        WHEN price BETWEEN 500 AND 700 THEN 'средняя'
        ELSE 'высокая'
        END AS price_category, price * amount AS cost
FROM book
WHERE author <> 'Есенин С.А.' AND title <> 'Белая гвардия'
ORDER BY cost DESC, title

