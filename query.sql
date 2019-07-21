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
	
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
Select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary from employees inner join salaries on employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

-- 2. List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, EXTRACT(YEAR FROM hire_date) FROM employees where EXTRACT(YEAR FROM hire_date)='1986';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
Select department_managers.dept_no, departments.dept_name, department_managers.emp_no, employees.last_name, employees.first_name, department_managers.from_date, department_managers.to_date
from department_managers INNER JOIN departments 
ON department_managers.dept_no = departments.dept_no
INNER JOIN employees
ON department_managers.emp_no = employees.emp_no
INNER JOIN employees_departments
ON department_managers.emp_no = employees_departments.emp_no
ORDER BY department_managers.dept_no

--Test query please ignore
--select employees.hire_date, employees_departments.to_date from 
--employees_departments INNER JOIN employees 
--ON employees.emp_no = employees_departments.emp_no WHERE employees.emp_no = '10088'

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from
employees INNER JOIN employees_departments
ON employees.emp_no = employees_departments.emp_no
INNER JOIN departments ON employees_departments.dept_no = departments.dept_no
ORDER BY employees.emp_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
Select employees.first_name, employees.last_name from employees 
where employees.first_name='Hercules' AND employees.last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from
employees INNER JOIN employees_departments
ON employees.emp_no = employees_departments.emp_no
INNER JOIN departments ON employees_departments.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007'
ORDER BY employees.emp_no

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from
employees INNER JOIN employees_departments
ON employees.emp_no = employees_departments.emp_no
INNER JOIN departments ON employees_departments.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' or departments.dept_no = 'd005'
ORDER BY employees.emp_no

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select employees.last_name, COUNT(employees.last_name) from employees
GROUP BY employees.last_name
ORDER BY COUNT(employees.last_name) DESC

-- Bonus Get average salary by title
select titles.title, round(AVG(salaries.salary)) As "AVG Salary" from 
titles INNER JOIN salaries ON titles.emp_no = salaries.emp_no
GROUP BY titles.title

