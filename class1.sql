use college;
CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);
INSERT INTO student values(101, "Aman", 23);
INSERT INTO student values(102, "Raj", 24);

SELECT * FROM student;

SHOW databases;
SHOW tables;

CREATE TABLE student2 (
rollno INT PRIMARY KEY,
name VARCHAR(50)
);
SELECT * FROM student2;
  INSERT INTO student2(rollno, name)
  VALUES 
  (29, "Bishal"),
  (19, "Pritam");
 INSERT INTO student2 values(45, "Aman");
 
 CREATE DATABASE XYZ;
 USE XYZ;
 
 CREATE TABLE employee (
  id INT PRIMARY KEY,
 name VARCHAR(50),
 salary INT NOT NULL);
 
 INSERT INTO employee(id, name, salary)
 VALUES
 (123, "Adam", 25000),
 (146, "Bob", 30000),
 (167, "Casey", 40000);
 
 SELECT * FROM employee;
 
 CREATE TABLE temp1 (
 id INT UNIQUE);
 
 INSERT INTO temp1 values(101);
 INSERT INTO temp1 values(101); /* error occurs as id has been given UNIQUE constraint */
 
 CREATE TABLE temp2(
 id INT,
 name VARCHAR(50),
 age INT,
 city VARCHAR(50),
 PRIMARY KEY(id, name) /*another syntax of making a column primary key or multiple columns*/
 );
 
 CREATE TABLE emp(
 id INT ,
 salary INT DEFAULT 25000 
 );
 INSERT INTO emp(id) values (102);
 SELECT * FROM emp; /*as default constraint is used , salary automatically becomes 25000 when we don't enter any value for it*/
 
 CREATE TABLE city (
 id INT PRIMARY KEY,
 city VARCHAR(50),
 age INT,
 CONSTRAINT age_check CHECK(age>=18 AND city = "Delhi"));
 
 INSERT into city VALUES (405, "Kolkata", 17); /*error occurs as check constraint is used here*/
 INSERT into city VALUES (306, "Delhi", 21);
  SELECT * FROM city;
 DROP TABLE  city; 
 
 CREATE DATABASE learning;
 USE learning;
 
 CREATE TABLE vidyarthi (
 rollno INT PRIMARY KEY,
 name VARCHAR(50),
 marks INT  NOT NULL,
 grade VARCHAR(1),
 city VARCHAR(20) );
 
 INSERT INTO vidyarthi (rollno, name, marks, grade, city) 
 VALUES 
 (101, "anil", 78, "C", "Pune"),
 (102, "bhumika", 93, "A", "Mumbai"),
 (103, "chetan", 85, "B", "Mumbai"),
 (104, "dhruv", 96, "A", "Delhi"),
 (105, "emanual", 12, "F", "Delhi"),
 (106, "farhah", 82, "B", "Delhi");
 
 SELECT * FROM vidyarthi;
 SELECT city FROM vidyarthi;
 SELECT DISTINCT city FROM vidyarthi; /* DISTINCT is used to fetch unique values i.e repeated cities will not be displayed*/
 
 /* WHERE clause */
 
 SELECT * FROM vidyarthi WHERE marks>= 80;
 SELECT * FROM vidyarthi WHERE city = "Mumbai";
 
/*conditions can be combined as well */
SELECT * FROM vidyarthi WHERE marks>= 75 AND city = "Delhi";

/* BETWEEN OPERATOR , (lower and upper limit are inclusive)*/
SELECT * FROM vidyarthi WHERE marks BETWEEN 80 AND 90 ;

/* IN OPERATOR (matches any value in the list)*/
SELECT * FROM vidyarthi WHERE city IN("Mumbai", "Delhi");

/* NOT IN OPERATOR (To negate the given condition)*/
SELECT * FROM vidyarthi WHERE city NOT IN ("Delhi", "Mumbai");

/*LIMIT clause ( sets an upper limit on number of rows to be returned)*/
SELECT * FROM vidyarthi 
LIMIT  3;
/*can be used with a condition*/
SELECT * FROM vidyarthi WHERE marks > 75
LIMIT 3;

/* ORDER BY (To arrange in ascending order or descending order) */
SELECT * FROM vidyarthi ORDER BY city ASC;

SELECT * FROM vidyarthi
ORDER BY marks DESC
LIMIT 3;

/* Aggregate Functions ( perform a calculation on a set of values, and return a single value) */
SELECT MAX(marks) 
FROM vidyarthi;

SELECT MIN(marks) 
FROM vidyarthi;

SELECT COUNT(rollno)
FROM vidyarthi;

SELECT AVG(marks)
FROM vidyarthi;

/*GROUP BY clause : Groups rows that have the same values into summary rows.
It collects data from multiple records and groups the result by one or more column
It is generally used with Aggregate functions */

SELECT city, count(rollno)
FROM  vidyarthi
GROUP BY city ;
 /* je column gulo select er shathe lekha hoyeche without aggregate function,
 atleast shei kota column GROUP BY clause er shatheo dite hobe */
 
 SELECT city , AVG(marks)
 FROM vidyarthi
 GROUP BY city;
 
 /* Ques : Write the query to find avg marks in each city in ascending order */
 SELECT city , AVG(marks)
 FROM vidyarthi
 GROUP BY city  
/* ORDER BY AVG(marks) asc ; */
ORDER BY city;
 
/*Prac ques*/
CREATE TABLE payment (
 cust_id INT PRIMARY KEY,
 customer VARCHAR(30),
 mode VARCHAR(20) NOT NULL,
 city VARCHAR(15) NOT NULL );
 
 INSERT INTO payment (cust_id, customer, mode, city)
 VALUES
 (101, "Olivia BArrett", "Net banking", "Portland"),
 (102, "Ethan Sinclair", "Credit card", "Miami"),
 (103, "Maya Hernandez", "Credit card", "Seattle"),
 (104, "Liam Donovar", "Net banking", "Denver"),
 (105, "Sophia Nyugen", "Credit card", "New Orleans"),
 (106, "Caleb Foster", "Debit card", "Mineapolis"),
 (107, "Ava Patel", "Debit card", "Phoenix"),
 (108, "Lucas Carterr", "Net banking", "Boston"),
 (109, "Isabella Martinez", "Net banking", "Nashville"),
 (110, "Jackson Brooks", "Credit card", "Boston");
 
 /* DROP TABLE payment; */
 
 SELECT mode, count(customer)
 FROM payment
 GROUP BY mode ;
 
 SELECT grade, count(rollno)
 FROM vidyarthi
 GROUP BY grade
 ORDER BY grade ASC; /*if nothing is written, by default ascending ei order by hoye*/

/* HAVING - same as WHERE i.e used for giving a condition but specifically for GROUP BY*/

SELECT city , count(rollno)
FROM vidyarthi
GROUP BY city 
HAVING max(marks>90)
ORDER BY city;

/*General Order
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY */

/*e.g*/
SELECT city, name, marks
FROM vidyarthi
WHERE grade = "A"
GROUP BY city , name, marks
HAVING MAX(marks)>=93
ORDER BY city DESC;

/*UPDATE- to update existing rows, safe mode has to be turned off which is on by default to prevent unnecesaary updates to table*/
SET SQL_SAFE_UPDATES = 0;

/*e.g : 1*/
UPDATE vidyarthi
SET grade = "A"
WHERE grade = "O";

SELECT * FROM vidyarthi;

/*e.g : 2*/
UPDATE vidyarthi
SET marks = 88
WHERE rollno = 105;

/*e.g : 3*/
UPDATE  vidyarthi
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

/*e.g : 4* --> UPDATING MARKS OF ALL STUDENTS */
UPDATE vidyarthi
SET marks = marks + 1;

/*DELETE - to delete existing rows */
UPDATE vidyarthi
SET marks = 15
WHERE rollno = 105;

/*e.g - 1 */
DELETE FROM vidyarthi
WHERE  marks < 33;

/*FK AND PK in details*/
USE learning;
CREATE TABLE department(
 id INT PRIMARY KEY,
 name VARCHAR(50));
 
 CREATE TABLE teacher (
 id INT PRIMARY KEY,
 name VARCHAR(50),
 dept_id INT,
 FOREIGN KEY (dept_id) REFERENCES department(id)
 ON DELETE CASCADE
 ON UPDATE CASCADE ); /* CASCADE dewa thakle parent table e kichu change hole sheta child table o hoye jabe nije theke */
 
 /* Here department is PARENT TABLE and teacher is CHILD TABLE
 PARENT TABLE er theke PK CHILD TABLE e giye FK hoye jaye */
 
 /*e.g of CASCADE */
 INSERT INTO department
 VALUES
 (101, "Arts"),
 (102, "IT");
 
 SELECT * FROM department;
 
 INSERT INTO teacher
 VALUES
 (01, "Adam", 101),
 (02, "Eve", 102);
 
 SELECT * FROM teacher;
 
 UPDATE department
 SET id = 103 
 WHERE id = 102 ;
 /* now if we view TABLE teacher, the id of Eve automatically becomes 103 even though we did not update it */
 
 /*ALTER commands (to change the schema) */
 ALTER TABLE vidyarthi
 ADD COLUMN age INT DEFAULT 19;
 SELECT * FROM vidyarthi;  /*(new column named age will be added)*/
 
 ALTER TABLE vidyarthi
 DROP COLUMN age; /*(desired column will be added)*/
 
 ALTER TABLE vidyarthii
 RENAME TO VidyarthI; /*(table name will be changed)*/ /*table name is NOT case sensitive */
 
 ALTER TABLE vidyarthi
 CHANGE age stu_age INT ; /*(name of any column can be changed)*/
 
 ALTER TABLE vidyarthi
 MODIFY stu_age LONG; /*(column constraints can be modified. for e.g its data type)*/
 
/*TRUNCATE --> It deletes the data of the table whereas DROP deletes the entire table, so if we use truncate, 
the table still exists and new values can be inserted easily */

/*Prac ques*/
/*ques a*/ ALTER TABLE vidyarthi
CHANGE name stu_name VARCHAR(40);
SELECT * FROM vidyarthi; 

/*ques b : Delete all students who scored marks less than 80*/
DELETE FROM vidyarthi
WHERE marks<80;

/*ques b : Delete the column for grades*/
ALTER TABLE vidyarthi
DROP COLUMN grade;

/*JOINS :-*/
CREATE DATABASE learning2;
USE learning2;
CREATE TABLE baccha(
id INT PRIMARY KEY,
name VARCHAR(30));

INSERT INTO baccha (id, name)
VALUES 
(01, "Adam"),
(02, "Bob"),
(03, "Casey");

CREATE TABLE topics (
Tid INT PRIMARY KEY,
Tname VARCHAR(20));

INSERT INTO topics (Tid, Tname)
VALUES
(02, "English"),
(05, "Maths"),
(03, "Science"),
(07, "Computer Science");

SELECT * FROM baccha;
SELECT * FROM topics;

/*TRUNCATE topics; */
TRUNCATE baccha;

/*INNER JOIN */
SELECT * FROM baccha AS b
INNER JOIN topics AS t
ON b.id = t.Tid;

/* 1) the common column need not have same name.
   2) AS keyword is used to give alias to table that short forms can be used in the query going forward */
   
   /*LEFT JOIN*/
   SELECT * FROM baccha AS b
   LEFT JOIN topics AS t
   ON b.id = t.Tid;
   
  /* 1) The table whose complete data we need , should be written first (baccha)
     2) The table which is written after left join i.e 2nd (topics) only the intersected data from that tble is displayed */
     
     /*RIGHT JOIN*/
     SELECT * FROM baccha AS b
     RIGHT JOIN topics AS t
     ON b.id = t.Tid ;
     
     /* 1) The table whose complete data we need , should be written 2nd OR to the right of RIGHT JOIN keyword 
     (here :baccha)
    2) The table which is written before RIGHT join i.e 1st (topics) only the intersected data from that
      table is displayed */
      
      /*FULL JOIN OR FULL OUTER JOIN(MySQL does not have any command for FULL JOIN, Oracle or PostgreSQL does)*/
      SELECT * FROM baccha AS b 
      LEFT JOIN topics AS t
      ON b.id = t.Tid
      UNION
	  SELECT * FROM baccha AS b
      RIGHT JOIN topics AS t
      ON b.id = t.Tid ;
      
      /*LEFT EXCLUSIVE JOIN */
      SELECT * FROM baccha as b 
      LEFT JOIN topics AS t
      ON b.id = t.Tid
      WHERE t.Tid IS NULL;
      /* Exclusive left join means only "baccha" circle data, not the interssected part,
      t.Tid is NULL for the non intersected part of "baccha" circle and NOT null for the intersected part */
      
      /*RIGHT EXCLUSIVE JOIN */
      SELECT * FROM baccha AS b
      RIGHT JOIN topics AS t
      ON b.id = t.Tid
      WHERE b.id IS NULL;
      /* Exclusive right join means only "topics" circle data, not the interssected part */
      
      /*SELF JOIN* - a) jokhon same table ei kichu join korate hoye to get a clear info, b) we write only join */
      
      CREATE TABLE chakor(
      id INT PRIMARY KEY,
      name VARCHAR(50),
      manager_id INT );
      
      INSERT INTO chakor(id,name,manager_id)
      VALUES
      (101, "Ross", 103),
      (102, "Chandler", 104),
      (103, "Rachel", null),
      (104, "Joey", 103);
      
      SELECT * FROM chakor;
      
      SELECT a.name as manager_name, b.name
	  FROM chakor AS a
      JOIN chakor AS b
      ON a.id = b.manager_id;
      
      /*UNION : Combines result set of 2 or more SELECT statements to give UNIQUE records*/
      /*UNION ALL : works same as UNION but provides duplicate values as well*/
      /*e.g : 1 */
      SELECT name FROM baccha
      UNION
      SELECT Tname FROM topics;
      
      /*e.g : 2 */
      SELECT name FROM chakor
      UNION
      SELECT name FROM chakor;
      
      /* SQL subquery/Inner query/Nested query (Involves 2 SELECT statements)
      There are 3 ways of writing sub queries --> a)inside SELECT b)inside FROM c)inside WHERE */
      
      CREATE TABLE result (
      rollno INT PRIMARY KEY,
      s_name VARCHAR(30),
      score INT NOT NULL );
      
      INSERT INTO result (rollno, s_name, score)
      VALUES 
      (101, "Penny", 78),
      (102, "Raj", 93),
	  (103, "Howard", 85),
	  (104, "Sheldon", 96),
	  (105, "Bernadette", 92),
	  (106, "Amy", 82);
      
      /*e.g 1 : Get all the names of the students who scored more than the class average*/
      SELECT AVG(score)
      FROM result;
      
      SELECT s_name, score
      FROM result 
      WHERE score>87.6667; 
      /* but hardcoding is not a good practise as no.of students in class can change or anyone's marks can be 
      entered wrong by human error so we use SUBQUERY (written inside WHERE) */
      
      SELECT s_name, score 
      FROM result
      WHERE score>(SELECT AVG(score)FROM result);
      
      /*e.g 2 : Get all the names of the students with even roll numbers*/
       SELECT s_name, rollno
       FROM result
       WHERE rollno % 2 = 0;
       
       /* by using subquery(written inside WHERE)*/
       SELECT s_name , rollno
       FROM result 
       WHERE rollno IN(SELECT rollno FROM result WHERE rollno % 2 = 0);
       
     /*e.g 3 : Subquery written inside FROM 
       Find the max marks from the students of Delhi*/  
       ALTER TABLE result
       ADD column city VARCHAR(20) NOT NULL;
       
       SELECT * FROM result;
       UPDATE result 
       SET city = "Mumbai" WHERE rollno = 102;
       UPDATE result 
       SET city = "Mumbai" WHERE rollno = 103;
       UPDATE result 
       SET city = "Delhi" WHERE rollno = 104;
       UPDATE result 
       SET city = "Delhi" WHERE rollno = 105;
       UPDATE result 
       SET city = "Delhi" WHERE rollno = 106;
       
       SELECT max(score)
       FROM (SELECT * FROM result WHERE city = "Delhi") AS launda ;
       /* when using subquery with FROM, an alias is a must */
       
       /* another way of doing it where no subquery is required*/
       
       SELECT max(score), s_name
       FROM result
       WHERE city = "Delhi";
       
       /* MySQL views (A virtual table with only required info from the whole table,
       works exactly like a table i.e all operations can be run on it. Its like a temporary table, 
       it does not affect the original table data)*/
       
       CREATE view res1 AS
       SELECT rollno, s_name, score
       FROM result;
       
       SELECT * FROM res1;
       
       SELECT * FROM res1
       WHERE score > 90;
       
       DROP view res1;
       
      