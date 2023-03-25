-- Версия PostreSQL 14.5

-- РЕШЕНИЕ задачи
-- Создаем хранимую функцию, которая создает представление с нужным результатом (сводную таблицу)
CREATE OR REPLACE FUNCTION pivot_code()
RETURNS void AS
$$
DECLARE 
	col TEXT;
	res TEXT;
BEGIN 
	-- заносим в переменную col список столбцов, который далее будет использоваться в crosstab
	SELECT '(gender VARCHAR, ' || STRING_AGG(number_of_loan, ', ') || ')' INTO col FROM
	(
	SELECT DISTINCT 'num_of_loan_' || DENSE_RANK() OVER(PARTITION BY client_id
    ORDER BY loan_date, loan_id) || ' BIGINT' number_of_loan
	FROM loans_table l
	RIGHT JOIN clients_table c
	USING(client_id)
	ORDER BY number_of_loan
	) a;
	-- присваиваем переменной res строку с запросом, который формирует сводную таблицу
	-- в качестве списка результирующих столбцов указываем переменную col
	res := 'SELECT * FROM crosstab('''
			'SELECT gender, number_of_loan, COUNT(number_of_loan) cnt
			FROM (
			SELECT *, DENSE_RANK() OVER(PARTITION BY client_id
			ORDER BY loan_date, loan_id) number_of_loan
			FROM loans_table l
			RIGHT JOIN clients_table c
			USING(client_id)
			ORDER BY client_id, number_of_loan
			) b
			GROUP BY gender, number_of_loan
			ORDER BY gender DESC, number_of_loan'
			''') AS ct' || col;
	EXECUTE 'CREATE OR REPLACE VIEW result_pivot AS ' || res;
END;
$$
LANGUAGE plpgsql;

-- Вызываем функцию
SELECT pivot_code();

-- Смотрим результат в представлении
SELECT * FROM result_pivot;
