-- Q1. List all students along with their department names

SELECT s.student_name,
       d.department_name
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id;


-- Q2. Display all staff members and their department names, including staff without departments

SELECT st.staff_name,
       d.department_name
FROM Staff st
LEFT JOIN Department d
ON st.department_id = d.department_id;


-- Q3. Find all departments that currently have no students assigned

SELECT d.department_name
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;


-- Q4. Show students who do not have any marks recorded

SELECT s.student_name
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id
WHERE m.student_id IS NULL;


-- Q5. Display subjects that are not assigned to any staff member

SELECT *
FROM Subject
WHERE staff_id IS NULL;


-- Q6. Find the average CGPA department-wise

SELECT department_id,
       AVG(cgpa) AS average_cgpa
FROM Student
GROUP BY department_id;


-- Q7. Display departments where the average CGPA is greater than 8.0

SELECT department_id,
       AVG(cgpa) AS average_cgpa
FROM Student
GROUP BY department_id
HAVING AVG(cgpa) > 8.0;


-- Q8. Find the total number of students in each department

SELECT department_id,
       COUNT(*) AS total_students
FROM Student
GROUP BY department_id;


-- Q9. Display the highest and lowest marks scored in each subject

SELECT subject_id,
       MAX(marks) AS highest_marks,
       MIN(marks) AS lowest_marks
FROM Mark
GROUP BY subject_id;


-- Q10. Find students who scored more than 90 in any exam

SELECT DISTINCT s.student_name,
       m.marks
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks > 90;


-- Q11. Display the names of students who belong to the Computer Science department

SELECT s.student_name
FROM Student s
JOIN Department d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';


-- Q12. Find the number of subjects handled by each staff member

SELECT staff_id,
       COUNT(*) AS total_subjects
FROM Subject
GROUP BY staff_id;


-- Q13. Display students along with the total marks they obtained across all subjects

SELECT s.student_name,
       SUM(m.marks) AS total_marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id
GROUP BY s.student_name;


-- Q14. Find departments with more than 2 staff members

SELECT department_id,
       COUNT(*) AS total_staff
FROM Staff
GROUP BY department_id
HAVING COUNT(*) > 2;


-- Q15. Display students whose CGPA is above the average CGPA

SELECT student_name,
       cgpa
FROM Student
WHERE cgpa > (
    SELECT AVG(cgpa)
    FROM Student
);


-- Q16. Find staff members earning more than the average salary of their department

SELECT staff_name,
       salary,
       department_id
FROM Staff s
WHERE salary > (
    SELECT AVG(salary)
    FROM Staff
    WHERE department_id = s.department_id
);


-- Q17. Display the second highest salary among staff members

SELECT MAX(salary) AS second_highest_salary
FROM Staff
WHERE salary < (
    SELECT MAX(salary)
    FROM Staff
);


-- Q18. Find students who scored the highest marks in each subject

SELECT s.student_name,
       m.subject_id,
       m.marks
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks = (
    SELECT MAX(m2.marks)
    FROM Mark m2
    WHERE m.subject_id = m2.subject_id
);


-- Q19. Display all students and their marks, including students without marks

SELECT s.student_name,
       m.subject_id,
       m.marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id;


-- Q20. Find subjects where the average marks are below 70

SELECT subject_id,
       AVG(marks) AS average_marks
FROM Mark
GROUP BY subject_id
HAVING AVG(marks) < 70;


-- Q21. Display students ordered by CGPA in descending order

SELECT *
FROM Student
ORDER BY cgpa DESC;


-- Q22. Find the total salary expenditure department-wise

SELECT department_id,
       SUM(salary) AS total_salary
FROM Staff
GROUP BY department_id;


-- Q23. Display departments where the total salary exceeds 200000

SELECT department_id,
       SUM(salary) AS total_salary
FROM Staff
GROUP BY department_id
HAVING SUM(salary) > 200000;


-- Q24. Find students admitted after 2021 and having CGPA above 7.5

SELECT *
FROM Student
WHERE admission_year > 2021
AND cgpa > 7.5;


-- Q25. Display the number of students admitted each year

SELECT admission_year,
       COUNT(*) AS total_students
FROM Student
GROUP BY admission_year;


-- Q26. Find the city with the maximum number of students

SELECT city,
       COUNT(*) AS total_students
FROM Student
GROUP BY city
ORDER BY total_students DESC
LIMIT 1;


-- Q27. Display all departments and their staff count, including empty departments

SELECT d.department_name,
       COUNT(s.staff_id) AS total_staff
FROM Department d
LEFT JOIN Staff s
ON d.department_id = s.department_id
GROUP BY d.department_name;


-- Q28. Find students who have failed in at least one subject (marks < 50)

SELECT DISTINCT s.student_name
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks < 50;


-- Q29. Display staff hired before 2018

SELECT *
FROM Staff
WHERE hire_date < '2018-01-01';


-- Q30. Find departments where no staff salary is recorded as NULL

SELECT department_id
FROM Staff
GROUP BY department_id
HAVING COUNT(*) = COUNT(salary);



-- Q31. Assign a row number to students ordered by CGPA

SELECT student_name,
       cgpa,
       ROW_NUMBER() OVER (ORDER BY cgpa DESC) AS row_num
FROM Student;


-- Q32. Rank students based on their CGPA

SELECT student_name,
       cgpa,
       RANK() OVER (ORDER BY cgpa DESC) AS student_rank
FROM Student;


-- Q33. Display dense rank of staff salaries

SELECT staff_name,
       salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Staff;


-- Q34. Find the top 3 highest scoring students using window functions

SELECT *
FROM (
    SELECT s.student_name,
           m.marks,
           DENSE_RANK() OVER (ORDER BY m.marks DESC) AS rank_num
    FROM Student s
    JOIN Mark m
    ON s.student_id = m.student_id
) ranked_students
WHERE rank_num <= 3;


-- Q35. Display running total of marks for each student

SELECT student_id,
       marks,
       SUM(marks) OVER (
           PARTITION BY student_id
           ORDER BY exam_date
       ) AS running_total
FROM Mark;


-- Q36. Find the average marks for each subject using window functions

SELECT subject_id,
       marks,
       AVG(marks) OVER (
           PARTITION BY subject_id
       ) AS average_marks
FROM Mark;


-- Q37. Display previous exam marks for each student using LAG()

SELECT student_id,
       exam_date,
       marks,
       LAG(marks) OVER (
           PARTITION BY student_id
           ORDER BY exam_date
       ) AS previous_marks
FROM Mark;


-- Q38. Display next exam marks for each student using LEAD()

SELECT student_id,
       exam_date,
       marks,
       LEAD(marks) OVER (
           PARTITION BY student_id
           ORDER BY exam_date
       ) AS next_marks
FROM Mark;


-- Q39. Find the highest marks within each subject using MAX() OVER()

SELECT subject_id,
       marks,
       MAX(marks) OVER (
           PARTITION BY subject_id
       ) AS highest_marks
FROM Mark;


-- Q40. Display cumulative average marks ordered by exam date

SELECT exam_date,
       marks,
       AVG(marks) OVER (
           ORDER BY exam_date
       ) AS cumulative_average
FROM Mark;


-- Q41. Find the first student admitted in each department

SELECT *
FROM (
    SELECT student_name,
           department_id,
           admission_year,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY admission_year
           ) AS row_num
    FROM Student
) first_students
WHERE row_num = 1;


-- Q42. Display the latest hired staff member in each department

SELECT *
FROM (
    SELECT staff_name,
           department_id,
           hire_date,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY hire_date DESC
           ) AS row_num
    FROM Staff
) latest_staff
WHERE row_num = 1;


-- Q43. Divide students into 4 CGPA quartiles using NTILE()

SELECT student_name,
       cgpa,
       NTILE(4) OVER (
           ORDER BY cgpa DESC
       ) AS quartile
FROM Student;


-- Q44. Find percentage rank of students based on CGPA

SELECT student_name,
       cgpa,
       PERCENT_RANK() OVER (
           ORDER BY cgpa
       ) AS percentage_rank
FROM Student;


-- Q45. Display cumulative distribution of salaries

SELECT staff_name,
       salary,
       CUME_DIST() OVER (
           ORDER BY salary
       ) AS cumulative_distribution
FROM Staff;


-- Q46. Find subjects where a student's marks are above the subject average

SELECT student_id,
       subject_id,
       marks
FROM (
    SELECT student_id,
           subject_id,
           marks,
           AVG(marks) OVER (
               PARTITION BY subject_id
           ) AS average_marks
    FROM Mark
) subject_average
WHERE marks > average_marks;


-- Q47. Find departments whose average staff salary is higher than overall average salary

SELECT department_id,
       AVG(salary) AS average_salary
FROM Staff
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM Staff
);


-- Q48. Display students who scored above department average marks

SELECT *
FROM (
    SELECT s.student_name,
           d.department_name,
           m.marks,
           AVG(m.marks) OVER (
               PARTITION BY d.department_name
           ) AS department_average
    FROM Student s
    JOIN Department d
    ON s.department_id = d.department_id
    JOIN Mark m
    ON s.student_id = m.student_id
) dept_marks
WHERE marks > department_average;


-- Q49. Find the nth highest mark (3rd highest) using DENSE_RANK()

SELECT *
FROM (
    SELECT student_id,
           subject_id,
           marks,
           DENSE_RANK() OVER (
               ORDER BY marks DESC
           ) AS rank_num
    FROM Mark
) ranked_marks
WHERE rank_num = 3;


-- Q50. Generate a report showing student name, department, subject, exam type, marks, department average, and overall rank

SELECT s.student_name,
       d.department_name,
       sub.subject_name,
       m.exam_type,
       m.marks,
       AVG(m.marks) OVER (
           PARTITION BY d.department_name
       ) AS department_average,
       RANK() OVER (
           ORDER BY m.marks DESC
       ) AS overall_rank
FROM Student s
JOIN Department d
ON s.department_id = d.department_id
JOIN Mark m
ON s.student_id = m.student_id
JOIN Subject sub
ON m.subject_id = sub.subject_id;
