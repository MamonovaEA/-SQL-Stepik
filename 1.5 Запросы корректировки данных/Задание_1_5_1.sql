--Создание таблицы осуществляется с помощью запроса CREATE, 
--подробно рассмотренного в первом уроке модуля.

CREATE TABLE supply (
    supply_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50),
    author VARCHAR(30),
    price DECIMAL(8, 2),
    amount INT
);