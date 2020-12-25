use demo_test;
create table Publishers(
pubID int(3) primary key,
pname varchar(30),
email varchar(50) unique,
phone varchar(30)
);
desc Publishers;

create table Subjects(
subID varchar(5)primary key,
sName varchar(30)
);
desc Subjects;

create table Authors(
audID int(5) primary key,
aName varchar(30),
email varchar(50) unique,
phone varchar(30)
);
desc Authors;

create table Titles(
titleID int(5) primary key,
title varchar(30),
pubID int(3),
subID varchar(5),
pubDate date,
cover char(1) check(cover in('P', 'H', 'h', 'p')),
price numeric(4),
Constraint fk_Titles foreign key(pubID) references Publishers(pubID),
constraint fk_Subjects foreign key(subID) references Subjects(subID)
);
desc Titles;
create table TitleAuthors(
titleID int(5),
audID int(5),
importance numeric(2),
#primary key(titleID,audID)
constraint fk_Titles1 foreign key(titleID) references Titles(titleID),
constraint fk_Authors1 foreign key(audID) references Authors(audID)
);
desc TitleAuthors;
drop table TitleAuthors;

create table Subjects_Backup as select * from Subjects;
desc Subjects_Backup;
alter table Subjects_Backup add primary key(subID);
insert into Subjects values
('ORA', 'ORACLE DATABASE 10g'),
('JAVA', 'JAVA LANGUAGE'),
('JEE', 'JAVA ENTERPRISE EDITION'),
('VB', 'VISUAL BASIC.NET'),
('ASP','ASP.NET');
select * from Subjects;
insert into Publishers values
(1,'WILLEY','WDT@VSNL.NET','91-11-23260877'),
(2,'WROX','INFO@WROX.COM',null),
(3,'TATA MCGRAW-HILL','FEEDBACK@TATAMCGRAWHILL.COM','91-11-33333322'),
(4,'ECHMEDIA','BOOKS@TECHMEDIA.COM','91-11-33333322');
select * from Publishers;
insert into Authors values
(101,'HERBERT SCHILD',"HERBERT@YAHOO.COM",null),
(102,'JAMES GOODWILL','GOODWILL@HOTMAIL.COM',null),
(103,'DAVAID HUNTER',"HUNTER@HOTMAIL.COM",null),
(104,'STEPHEN WALTHER','WALTHER@GMAIL.COM',null),
(105,'KEVIN LONEY','LONEY@ORACLE.COM',null),
(106,'ED.ROMANS','ROMANS@THESERVERSIDE.COM',null);
select * from Authors;

insert into Titles values(1001,'ASP.NET UNLEASHED',4,'ASP','2002-04-12','P',540),
(1002,'ORACLE10G COMP. REF.',3,'ORA','2005-05-01','P',575),
(1003,'MASTERING EJB',1,'JEE','2005-02-03','P',475),
(1004,'JAVA COMP. REF',3,'JAVA','2005-04-03','P',499),
(1005,'PRO. VB.NET',2,'VB','2005-06-15','P',450);
select * from Titles;
select * from TitleAuthors;
insert into TitleAuthors values
(1001,104,1),
(1002,105,1),
(1003,106,1),
(1004,101,1),
(1005,103,1),
(1005,102,2);
select * from Authors
order by aname;
select * from Publishers
order by pname desc;

select sName from Subjects where sName like 'Oracle%';
select sName from Subjects where sName like 'j%';
select sName from Subjects where sName like '%.net';
select aName from Authors where aName like '%er';
select pName from Publishers where pName like '%hill%';

select title from Titles where price<500;
#select title from Titles where pubDate < '2005-04-03';
select sName from Subjects where subID = 'Java' or subID ='jee';
select aName from Authors where audID > 103;
select * from Titles where price > 500 or titleID = 1001;

select title from Titles where month(pubDate) = 04;
select title from Titles where extract(month from pubDate) = 04;

select extract(year from sysdate()) as year;
select year(sysdate()) as year;
select month(sysdate()) as month;

select last_day(pubDate) from Titles where subID = 'java';
select last_day(pubDate) from Titles where subID = 'ORA';

create table Employee1(emp_id int ,emp_name char(50));

insert into employee1 values(102 , "Monika"); 
insert into employee1 values(103 , "Shital");
insert into employee1 values(104 , "pallavi"); 
insert into employee1 values(105 , "amit"); 
insert into employee1 values(106, "Rashmi"); 

alter table Employee1 add column dept_id varchar(3);  

alter table employee1 modify column emp_name varchar(12);

update employee1 set emp_name = "Scott" where emp_id=106;

truncate table employee1;

create table emp(SAL float(7,3));
insert into emp values(1234.567);
insert into emp values(1530.019);
insert into emp values(1652.786);
insert into emp values(1775.156);
desc emp;
select * from emp;
 /***********************************************************/
-- Perform :
select round(1234.567);
select round(1775.156,2);
select truncate(234.34*100 , 1);
select ceil(8.1);
select floor(1775.156);
select sign(-1775.156);
select mod(23,2);
select sqrt(4);
select power(2,2);
 /***********************************************************/

-- 1. perform all string function on string "CDAC juhu".

select char_length("CDAC juhu");
select concat("CDAC","JUHU");
select concat('CDA','C','  ',"juhu");
select concat_ws(" - ", 'CDAC','juhu');
select find_in_set('a' , "f,g,k,a,b");
select find_in_set('ju',"cdac,ju,juhu");
select lower("CDAC JUHU");
select repeat("CDAC-" , 3);
select replace("CDAC juhu",'u','kh');
select substring("CADC mumbai",4);
select substring("CDAC mumbai", 6 , 3);
select length("cdac");

 /***********************************************************/
-- 2. perform different date and time functions. 
select sysdate();
select current_date();
select current_date()+1;
SELECT CURDATE()+0;
select CURRENT_TIME();
select current_time()+0;
select monthname("1998-08-16");
select dayname("2020-12-18");
select dayofweek("1998-08-16");
SELECT LAST_DAY('1998-08-16');
select makedate(2021,130);
SELECT HOUR('11:05:03');
select now();
SELECT DATE_ADD('1998-07-16', INTERVAL 31 DAY);