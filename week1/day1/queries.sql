-- Day 1 SQL Practice (Based on Given PDF)

-- Q1: Select all columns from the Employee table
SELECT * FROM Employee;

-- Q2: Select only the name and salary columns from the Employee table
SELECT name, salary FROM Employee;

-- Q3: Select employees who are older than 30
SELECT * FROM Employee WHERE age > 30;

-- Q4: Select the names of all departments
SELECT name FROM Department;

-- Q5: Select employees who work in the IT department
SELECT e.name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id
WHERE d.name = 'IT';

-- Q6: Select employees whose names start with 'J'
SELECT * FROM Employee WHERE name LIKE 'J%';

-- Q7: Select employees whose names end with 'e'
SELECT * FROM Employee WHERE name LIKE '%e';

-- Q8: Select employees whose names contain 'a'
SELECT * FROM Employee WHERE name LIKE '%a%';

-- Q9: Select employees whose names are exactly 9 characters long
SELECT * FROM Employee WHERE LENGTH(name) = 9;

-- Q10: Select employees whose names have 'o' as the second character
SELECT * FROM Employee WHERE name LIKE '_o%';
