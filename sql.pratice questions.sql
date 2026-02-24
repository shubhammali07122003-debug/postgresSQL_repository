-- find the second highest salary

SELECT * FROM employees;


select distinct salary from employees
order by salary desc
limit 1 offset 1;


-- subquery 

select max(salary) from employees
where salary < (select max(salary) from employees);


-- Department-wise Employee Count

select * from departments;

select * from employees;

SELECT department_id, COUNT(emp_id) AS total_employees
FROM employees
GROUP BY department_id;


-- joins
select d.department_name , count(emp_id) as total_employees
from employees e
inner join departments as d
on e.department_id = d.department_id
group by d.department_name;

--  monthly sales revenue

select * from orders;

select
    date_trunc('month',order_date) as month,
	sum(amount) as total_revenue
	from orders
	group by date_trunc('month',order_date)
	order by month;

--- yearly sales revenue

select * from orders;


SELECT 
    date_trunc('year',order_date) as year,
	sum(amount) as total_amount from orders
	group by date_trunc('year',order_date)
	order by year;

-- Top 3 Highest Salaries

select * from employees;

select  name,salary,
rank() over(order by salary desc)
from employees


select department_id,count(emp_id) as total_emp
from employees
group by department_id
having count(emp_id) > 2;

--  find duplicate salaries

select salary , count(*) as total_count
from employees
group by salary
having count(*) > 1;






limit 3;

	










	
	





