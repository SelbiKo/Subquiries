-- From the following table, write a SQL query to find those employees who receive a higher salary than the employee with ID 163. Return first name, last name. 
select firstname, lastname
from employees
where salary > (select salary from employees where emloyee_id = 163);

-- From the following table, write a SQL query to find those employees whose salary matches the lowest salary of any of the departments. Return first name, last name and department ID. 
select firstname, lastname, department_id
from employees
where salary = (select min(salary) from employees group by department_id);

-- From the following table, write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.
select employee_id, first_name, last_name
from employee
where salary > (select avg(salary) from employee);

-- From the following table, write a SQL query to find those employees who report to that manager whose first name is ‘Payam’. Return first name, last name, employee ID and salary. 
select first_name, last_name, employee_id, salary
from employee
where manager_id in (select employee_id from employees where first_name = 'Payam');

-- From the following tables, write a SQL query to find those employees who do not work in the departments where managers’ IDs are between 100 and 200 (Begin and end values are included.). Return all the fields of the employeess.  
select *
from employees  
where department_id not in (select department_id from departments
where manager_id between 100 and 200);

-- From the following tables, write a SQL query to find those employees who work in the same department as ‘Clara’. Exclude all those records where first name is ‘Clara’. Return first name, last name and hire date.
select first_name, last_name, hire_date
from employees
where department_id =(select department_id from employees where first_name = 'Clara' and first_name <> 'Clara');

-- From the following tables, write a SQL query to find those employees who earn more than the average salary and work in the same department as an employee whose first name contains the letter 'J'. Return employee ID, first name and salary. 
select employee_id, first_name, salary
from employees
where salary > (select avg(salary) from employees)
and department_id in (select department_id from employees where first_name like '%J%');

--  From the following table, write a SQL query to find those employees whose salary is lower than that of employees whose job title is ‘MK_MAN’. Return employee ID, first name, last name, job ID.
select *
from employees
where salary < (select salary from employee where job_id = 'MK_MAN');

-- Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.
select *,
case when salary < (select avg(salary) from employees )then 'Low'
else 'High' end as SalaryStatus
from employees;

-- From the following tables, write a SQL query find the employees who report to a manager based in the United States. Return first name, last name.
select *
from employees 
where manager_id in (select employee_id from employees 
where department_id in (select department_id from departments 
where location_id in (select location_id from locations where country_id ='US')));

-- From the following tables, write a SQL query to find those employees whose salaries exceed 50% of their department's total salary bill. Return first name, last name.  
select *
from employees e1 
where salary > (select (sum(salary))* 0.5
from employee e2
where e1.department = e2.department);
 
-- From the following tables, write a SQL query to find those employees who are managers. Return all the fields of employees table.
select *
from employee 
where exists (select * from departments where manager_id = employee_id);

-- From the following table, write a SQL query to find those employees who earn more than the maximum salary for a department of ID 40. Return first name, last name and department ID.
select *
from employees
where salary > (select max(salary) from employees where departmnet_id = 40);

-- From the following table, write a SQL query to find departments for a particular location. The location matches the location of the department of ID 30. Return department name and department ID. 
select *
from departments 
where location_id = (select location_id from departments where department_id = 30);

-- From the following table, write a SQL query to find employees who work for the department in which employee ID 201 is employed. Return first name, last name, salary, and department ID.
select *
from employees
where department_id in (select department_id from employees
 where employee_id = 201);

-- From the following table, write a SQL query to find those employees whose salary matches that of the employee who works in department ID 40. Return first name, last name, salary, and department ID. 
select *
from employees
where salary = (select salary from employee where department_id = 40 );

-- From the following table, write a SQL query to find those employees who joined after the employee whose ID is 165. Return first name, last name and hire date.
select concat(first_name, '', last_name) as full_name, hire_date
from employee
where hire_date > (select hire_date from employees where employee_id = 165);

-- From the following table, write a SQL query to find those employees who earn less than the minimum salary of a department of ID 70. Return first name, last name, salary, and department ID. 
select *
from employee
where salary < (select min(salary) from employees where department_id = 70);

-- From the following table, write a SQL query to find those employees who earn less than the average salary and work at the department where Laura (first name) is employed. Return first name, last name, salary, and department ID.
select first_name, last_name, salary, department_id
from employee
where salary < (select avg(salary) from employees) and department_id = 
(select department_id from employees where first_name = 'Laura') ;

-- From the following tables, write a SQL query to find those departments where the starting salary is at least 8000. Return all the fields of departments.
select *
from departments 
where department_id in (select department_id from employees 
group by department_id 
having min(salary) >= 8000) ;





           



