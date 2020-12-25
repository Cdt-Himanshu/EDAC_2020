create database demo_test;
use demo_test;
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

-- 1
delimiter $$
CREATE FUNCTION factorial(num int)
RETURNS INT
BEGIN
	DECLARE fact, i int;
    SET fact = 1;
    SET i = 1;
		L1 : LOOP
			IF(num>0) THEN
				SET fact=fact*i;
				SET num=num-1;
				SET i=i+1;
				ITERATE L1;
            ELSE
				LEAVE L1;
			END IF;
		END LOOP L1;
		RETURN fact;
END $$

select factorial(0) as factorial;
select factorial(1) as factorial;
select factorial(2) as factorial;
select factorial(3) as factorial;
select factorial(4) as factorial;

-- 3
delimiter $$
create function Converter(inches int) RETURNS VARCHAR(50)
BEGIN
select floor(num/36);
select num = num % 36;
select floor(num/12);
select num = num%12;
RETURN concat(floor(num/36), 'Inches');
END $$

select Converter(124);
-- 4
delimiter $$
create function update_salary(dno int)
RETURNS varchar(50)
BEGIN
update Emp SET sal = (sal+sal * 0.1) where deptno = dno;
RETURN 'Check for updation of salary in emp';
END $$

select update_salary(10);
select * from emp;

-- 5