-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no,emp.last_name,emp.first_name,emp.sex,sal.salary
FROM "Employees" AS emp
INNER JOIN "Salaries" AS sal 
ON sal.emp_no = emp.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM "Employees" AS emp
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dep.dept_no, dep.dept_name, dep_mgr.emp_no, emp.last_name, emp.first_name
FROM "Departments" AS dep
	JOIN "Dept_Mgr" AS dep_mgr
	ON (dep.dept_no=dep_mgr.dept_no)
		JOIN "Employees" AS emp
		ON (dep_mgr.emp_no=emp.emp_no);
        
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM "Employees" AS emp
    JOIN "Dept_Emp" AS dep_emp
    ON (emp.emp_no=dep_emp.emp_no)
        JOIN "Departments" as dep
        ON (dep_emp.dept_no=dep.dept_no);
        
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM "Employees" AS emp
	JOIN "Dept_Emp" AS dep_emp
	ON (emp.emp_no=dep_emp.emp_no)
		JOIN "Departments" as dep
		ON (dep_emp.dept_no=dep.dept_no)
		WHERE dep.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM "Employees" AS emp
	JOIN "Dept_Emp" AS dep_emp
	ON (emp.emp_no=dep_emp.emp_no)
		JOIN "Departments" AS dep
		ON (dep_emp.dept_no=dep.dept_no)
		WHERE dep.dept_name = 'Sales' OR dep.dept_name = 'Development';

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, 
COUNT(last_name) AS Frequency
FROM "Employees"
GROUP BY last_name
ORDER BY Frequency DESC;