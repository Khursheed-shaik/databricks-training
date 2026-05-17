-- LEVEL 1 (BASIC)

-- 1. Show employees whose salary is NULL

SELECT *
FROM Employees
WHERE salary IS NULL;


-- 2. Show orders where discount is NOT NULL

SELECT *
FROM Orders
WHERE discount IS NOT NULL;


-- 3. Get products where category is NULL

SELECT *
FROM Products
WHERE category IS NULL;


-- 4. Count employees with NULL manager_id

SELECT COUNT(*) AS null_manager_count
FROM Employees
WHERE manager_id IS NULL;


-- LEVEL 2 (ISNULL / IFNULL)

-- 5. Replace NULL salary with 0

SELECT name,
       IFNULL(salary, 0) AS salary
FROM Employees;


-- 6. Replace NULL bonus with 1000

SELECT name,
       IFNULL(bonus, 1000) AS bonus
FROM Employees;


-- 7. Replace NULL order amount with 500

SELECT customer_name,
       IFNULL(amount, 500) AS amount
FROM Orders;


-- 8. Replace NULL stock with 0

SELECT product_name,
       IFNULL(stock, 0) AS stock
FROM Products;


-- LEVEL 3 (COALESCE)

-- 9. Show employee earnings using salary, if NULL use bonus

SELECT name,
       COALESCE(salary, bonus) AS earnings
FROM Employees;


-- 10. Show first available value salary → bonus → 0

SELECT name,
       COALESCE(salary, bonus, 0) AS final_income
FROM Employees;


-- 11. Show product price with default 1000

SELECT product_name,
       COALESCE(price, 1000) AS final_price
FROM Products;


-- 12. Get customer payment amount → discount → 0

SELECT customer_name,
       COALESCE(amount, discount, 0) AS payment
FROM Orders;


-- LEVEL 4 (NULLIF)

-- 13. Convert salary to NULL if salary = 0

SELECT name,
       NULLIF(salary, 0) AS salary
FROM Employees;


-- 14. Convert discount to NULL if discount = 0

SELECT customer_name,
       NULLIF(discount, 0) AS discount
FROM Orders;


-- 15. Avoid divide by zero

SELECT amount / NULLIF(discount, 0)
FROM Orders;


-- 16. Replace coupon_code with NULL if it is DISC10

SELECT customer_name,
       NULLIF(coupon_code, 'DISC10') AS coupon_code
FROM Orders;


-- LEVEL 5 (REAL-TIME SCENARIOS)

-- 17. Calculate total earnings

SELECT name,
       IFNULL(salary, 0) + IFNULL(bonus, 0) AS total_earnings
FROM Employees;


-- 18. Employees where salary AND bonus are NULL

SELECT *
FROM Employees
WHERE salary IS NULL
AND bonus IS NULL;


-- 19. Products where price is NULL but category exists

SELECT *
FROM Products
WHERE price IS NULL
AND category IS NOT NULL;


-- 20. Orders where both amount and discount are NULL

SELECT *
FROM Orders
WHERE amount IS NULL
AND discount IS NULL;


-- LEVEL 6 (ADVANCED)

-- 21. Employee income using COALESCE

SELECT name,
       COALESCE(salary, bonus, 1000) AS income
FROM Employees;


-- 22. Replace empty discount with NULL using NULLIF

SELECT customer_name,
       NULLIF(discount, 0) AS final_discount
FROM Orders;


-- 23. Final payable amount

SELECT customer_name,
       IFNULL(amount, 0) - IFNULL(discount, 0) AS payable_amount
FROM Orders;


-- 24. Employees where salary is NULL but manager exists

SELECT *
FROM Employees
WHERE salary IS NULL
AND manager_id IS NOT NULL;
