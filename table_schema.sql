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
);

DROP TABLE managers;

CREATE TABLE managers (
	dept_no VARCHAR(30),
	employee_id INTEGER
);

DROP TABLE salaries;

CREATE TABLE salaries (
	employee_id INTEGER,
	salary INTEGER
);

DROP TABLE titles;

CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);