use demo_text;
show tables;
create table Employee(
empid int (2) Auto_increment primary key,
emp_name varchar(10),
dept_id int(1),
salary int(4),
manager int(1),
foreign key (dept_id)
references Department (dept_id)
);
create table Department(
dept_id int(1) primary key,
dept_name varchar(50)
);

insert into Department values
(1, 'Finance'),
(2, 'Training'),
(3, 'Marketing');
insert into Employee (emp_name, dept_id, salary, manager) values
('Arun', 1, 8000, 4),
('Kiran', 1, 7000, 1),
('Scott', 1, 3000, 1),
('Max', 2, 9000, null),
('Jack', 2, 8000, 4),
('King',null,6000,1);

select dept_name, emp_name from department, employee where department.dept_id = employee.dept_id;
select * from employee;
select * from department;
select * from employee, department where department.dept_id = employee.dept_id;
select dept_id,sum(salary) from employee group by (dept_id);
select dept_name, emp_name from department right outer join employee on department.dept_id = employee.dept_id;
select * from department right outer join employee on department.dept_id = employee.dept_id;
select * from employee right outer join department on employee.dept_id = department.dept_id;
select dept_name, emp_name from employee right outer join department on employee.dept_id = department.dept_id;
select dept_name, emp_name from department left outer join employee on department.dept_id = employee.dept_id;
select * from department left outer join employee on department.dept_id = employee.dept_id;
select dept_name, emp_name from department left outer join employee on department.dept_id = employee.dept_id;
select * from employee left outer join department on department.dept_id = employee.dept_id;
select e.emp_name 'Employee Name', m.emp_name 'Manager Name' from employee e
join employee m on e.manager = m.empid;
select emp_name, dept_name from employee join department on employee.dept_id = department.dept_id;
select emp_name, salary from employee
where salary = (select salary from employee where emp_name = 'Arun');
select emp_name, dept_id from employee
where dept_id = (select dept_id from employee where emp_name = 'Jack');
select emp_name, salary from employee
where salary = (select min(salary) from employee);
update employee
set salary = 15000
where dept_id = (select dept_id from 
(select dept_id from employee where emp_name = 'Max') as a);

create table Emp1(
emp_no int, emp_name varchar(20)
);

insert into Emp1 values(1,'A');
insert into Emp1 values(2,'B');
insert into Emp1 values(3,'C');

create table Emp2(
emp_no int, emp_name varchar(20)
);
insert into Emp2 values(1,'A');
insert into Emp2 values(2,'B');
insert into Emp2 values(4,'D');
insert into Emp2 values(5,'E');

select * from Emp1
UNION
select * from Emp2;

select Emp1.emp_no, Emp1.emp_name from Emp1, Emp2 where Emp1.emp_no = Emp2.emp_no;