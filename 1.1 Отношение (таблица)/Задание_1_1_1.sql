--Сформулируйте SQL запрос для создания таблицы book

CREATE TABLE book(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(30) NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    amount INT NOT NULL
)  