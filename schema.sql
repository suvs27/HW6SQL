-- Database: HW6

-- DROP DATABASE "HW6";

CREATE DATABASE "HW6"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

Select * from departments

CREATE TABLE employees (
	emp_no integer NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(5) NOT NULL,
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no)
);

Select * FROM employees

CREATE TABLE employees_departments (
id SERIAL PRIMARY KEY,
emp_no INTEGER NOT NULL,
dept_no VARCHAR(30) NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

Select * from employees_departments

CREATE TABLE department_managers (
id SERIAL PRIMARY KEY,
dept_no VARCHAR NOT NULL,
emp_no INTEGER NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

Select * from department_managers

CREATE TABLE salaries (
id SERIAL PRIMARY KEY,
emp_no INTEGER NOT NULL,
salary INTEGER NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

Select * from salaries

CREATE TABLE salaries (
id SERIAL PRIMARY KEY,
emp_no INTEGER NOT NULL,
salary INTEGER NOT NULL,
from_date date NOT NULL,
to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
id SERIAL PRIMARY KEY,
emp_no INTEGER NOT NULL,
title VARCHAR(100),
from_date date NOT NULL,
to_date date NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

Select * from titles