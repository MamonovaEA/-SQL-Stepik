--Удалить из таблиц book и supplyкниги, 
--цены которых заканчиваются на 99 копеек. 
--Например, книга с ценой 670.99 должна быть удалена.

DELETE book, supply 
FROM book, supply
WHERE book.price LIKE '%.99' 
    AND supply.price LIKE '%.99';
