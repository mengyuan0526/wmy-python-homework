-- LINK : Employee_management
-- 2.1 Select the last name of all employees.
Select lastname from employees;
-- 2.2 Select the last name of all employees, without duplicates.
Select DISTINCT lastname from employees;
-- 2.3 Select all the data of employees whose last name is "Smith".
Select * FROM employees WHERE lastname='Smith';
-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
 Select * FROM employees WHERE lastname='Smith' or lastname='Doe';
-- 2.5 Select all the data of employees that work in department 14.
Select * from employees where department=14;
-- 2.6 Select all the data of employees that work in department 37 or department
-- 77.
Select * FROM employees WHERE department=37 or department=77;
-- 2.7 Select all the data of employees whose last name begins with an "S".
Select * FROM employees WHERE lastname like 'S%';
-- 2.8 Select the sum of all the departments' budgets.
Select sum(b.budget) from employees a INNER JOIN departments b on a.department=b.code;
-- 2.9 Select the number of employees in each department (you only need to show
-- the department code and the number of employees).

Select b.code,count(a.name) from employees a INNER JOIN departments b on a.department=b.code group by b.code; 

-- 2.10 Select all the data of employees, including each employee's department's
-- data.
Select * from employees a INNER JOIN departments b on a.department=b.code;
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
Select a.name,a.lastname,b.name,b.budget from employees a INNER JOIN departments b on a.department=b.code;
-- 2.12 Select the name and last name of employees working for departments with
-- a budget greater than $60,000.
Select a.name,a.lastname from employees a INNER JOIN departments b on a.department=b.code WHERE b.budget>60000;
-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
Select a.department,b.budget from employees a INNER JOIN departments b on a.department=b.code WHERE b.budget > (Select avg(budget) from departments);
-- 2.14 Select the names of departments with more than two employees.
Select b.name from employees a INNER JOIN departments b on a.department=b.code group by b.code HAVING count(a.name)>2; 
-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
Select a.name,a.lastname from employees a INNER join departments b on a.department=b.code WHERE b.budget=55000;
-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
Insert into departments (code,name,budget) values(11,'Quality Assurance',40000)
-- And Add an employee called "Mary Moore" in that department, with SSN
-- 847-21-9811.
Insert into employees (ssn,name,lastname,department) values(847219811,'Mary','Moore',11)

-- 2.17 Reduce the budget of all departments by 10%.
Select code,name,budget*0.9 from departments;
-- 2.18 Reassign all employees from the Research department (code 77) to the IT
-- department (code 14).
update employees set department=14 where department=77;

-- 2.19 Delete from the table all employees in the IT department (code 14)
Delete from employees where department=14;
-- 2.20 Delete from the table all employees who work in departments with a
-- budget greater than or equal to $60,000.
Select * from employees;
Select * from departments;
Delete from employees WHERE department in (SELECT b.code FROM employees a INNER JOIN departments b on a.department=b.code where b.budget>=60000);

-- 2.21 Delete from the table all employees.
drop table employees;
