--Querry tables
select * from departments;
select * from titles;
select * from employees;
select * from dept_emp;
select * from dept_mgr;
select * from salaries;

--1)List for each employee: employee number,last name, first name, sex, and salary.
SELECT employees.emp_no AS "employee number", 
       employees.last_name AS "last name",
       employees.first_name AS "first name",
       employees.sex AS sex,
       salaries.salary
	FROM employees
	LEFT JOIN salaries
	ON employees.emp_no = salaries.emp_no;

--2)List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name AS "first name", e.last_name AS "last name", e.hire_date AS "hire date"
	FROM employees AS e
	WHERE hire_date LIKE '%1986%';

--3)List the manager of each department with the following information: department number, department name,
--the manager's employee number, last name, first name.

SELECT departments.dep_no AS "depart number", departments.dept_name AS "depart name", 
       dept_mgr.emp_no AS "manger's emp_no", employees.last_name AS "last name", employees.first_name AS "first name"
  FROM departments
  LEFT JOIN dept_mgr
  ON departments.dep_no = dept_mgr.dep_no
  LEFT JOIN employees
  ON dept_mgr.emp_no = employees.emp_no;

--4)List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
SELECT employees.emp_no AS "employee no", employees.last_name AS "last name", employees.first_name AS "first name", 
       departments.dept_name AS "depart name"
	FROM employees
	LEFT JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
	LEFT JOIN departments
	ON dept_emp.dep_no = departments.dep_no;

--5)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin 
--with "B."
SELECT e.first_name AS "first name", e.last_name AS "last name", e.sex AS sex
	FROM employees AS e
	WHERE first_name = 'Hercules' AND last_name like 'B%';


--6)List all employees in the Sales department, including their employee number, last name, first name, 
--and department name.

SELECT employees.emp_no AS "employee no", employees.last_name AS "last name", employees.first_name AS "first name", 
       departments.dept_name AS "depart name"
	FROM employees
	LEFT JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
	LEFT JOIN departments
	ON dept_emp.dep_no = departments.dep_no
	WHERE dept_name ='Sales';


--7)List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.

SELECT employees.emp_no AS "employee no", employees.last_name AS "last name", employees.first_name AS "first name", 
       departments.dept_name AS "depart name"
	FROM employees
	LEFT JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
	LEFT JOIN departments
	ON dept_emp.dep_no = departments.dep_no
	WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8)In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.
SELECT employees.last_name, COUNT(employees.last_name) AS "Last Name Count"
 FROM employees
 GROUP BY employees.last_name
 ORDER BY"Last Name Count" Desc;




