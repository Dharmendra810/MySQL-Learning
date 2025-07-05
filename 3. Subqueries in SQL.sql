## Subqueries
# subqueries with select statement

select * from employees;

select emp_name, dept, salary from employees
where salary < (select avg(salary) from employees);

# subqueries with insert statement

create table products
(product_id int, item varchar(30), sell_price float, product_type varchar(30));

insert into products
values(101, 'Jewellery', 1800, 'Luxury'),
(102, 'T-shirt', 100, 'Non-Luxury'),
(103, 'Laptop', 1300, 'Luxury'),
(104, 'Table', 400, 'Non-Luxury');

select * from products;

create table orders
(order_id int, Product_sold varchar(30), selling_price float);

insert into orders
select product_id, item, sell_price
from products where product_id in
(select product_id from products where sell_price>1000);

select * from orders;

# subqueries with the UPDATE statement

create table employees_b ( Emp_ID int primary key, Emp_name varchar(25), Age int, Gender char(1), DOJ date,
Dept varchar(25), City varchar(20), Salary float);
describe employees_b;
insert into employees_b values
(111, "Ravi", 25, "M", "2022-05-02", "Sales", "Delhi", 28000),
(112, "Sam", 24, "M", "2022-05-02", "Management", "Gurgaon", 25000),
(113, "Sumit", 23, "M", "2022-04-14", "IT", "Delhi", 22000),
(114, "Dharam", 24, "M", "2022-05-12", "IT", "Delhi", 24000),
(115, "Komal", 22, "F", "2022-05-10", "Sales", "Mumbai", 26000),
(116, "Tripti", 20,"F", "2022-04-20", "Tech", "Hyderabad", 28000);

create table employees_e ( Emp_ID int primary key, Emp_name varchar(25), Age int, Gender char(1), DOJ date,
Dept varchar(25), City varchar(20), Salary float);
describe employees_e;
insert into employees_e values
(101, "Ravi", 25, "M", "2022-05-02", "Sales", "Delhi", 28000),
(102, "Sam", 24, "M", "2022-05-02", "Management", "Gurgaon", 25000),
(103, "Sumit", 23, "M", "2022-04-14", "IT", "Delhi", 22000),
(104, "Dharam", 24, "M", "2022-05-12", "IT", "Delhi", 24000),
(105, "Komal", 22, "F", "2022-05-10", "Sales", "Mumbai", 26000),
(106, "Tripti", 20,"F", "2022-04-20", "Tech", "Hyderabad", 28000);

update employees
set salary = salary * 0.5
where age in (select age from employees_e where age>=24);

select * from employees;
select * from employees_e;

# subqueries with DELETE  statement

delete from employees
where emp_id in (select emp_id from employees_b where emp_id>110);
