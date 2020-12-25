use demo_text;
create table Employee(
empid int (2) Auto_increment primary key,
emp_name varchar(10),
dept_id int(1),
salary int(4),
manager int(1),
foreign key (dept_id)
references Department (dept_id)
);
select * from Department;
select * from Employee;

create table Department(
dept_id int(1) primary key,
dept_name varchar(50)
);
drop table Employee;
desc Department;
desc Employee;
insert into Employee (emp_name, dept_id, salary, manager) values
('Arun', 1, 8000, 4),
('Kiran', 1, 7000, 1),
('Scott', 1, 3000, 1),
('Max', 2, 9000, null),
('Jack', 2, 8000, 4),
('King',null,6000,1);
insert into Department values
(1, 'Finance'),
(2, 'Training'),
(3, 'Marketing');
alter table Employee auto_increment = 1;
alter table Employee modify emp_name varchar(10) not null;
select sum(salary) from Employee;
select sum(salary) dept_id from Employee
group by dept_id;

select count(salary) dept_id from Employee
group by dept_id;
select * from Employee 
order by dept_id;

select sum(salary) dept_id from Employee
group by dept_id
having sum(salary)>17000;

select sum(salary) as dept_id from Employee
group by dept_id
having sum(salary) > 18000;

select sum(salary) dept_id from Employee
group by dept_id
having sum(salary)<20000;