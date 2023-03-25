-- Версия PostreSQL 14.5

-- Создание таблицы и внесение в неё тестовых данных
CREATE TABLE test("key" INT, id INT, phone INT8, mail VARCHAR(20));
INSERT INTO test 
VALUES (1, 12345, 89997776655, 'test@mail.ru'),
	   (2, 54321, 87778885566, 'two@mail.ru'),
	   (3,	98765, 87776664577, 'three@mail.ru'),
	   (4, 66678, 87778885566, 'four@mail.ru'),
	   (5, 34567, 84547895566, 'four@mail.ru'),
	   (6, 34567, 89087545678, 'five@mail.ru');