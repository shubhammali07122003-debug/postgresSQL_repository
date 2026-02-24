
Create table departments(
department_id int primary key,
department_name varchar(50)
);

select * from departments;

insert into departments values
(1,'Hr'),
(2,'IT'),
(3,'Sales'),
(4,'Finance');


-- Employees table

create table employees(
emp_id int primary key,
name varchar(50),
salary int,
department_id int,
Foreign key (department_id) references departments(department_id)
);


select * from employees;


insert into employees values
(101,'Amit',50000,2),
(102, 'Neha', 60000, 2),
(103, 'Raj', 45000, 3),
(104, 'Priya', 70000, 1),
(105, 'Sohan', 55000, 3),
(106, 'Kiran', 80000, 2),
(107, 'Anjali', 40000, 4),
(108, 'Rohit', 75000, 3);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Customer A'),
(2, 'Customer B'),
(3, 'Customer C'),
(4, 'Customer D'),
(5, 'Customer E');

select * from customers;



create table orders (
order_id int primary key,
customer_id int,
order_date date,
amount int,
foreign key(customer_id)references customers(customer_id)
);


insert into orders values
(201,1,'2025-01-10',5000),
(202, 2, '2025-01-15', 7000),
(203, 1, '2025-02-05', 6000),
(204, 3, '2025-02-10', 4000),
(205, 2, '2025-03-12', 8000);

select * from orders;
















