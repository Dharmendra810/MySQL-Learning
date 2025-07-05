show databases;
use mysql;
show tables;
select * from engine_cost;
select * from func;
describe engine_cost;
create database sql_intro;
show databases;

create table emp_details (Name varchar(25), Age int, Sex char(1), DOJ date, City varchar(15), Salary float);

describe emp_details;

insert into emp_details
values("Dharmendra", 25, "M", "2022-05-12", "Delhi", 20000),
("Sam", 26, "M", "2022-05-15", "Gurgaon", 22000),
("Naveen", 28, "M", "2022-05-25", "Ballabhgarh", 20000),
("Satender", 23, "M", "2022-05-30", "Delhi", 22000),
("Kumkum", 20, "F", "2022-05-01", "Kapasheda", 1600);

select * from emp_details;

select distinct city from emp_details;

select count(Name) from emp_details;
select count(Name) as count_name from emp_details;

select sum(salary) from emp_details;
select avg(salary) from emp_details;
select name, age, city from emp_details;

select * from emp_details where age > 25;

select name, sex, city from emp_details where sex = "F";

select * from emp_details where city = "delhi" or city = "gurgaon";
select * from emp_details where city in ( 'delhi', 'gurgaon');
select * from emp_details where doj between '2022-05-15' and '2022-05-31';

select * from emp_details where
age>=25 and sex = 'm';

select sex, sum(salary) as total_salary from emp_details
group by sex;

select * from emp_details order by salary;
select * from emp_details order by salary desc;

select (10+20) as Addition;
select (10-20) as Subtraction;

select length('India') as total_lenght;
select repeat('@', 10) as 'repeat';

select upper('india');
select lower('INDIA');

select curdate();
select day(curdate());
select now();

select character_length('India') as total_lenght;
select name, character_length(name) as total_lenght from emp_details;

select concat('India', ' is', ' in Asia') as merged;
select name, age, concat(name, " ", age) as name_age from emp_details;

select reverse('india');
select reverse(name) from emp_details;

select replace("Orange is a vegetable", "vegetable", "Fruit");

select length("      India               ");
select ltrim("      India               ");
select length(ltrim("      India               "));
select length(rtrim("      India               "));
select trim("      India               ");

select position("Fruit" in "Orange is a Fruit");

select ascii('a');
select ascii('d');
select ascii('8');

show databases;
use sql_intro;
show tables;
create table employees ( Emp_ID int primary key, Emp_name varchar(25), Age int, Gender char(1), DOJ date,
Dept varchar(25), City varchar(20), Salary float);
describe employees;
insert into employees values
(101, "Ravi", 25, "M", "2022-05-02", "Sales", "Delhi", 28000),
(102, "Sam", 24, "M", "2022-05-02", "Management", "Gurgaon", 25000),
(103, "Sumit", 23, "M", "2022-04-14", "IT", "Delhi", 22000),
(104, "Dharam", 24, "M", "2022-05-12", "IT", "Delhi", 24000),
(105, "Komal", 22, "F", "2022-05-10", "Sales", "Mumbai", 26000),
(106, "Tripti", 20,"F", "2022-04-20", "Tech", "Hyderabad", 28000);

select * from employees;

select distinct city from employees;
select distinct dept from employees;

select avg(age) from employees;
select dept, avg(age) from employees group by dept;
select dept, round(avg(age),1) as average_age from employees group by dept;

select dept, sum(salary) as total_salary from employees group by dept;

select count(Emp_ID), city from employees
group by city
order by count(Emp_ID) desc;

select month(doj) as month, count(emp_id) from employees
group by month(doj);

create table sales (prodect_id int, sell_price float, quantity int, state varchar(25));
insert into sales values
(121, 320, 3, "A"),
(121, 320, 6, "B"),
(121, 320, 4, "c"),
(123, 290, 2, "B"),
(123, 290, 2, "A"),
(123, 290, 4, "D"),
(121, 320, 7, "E"),
(121, 320, 2, "F"),
(123, 290, 8, "G");

select * from sales;

select prodect_id, sum(sell_price*quantity) as revenue from sales group by prodect_id;

create table c_product (product_id int, cost_price float);
insert into c_product
values(121, 270),
(123, 250);

create table c_prodect (prodect_id int, cost_price float);

insert into c_prodect
values(121, 270),
(123, 250);

select c.prodect_id, sum((s.sell_price - c.cost_price) * s.quantity) as profit
from sales as s inner join c_prodect as c 
where s.prodect_id = c.prodect_id
group by c.prodect_id;

select * from employees;

select dept, avg(salary) as avg_salary
from employees
group by dept
having avg(salary) > 23000;

select city, sum(salary) as total_salary
from employees
group by city
having sum(salary) >25000;

select dept, count(*) as emp_count
from employees
group by dept
having count(*) > 1;

select city, count(*) as emp_count
from employees
where city != "gurgaon"
group by city
having count(*) > 1;

select dept, count(*) as emp_count
from employees
group by dept
having avg(Salary) > 25000;
