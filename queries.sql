CREATE TABLE employees (
	emp_no SERIAL PRIMARY KEY,
	emp_title_id VARCHAR(30),
	birth_date DATE, 
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(5),
	hire_date DATE
);

DROP TABLE departments;

CREATE TABLE departments (
	dept_no VARCHAR(30),
	dept_name VARCHAR(50)
);

DROP TABLE dept_employees;

CREATE TABLE dept_employees (
	employee_id INTEGER,
	dept_no VARCHAR
)

DROP TABLE managers;

CREATE TABLE managers (
	dept_no VARCHAR(30),
	employee_id INTEGER
)

DROP TABLE salaries;

CREATE TABLE salaries (
	employee_id INTEGER,
	salary INTEGER
)

DROP TABLE titles;

CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
)
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp_no, last_name, first_name, sex, s.salary 
FROM employees AS e
LEFT JOIN salaries AS s
ON s.employee_id = e.emp_no

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no, d.dept_name, m.employee_id, e.last_name, e.first_name
FROM departments AS d
JOIN managers AS m
ON m.dept_no = d.dept_no
JOIN employees AS E
ON e.emp_no = m.employee_id

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de
ON de.employee_id = e.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de
ON de.employee_id = e.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de
ON de.employee_id = e.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC