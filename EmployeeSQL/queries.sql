-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s
on e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
 
SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
	AND hire_date < '1987-01-01';
	
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.dept_no,
	m.emp_no,
	d.dept_name,
	e.first_name,
	e.last_name
FROM dept_manager m
INNER JOIN departments d
ON m.dept_no = d.dept_no
INNER JOIN employees e
ON M.emp_no = e.emp_no;	

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_name,
	de.dept_no,
	de.emp_no, 
	e.first_name, 
	e.last_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no,
	e.first_name,
	e.last_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
WHERE de.dept_no = (
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales');

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(last_name) AS "last name frequency"
FROM employees
GROUP BY last_name
ORDER BY "last name frequency" DESC;