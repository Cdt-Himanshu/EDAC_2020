use demo_text;
create table Emp(
empno int(4) not null,
ename varchar(30) not null,
job varchar(10),
mgr int(4),
hiredate date,
sal numeric(7,2),
deptno numeric(2)
);
insert into Emp (empno, ename, job, mgr, hiredate, sal, deptno) values
(1000,'Manish','Salesman',1003,'2020-02-18',600, 30),
(1001,'Manoj','Salesman', 1003,'2018-02-18',600, 30),
(1002,'Ashish','Salesman', 1003,'2013-02-18',750, 30),
(1004,'Rekha','Analyst', 1006,'2001-02-18',3000, 10),
(1005,'Sachin','Analyst', 1006,'2019-02-18',3000, 10),
(1006,'Pooja','Manager', null,'2000-02-18',6000, 10);
create table dept(
dno int(4) not null,
dname varchar(10) not null,
area varchar(30)
);
insert into dept(dno, dname, area) values
(10, 'Store', 'Mumbai'),
(20, 'Purchase','Mumbai'),
(30, 'Store','Delhi'),
(40,'Marketing','Pune'),
(50, 'Finance','Delhi'),
(60,'Accounts', 'Mumbai');
select * from emp;
select * from dept;

delimiter $$
create procedure arithmetic(IN x int, IN y int)
BEGIN
select x+y as addition;
select x-y as subtraction;
select x*y as multipliction;
select x/y as division;
END $$
show create procedure arithmetic;
call arithmetic(8,2);

delimiter $$
create procedure proc5()
BEGIN
insert into dept (dno, dname, area) values
(60, 'Education', 'Pune');
END $$
call proc5();
select * from dept;

delimiter $$
create procedure proc2(IN str varchar(8))
BEGIN
select reverse(str);   
END $$
call proc2('database');

delimiter $$
create procedure proc3()
BEGIN
select empno, ename, sal from emp
order by sal desc limit 5;
END $$
call proc3();

delimiter $$
create procedure proc4()
BEGIN
create table emp_test
(e_id int, e_name varchar(10), e_joining_date date);
END $$
desc emp_test;
call proc4();

delimiter $$
create procedure proc6(IN num int)
BEGIN
select num as number;
select num*num as square;
select num*num*num as cube;
END $$
call proc6(4);

delimiter $$
create procedure proc7(out ans int)
BEGIN
Declare num int;
SET num = 4;
Select num INTO ans;
END $$

call proc7(@ans);
select (@ans) as Answer;

delimiter $$
create procedure proc8(in x int, out str varchar(20))
BEGIN
select concat(E.ename, ' is from ', D.dname) into str from emp E inner join dept D on E.deptno = D.dno
where E.empno = 1004 and E.deptno = x; 
END $$

call proc8(10, @str);
select(@str) as String;