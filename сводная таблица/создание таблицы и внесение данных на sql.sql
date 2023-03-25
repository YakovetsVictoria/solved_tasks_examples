-- Версия PostreSQL 14.5

-- Создание таблиц и внесение в них тестовых данных
CREATE TABLE LOANS_TABLE (
LOAN_ID int,
CLIENT_ID int,
LOAN_DATE date,
LOAN_AMOUNT float);

CREATE TABLE CLIENTS_TABLE (
CLIENT_ID int,
CLIENT_NAME VARCHAR(20),
BIRTHDAY date,
GENDER VARCHAR(20));

INSERT INTO CLIENTS_TABLE
VALUES
(1, 'bob', '20200115', 'male'),
(2, 'rocky', '20200215', 'female'),
(3, 'like', '20200215', 'female'),
(4, 'ricky', '20200215', 'male');

INSERT INTO LOANS_TABLE
VALUES
(1, 1, '20200115', 10000),
(2, 2, '20200215', 20000),
(3, 3, '20200315', 30000),
(4, 4, '20200415', 40000),
(5, 1, '20200116', 15000),
(6, 2, '20200315', 35000),
(7, 3, '20200315', 5000),
(8, 1, '20200115', 1500),
(9, 2, '20200115', 500),
(10, 1, '20200115', 1500);
