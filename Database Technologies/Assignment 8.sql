/* 1.	Write a Procedure that displays names and salaries of all Analysts recorded in the “emp” table
by making use of a cursor.*/
use demo_test;

delimiter $$
create procedure p1()
BEGIN
	DECLARE Emp_name varchar(10);
    DECLARE Salary int;
    DECLARE finished int default 0;
    DECLARE Emp_cursor cursor FOR SELECT ename, sal from emp where job = 'Analyst';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET FINISHED = 1;
    OPEN Emp_cursor;
		getloop : LOOP
			FETCH Emp_cursor INTO Emp_name, Salary;
			IF finished = 1 THEN
			LEAVE getloop;
			END IF;
            select Emp_name, Salary;
            ITERATE getloop;
		END LOOP getloop;
	Close Emp_cursor;
END $$

call p1();

-- 2
/*Write a Procedure to display top 5 employees based on highest salary and 
display employee number, employee name and salary using Cursor.*/

delimiter $$
create procedure p2()
BEGIN
	DECLARE Employee_No int;
    DECLARE Emp_Name varchar(10);
    DECLARE salary int;
    DECLARE finished int default 0;
    DECLARE Emp_cursor cursor FOR SELECT empno, ename, sal from emp order by sal desc limit 5;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    
		OPEN Emp_cursor;
		test_loop : LOOP
			FETCH Emp_cursor INTO Employee_No, Emp_Name, salary;
				IF finished = 1 THEN
				LEAVE test_loop;
				END IF;
			SELECT Employee_No, Emp_Name, salary;
			ITERATE test_loop;
		END LOOP test_loop;
		CLOSE Emp_cursor;
END $$

call p2();
select * from emp;

-- 3
/* Write  a procedure to display the concatenated first_name and last_name from “emp” table 
using cursors handle the errors with Exit handler */

alter table Emp
ADD COLUMN e_last_name varchar(10) AFTER ename;

UPDATE Emp SET e_last_name = 'Sharma' where empno = 1000;
UPDATE Emp SET e_last_name = 'Verma' where empno = 1001;
UPDATE Emp SET e_last_name = 'Shinde' where empno = 1002;
UPDATE Emp SET e_last_name = 'Singhal' where empno = 1004;
UPDATE Emp SET e_last_name = 'Bhagat' where empno = 1005;
UPDATE Emp SET e_last_name = 'Vyas' where empno = 1006;

delimiter !!
create procedure p3()
BEGIN
	DECLARE first_name, last_name varchar(10);
    DECLARE Emp_cursor cursor FOR select ename, e_last_name from emp;
    DECLARE EXIT HANDLER FOR NOT FOUND
    select 'Program Terminated Unexpectedly';
    
Open Emp_cursor;
    
    getloop : LOOP
		FETCH Emp_cursor INTO first_name,last_name;
		select(concat(first_name, ' ',last_name)) as Full_Name;
        ITERATE getloop;
        END LOOP getloop;
        CLOSE Emp_Cursor;
END !!

call p3();

/* 4.	Write a procedure which select all the data from employee table and display the data of employee 
where employee name is ‘Manish’ using cursors.*/

delimiter $$
create procedure p4()
BEGIN
	declare employee_no int; 
    declare employee_name, last_name, employee_job varchar(10);
    declare manager int;
    declare hdate date;
    declare salary int;
    declare departmentno int;
    declare finished int default 0;
    declare emp_cursor cursor for select * from Emp where ename = 'Manish';
    declare continue handler for NOT FOUND set finished = 1;
    
 open emp_cursor;
 testloop : LOOP
	FETCH emp_cursor into employee_no, employee_name, last_name, employee_job, manager, hdate, salary, departmentno;
		IF finished = 1 THEN
		LEAVE testloop;
		END IF;
    SELECT employee_no, employee_name, last_name, employee_job, manager, manager, hdate, salary, departmentno;
    ITERATE testloop;
    END LOOP testloop;
    CLOSE emp_cursor;
END $$

call p4();

-- 5
/* 5.	Write a procedure which select delete the data from employee table if emp sal is less than 1000
using cursor and handle the Sqlexception with continue handler */
