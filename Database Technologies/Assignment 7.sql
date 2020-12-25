use demo_test;
create table Ord_master(
Ord_no int,
Cust_cd varchar(2),
Status varchar(1)
);
insert into Ord_master values(1,'C1','P');

create table Ord_dt1(
Ord_no int,
Prod_cd varchar(2),
Qty int
);
insert into Ord_dt1 values
(1,'P1', 100),
(1,'P2',200);

create table Prod_master(
Prod_cd varchar(2),
Prod_name varchar(10),
Qty_in_stock int,
Booked_qty int
);
insert into Prod_master values
('P1', 'Floppies',10000,1000),
('P2', 'Printers',5000,600),
('P3', 'Modems',3000,200);

delimiter $$
create trigger track_order_detail
before insert 
ON Ord_dt1
FOR EACH ROW
BEGIN
UPDATE Prod_master SET Booked_qty = Booked_qty+NEW.Qty WHERE Prod_cd = NEW.Prod_cd;
END $$

select * from Ord_master;
select * from Ord_dt1;
select * from Prod_master;

insert into Ord_dt1 values(1,'P3',300);

-- 2
delimiter $$
CREATE TRIGGER Ques2
BEFORE DELETE ON Ord_dt1
FOR EACH ROW
BEGIN
	UPDATE Prod_master SET Booked_qty=Booked_qty-OLD.qty WHERE Prod_cd=OLD.Prod_cd;
END $$

DELETE from Ord_dt1 WHERE Prod_cd = 'P3';

-- 3
/* write A trigger to update the total salary of a department in dept_sal  table  
when an employee is added or removed from  emp table .
Create table dept_sal (dept_no, tota_salary) – 
this table contains the total of salaries of employees working into that particular department
*/
CREATE table dept_sal(dept_no int, total_salary int);
select * from dept_sal;
insert into dept_sal values
(30,10950),
(10, 21000);

delimiter $$
CREATE TRIGGER Ques3 AFTER INSERT ON EMP
FOR EACH ROW 
BEGIN
UPDATE dept_sal SET total_salary = total_salary+NEW.sal where dept_no = NEW.deptno;
END $$

SELECT * from emp;
INSERT INTO emp values(1007, 'Himanshu', 'Developer', 1006, '2021-04-06', 50000, 10);

-- 4
delimiter $$
CREATE trigger Ques4 AFTER DELETE ON emp
FOR EACH ROW
BEGIN
UPDATE dept_sal SET total_salary = total_salary-OLD.sal where dept_no = OLD.deptno;
END $$

delete from emp where empno = 1007;