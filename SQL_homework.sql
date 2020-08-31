select * from public."Departments"
select e.*, d.* 
from public."Dept_Emp" de 
inner join public."Employees" e on  e.emp_no = de.emp_no 
inner join public."Departments" d on d.dept_no = de.dept_no 

--List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from public."Employees" e
inner join public."Salaries" s on e.emp_no = s.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.

select e.first_name, e.last_name, e.hire_date
from public."Employees" e 
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from public."Dept_Manager" dm 
inner join public."Employees" e on  e.emp_no = dm.emp_no 
inner join public."Departments" d on d.dept_no = dm.dept_no 

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no
inner join public."Departments" d on d.dept_no = de.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from public."Employees" e 
where first_name = 'Hercules'
and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no
inner join public."Departments" d on d.dept_no = de.dept_no
where dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from public."Employees" e
inner join public."Dept_Emp" de on de.emp_no = e.emp_no
inner join public."Departments" d on d.dept_no = de.dept_no
where dept_name = 'Sales'or dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select e.last_name, count(e.last_name)
from public."Employees" e
group by e.last_name 
order by e.last_name desc 
