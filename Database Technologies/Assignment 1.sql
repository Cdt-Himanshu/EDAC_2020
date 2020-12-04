use demo_text;
create table Member (
Member_Id int(5) unique,
Member_Name varchar(30),
Member_address varchar(50),
Acc_Open_Date date,
Membership_type varchar(20),
Penalty_Amount int(7)
);
show tables;
select * from member;
create table Books (
Book_No int(6),
Book_Name varchar(30),
Author_Name varchar(30),
Cost int(7),
Category char(10)
);
show tables;
drop table edac;
show tables;
create table Issue(
Lib_Issue_ID int(10),
Book_No int(6),
Member_ID int(5),
Issue_Date date,
Return_Date date
);
select * from issue;
select * from books;
alter table member
modify column Acc_Open_Date date;
select * from member;
insert into member values(2, 'Heena Kapgate', 'Pune', curDate() ,'Annual');
drop table member;
delete from member where member_id = 3;
alter table member
drop column Penalty_Amount;
insert into member values (3, 'Gaurav Shinde', 'Mumbai','2020/12/04','Annual');
insert into member values (4, 'Jaiesh', 'Mumbai','2020/12/04','Lifetime');
insert into member values (5, 'Himanshu', 'Bhopal','2020/12/05','Lifetime');
insert into member values (6, 'Ekta', 'Nagpur','2020/12/03','Annual');
insert into member values (7, 'Hitesh', 'Pune','2020/12/02','Lifetime');
delete from member where Member_ID = 2;
insert into Books values(101, 'Let us C', 'Dennis Richie', 450, "System");
insert into Books values(102, 'Oracle Complete Ref', 'Loni', 550, "Database");
insert into Books values(103, 'Mastering SQL', 'Loni', 250, "Database");
insert into Books values(104, 'PL SQL-Ref', 'ScottUrman', 750, "Database");
update Books
set Cost = 300 
where Book_No = 103;
drop table Issue;
SELECT Lib_Issue_ID, Book_No, Member_ID, DATE_FORMAT(Issue_Date, '%d-%b-%Y') as Issue_Date from Issue;
select Member_Id, Member_Name, Member_address, Date_Format(Acc_Open_Date, '%d-%b-%Y') as Acc_Open_Date, Membership_type from member;
delete from Issue where Book_No = 102;
insert into Issue (Lib_Issue_ID,Book_No,Member_ID,Issue_Date) values (7001, 101, 1, '2006-12-10'),(7002, 102, 2 ,'2006-12-25');
insert into Issue (Lib_Issue_ID,Book_No,Member_ID,Issue_Date) values (7003, 104, 1, '2006-01-15'),(7004, 101, 1 ,'2006-07-04');
insert into Issue (Lib_Issue_ID,Book_No,Member_ID,Issue_Date) values (7005, 104, 2, '2006-11-15'),(7006, 101, 3 ,'2006-02-18');
