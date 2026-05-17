-- 1. Retrieve employee names and their managers, including employees without managers

SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;


-- 2. Display all employees and their departments

SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


-- 3. Employees who report to a manager

SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;


-- 4. Display employees and departments

SELECT e.emp_name,
       d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;


-- 5. Employees without departments

SELECT emp_name
FROM employees
WHERE dept_id IS NULL;


-- 6. Employees and their projects

SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


-- 7. Employees who completed at least one project

SELECT e.emp_name,
       p.project_name
FROM employees e
JOIN projects p
ON e.emp_id = p.emp_id;


-- 8. All employees and projects including unmatched rows

SELECT e.emp_name,
       p.project_name
FROM employees e
FULL OUTER JOIN projects p
ON e.emp_id = p.emp_id;


-- 9. Employees and salary records

SELECT emp_name,
       NULL AS salary
FROM employees;


-- 10. Employees and department names

SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


-- 11. Departments and employees including empty departments

SELECT d.dept_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;


-- 12. Employees with contact information

SELECT emp_name,
       NULL AS contact_info
FROM employees;


-- 13. Employees and departments including unmatched records

SELECT e.emp_name,
       d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;


-- 14. Employees without projects

SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;


-- 15. Employees and project names

SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


-- 16. Projects and assigned employees

SELECT p.project_name,
       e.emp_name
FROM projects p
LEFT JOIN employees e
ON p.emp_id = e.emp_id;


-- 17. Employees with managers and projects

SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name,
       p.project_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
JOIN projects p
ON e.emp_id = p.emp_id;


-- 18. Employees with valid departments only

SELECT e.emp_name,
       d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;


-- 19. Employees and departments

SELECT e.emp_name,
       d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;


-- 20. Departments and employees including empty departments

SELECT d.dept_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;


-- 21. Employees with projects but no departments

SELECT e.emp_name,
       p.project_name
FROM employees e
JOIN projects p
ON e.emp_id = p.emp_id
WHERE e.dept_id IS NULL;


-- 22. Total employees department-wise including empty departments

SELECT d.dept_name,
       COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- 23. Employees who report to managers

SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;


-- 24. All employees and managers including employees without managers

SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;


-- 25. Departments and employee counts

SELECT d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- 26. Employees and departments including empty departments

SELECT e.emp_name,
       d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;


-- 27. Employees without salary records

SELECT emp_name
FROM employees;


-- 28. Employees and project assignments

SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


-- 29. Employees with department and project assignments

SELECT e.emp_name,
       d.dept_name,
       p.project_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN projects p
ON e.emp_id = p.emp_id;


-- 30. Employees with department names including employees without departments

SELECT e.emp_name,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
