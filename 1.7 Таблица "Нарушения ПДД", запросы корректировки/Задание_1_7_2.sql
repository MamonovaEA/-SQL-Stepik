--В таблицу fine первые 5 строк уже занесены. 
--Добавить в таблицу записи с ключевыми значениями 6, 7, 8.

INSERT INTO fine
(name, number_plate, violation, date_violation)
VALUES
('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', '2020-02-14'),
('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', '2020-02-23'),
('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', '2020-03-03');

SELECT * FROM fine;