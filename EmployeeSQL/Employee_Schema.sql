DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_mgr;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titiles


-- Create a table of departments
CREATE TABLE departments (
  dep_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR NOT NULL
);


- Craete a table for titles 
CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  title VARCHAR(255)
);

-- Create a table of employees
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
  birth_date VARCHAR,
  first_name TEXT,
  last_name TEXT,
  sex VARCHAR,
  hire_date VARCHAR
);

-- Create a junction table for departments and employees.
CREATE TABLE dept_emp (
  emp_no INT,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dep_no VARCHAR,
  FOREIGN KEY (dep_no) REFERENCES departments(dep_no),
  PRIMARY KEY (dep_no, emp_no)
);

-- Create a junction table for departments and managers.
CREATE TABLE dept_mgr (
  dep_no VARCHAR,
  FOREIGN KEY (dep_no) REFERENCES departments(dep_no),
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (dep_no, emp_no)
);

--Create a table for Salaries
CREATE TABLE salaries (
  id SERIAL PRIMARY KEY,
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary INT NOT NULL
);



