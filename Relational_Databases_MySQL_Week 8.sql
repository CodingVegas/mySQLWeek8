--1. I want to know how many employees with each title were born after 1965-01-01.
select titles.title, count(employees.emp_no)
from employees
inner join titles on employees.emp_no = titles.emp_no
where employees.birth_date > '1965-01-01'
group by titles.title;

--2. I want to know the average salary per title.
select t.title as "Title", avg(s.salary) as "Average Salary" 
from titles as t
inner join salaries as s on t.emp_no = s.emp_no
group by Title;

--3. How much money was spent on salary for the marketing department between the years 1990 and 1992?
select 
dept_emp.dept_no as "Marketing", 
sum(salaries.salary) as "Total Salary"
from dept_emp
inner join salaries on dept_emp.emp_no = salaries.emp_no
where 
dept_emp.dept_no = 'd001'
and dept_emp.from_date >= '1990-01-01' 
and dept_emp.to_date <= '1992-12-31'
and salaries.from_date >= '1990-01-01' 
and salaries.to_date <= '1992-12-31';