-- CURRENT DATE & TIME FUNCTIONS

SELECT CURDATE();

SELECT CURRENT_DATE();

SELECT CURTIME();

SELECT CURRENT_TIME();

SELECT NOW();

SELECT CURRENT_TIMESTAMP;


-- EXTRACT YEAR, MONTH, DAY

SELECT
YEAR(order_date),
MONTH(order_date),
DAY(order_date)
FROM orders;


-- EXTRACT USING EXTRACT()

SELECT
EXTRACT(YEAR FROM order_date),
EXTRACT(MONTH FROM order_date),
EXTRACT(DAY FROM order_date)
FROM orders;


-- MONTH NAME AND DAY NAME

SELECT
MONTHNAME(order_date),
DAYNAME(order_date)
FROM orders;


-- WEEKDAY AND DAYOFWEEK

SELECT
WEEKDAY(order_date),
DAYOFWEEK(order_date)
FROM orders;


-- IDENTIFY WEEKENDS

SELECT order_id, order_date
FROM orders
WHERE DAYNAME(order_date) IN ('Saturday', 'Sunday');


-- IDENTIFY WEEKDAYS

SELECT order_id, order_date
FROM orders
WHERE DAYOFWEEK(order_date) BETWEEN 2 AND 6;


-- DATE ADD

SELECT
order_date,
DATE_ADD(order_date, INTERVAL 5 DAY)
FROM orders;


-- DATE SUBTRACT

SELECT
order_date,
DATE_SUB(order_date, INTERVAL 3 DAY)
FROM orders;


-- ADD MONTH

SELECT
DATE_ADD(order_date, INTERVAL 1 MONTH)
FROM orders;


-- SUBTRACT MONTH

SELECT
DATE_SUB(order_date, INTERVAL 2 MONTH)
FROM orders;


-- ADD YEAR

SELECT
DATE_ADD(order_date, INTERVAL 1 YEAR)
FROM orders;


-- DATEDIFF

SELECT
order_id,
DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;


-- TIMESTAMPDIFF

SELECT
TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_diff,
TIMESTAMPDIFF(MONTH, order_date, delivery_date) AS months_diff
FROM orders;


-- LAST DAY OF MONTH

SELECT LAST_DAY(order_date)
FROM orders;


-- FIRST DAY OF MONTH

SELECT
DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY)
FROM orders;


-- DATE FORMAT

SELECT
DATE_FORMAT(order_date, '%d-%m-%Y')
FROM orders;

SELECT
DATE_FORMAT(order_date, '%M %d, %Y')
FROM orders;


-- STRING TO DATE

SELECT
STR_TO_DATE('15-01-2024', '%d-%m-%Y');


-- TIMESTAMP FORMAT

SELECT
DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s')
FROM orders;


-- FILTER BY MONTH

SELECT *
FROM orders
WHERE MONTH(order_date) = 1;

SELECT *
FROM orders
WHERE MONTHNAME(order_date) = 'February';


-- FINANCIAL YEAR LOGIC

SELECT
order_date,
CASE
WHEN MONTH(order_date) >= 4
THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
END AS financial_year
FROM orders;


-- ORDERS IN LAST 7 DAYS

SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;


-- ORDERS PLACED TODAY

SELECT *
FROM orders
WHERE DATE(order_timestamp) = CURDATE();
