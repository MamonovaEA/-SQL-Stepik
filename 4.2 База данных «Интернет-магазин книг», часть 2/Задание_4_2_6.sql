--Магазин решил быстрее распродать остатки книг, 
--цена которых выше 600, а также прописать условия доставки. 
--Создать запрос на выборку, в котором:

-- 1. Столбцы назовите Наименование, Цена и  Стоимость доставки.
-- 2. Отберите все книги, цена которых выше 600.
-- 3. Если остаток по отдельной книге меньше или равен 5, 
--то стоимость доставки будет 500 рублей, если больше 5, 
--то доставка будет бесплатной (вместо стоимости доставки вставить Бесплатно).
-- 4. Отсортируйте значения по убыванию цены книг.

SELECT title AS Наименование, 
    price AS Цена,  
    CASE 
        WHEN amount <= 5 THEN '500'
    ELSE 'Бесплатно'
    END AS Стоимость_доставки
FROM book
WHERE price > 600
ORDER BY price DESC

