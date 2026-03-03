-- Show all employees from IT department

-- Whose salary is greater than 50,000
-- Sort by salary in descending order


   

alter table emp_per rename to emp;



select * from emp;

select emp_name,department,salary from emp
where department = 'IT' and salary >50000 
 order by salary desc;






-- Show department

-- Count total employees per department

-- Show average salary per department

-- Only show departments where average salary > 60000

-- Sort by average salary descending

select department,
round(count(emp_id),1) as total_emp,
round(avg(salary),1) as avg_salary from emp
group by department
having avg(salary) > 60000
order by avg_salary desc;


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


INSERT INTO departments (department_id, department_name) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

INSERT INTO employees (emp_id, emp_name, department_id, salary) VALUES
(1, 'Amit', 101, 60000),
(2, 'Rahul', 102, 45000),
(3, 'Sneha', 101, 75000),
(4, 'Priya', 103, 52000),
(5, 'Karan', 102, 80000);



select * from departments;
select * from employees;


select e.emp_name,d.department_name,e.salary from employees as e
join departments as d
on 
e.department_id = d.department_id
where e.salary > 50000;


select e.emp_name,d.department_name,e.salary from employees as e
left join departments as d
on 
e.department_id = d.department_id
where e.salary > 50000;

-- Write a query to find employees whose salary is greater
-- than the average salary of all employees.

select emp_name,salary from employees
where salary > (select avg(salary) from employees);


-- Find the Second Highest Salary

select max(salary) as sec_msalary from employees
where salary < (select max(salary) from employees);


-- Find the Second Highest Salary with name

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )


-- Write query using DENSE_RANK()
-- to find second highest salary.

select emp_name,salary from 
( select emp_name,salary,
  dense_rank() over(order by salary desc) as salary_rank
  from employees) as ranked
  where salary_rank = 2;


select plan_type, count(user_id)as total_user,
sum(amount) as revenue from subscriptions
where status = 'Active'
group by plan_type
order by revenue desc;

select plan_type,
count(user_id) as total_users,
sum(amount) as revenue,
sum(amount)*100.0/sum(sum(amount)) over())as revenue_per
from subscriptions
where  status = 'Active'
group by plan_type
order by revenue desc;








