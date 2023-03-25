-- Версия PostreSQL 14.5

-- РЕШЕНИЕ задачи
-- Создаем хранимую функцию, которая принимает поисковое значение и ищет связанные данные
CREATE OR REPLACE FUNCTION searching_data_func(x VARCHAR(20))
RETURNS TABLE("key" INT, id INT, phone INT8, mail VARCHAR(20)) AS
	$$
 	WITH RECURSIVE r AS (
	SELECT *
	FROM test t
	WHERE x IN ("key"::VARCHAR(20), id::VARCHAR(20), phone::VARCHAR(20), mail)
		UNION 
	SELECT DISTINCT t."key", t.id, t.phone, t.mail 
	FROM r, test t
	WHERE (CASE
			WHEN r."key" = t."key" THEN 1
			WHEN r.id = t.id THEN 1
			WHEN r.phone = t.phone THEN 1
			WHEN r.mail = t.mail THEN 1
		END) IS NOT NULL
	)
	SELECT * FROM r
	ORDER BY "key";
	$$
LANGUAGE SQL;


-- примеры вызова функии для поиска связанных данных
SELECT searching_data_func('87778885566');
SELECT searching_data_func('four@mail.ru');
SELECT searching_data_func('three@mail.ru');
SELECT searching_data_func('12345');
