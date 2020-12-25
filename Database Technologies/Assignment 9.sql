use demo_test;

CREATE TABLE tutorial (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, 
title VARCHAR(200), 
description TEXT, 
FULLTEXT(title,description)
);

INSERT INTO tutorial (title,description) VALUES
('SQL Joins','An SQL JOIN clause combines rows from two or more tables. It creates a set of rows in a temporary table.'),
('SQL Equi Join','SQL EQUI JOIN performs a JOIN against equality or matching column(s) values of the associated tables. An equal sign (=) is used as comparison operator in the where clause to refer equality.'),
('SQL Left Join','The SQL LEFT JOIN, joins two tables and fetches rows based on a condition, which is matching in both the tables and the unmatched rows will also be available from the table before the JOIN clause.'),
('SQL Cross Join','The SQL CROSS JOIN produces a result set which is the number of rows in the first table multiplied by the number of rows in the second table, if no WHERE clause is used along with CROSS JOIN.'),
('SQL Full Outer Join','In SQL the FULL OUTER JOIN combines the results of both left and right outer joins and returns all (matched or unmatched) rows from the tables on both sides of the join clause.'),
('SQL Self Join','A self join is a join in which a table is joined with itself (which is also called Unary relationships), especially when the table has a FOREIGN KEY which references its own PRIMARY KEY.');

select * from tutorial;
select * from emp;

/* 1.	Find all the employee name starting with ‘ma’ */
select ename from emp where ename REGEXP '^ma';

/* 2.	Find all the employee name ending with ‘sh’ */
select ename from emp where ename regexp 'sh$';

/* 3.	Write query to find all employee job containing characters ’an’ or ‘ah’.*/
select ename from emp where ename regexp 'an|ch';

/* 4.	Write a query to find all names containing characters {s,d}.*/
select ename from emp where ename REGEXP '[sd]';
select ename from emp where e_last_name REGEXP '[sd]';
select e_last_name from emp where e_last_name REGEXP '[bl]';
select e_last_name from emp where ename REGEXP '[sd]';
select ename, e_last_name from emp where ename REGEXP '[sd]';

/* 6.	Write a query to find ‘Left right’ in description field. */
select description from tutorial where match (title, description) against ('Left right' in NATURAL LANGUAGE MODE);

/* 7.	Write a query to find the count of ‘Left right’ string matches in description field. */
select count(description) from tutorial where MATCH(title, description) against('Left right' in NATURAL LANGUAGE MODE);

/*8.	Write a query that retrieves all the rows that contain the word 'Joins' but not 'right'. */
select * from tutorial where match(title, description) against('+Joins -right' in BOOLEAN MODE);