--A
create database HallemCollege;
 use HallemCollege;

 create table Students(
 Student_id int primary key not null identity(1,1), 
 FirstName varchar(max) not null,
 LastName varchar(max) not null,
 Age int not null,
 Class varchar(max),
 GuardianEmail varchar(max)
 );

 insert into Students([FirstName],[LastName],[Age],[Class],[GuardianEmail]) values
 ('John', 'Turner', 3, 'A', 'P.turner@gmail.com'),
 ('Robert', 'Harrison', 5, 'B', 'ZHarrison@gmail.com'),
 ('Paul', 'Ben', 3, 'A', 'A.Ben@gmail.com'),
 ('William', 'Carson', 6, 'B', 'B.Carson@gmail.com'),
 ('Geordie', 'Xiaver',7, 'B', 'TXavier@gmail.com'),
 ('Harry', 'Fisher', 7, 'C', 'C.Fisher@gmail.com'),
 ('Peter', 'Kenneth', 9, 'D', 'C.Kenneth@gmail.com'),
 ('Adrian', 'Smith', 4, 'A', 'A.Smith@gmail.com'),
 ('Lois', 'Xiaver', 8, 'C', 'TXavier@gmail.com'),
 ('Carl', 'Evans', 3, 'B', 'B.Evans@gmail.com'),
 ('Donald', 'Brown', 10, 'D', 'C.Brown@gmail.com'),
 ('Carman', 'Robbin', 5, 'B', 'B.Robbin@gmail.com'),
 ('Paige', 'Tom', 9, 'C', 'Jtom@Hallamcolleger.com'),
 ('Clinton', 'Bailey', 12, 'E', 'D.Bailey@gmail.com');
 
 --select * from Students

 create table Subjects(
 Subject_id int primary key not null,
 SubjectName varchar(max) not null,
 SubjectClass varchar(max) not null,
 SubjectTeacher varchar(max) not null,
 );

 --Set IDENTITY_INSERT Subjects ON
 insert into Subjects([Subject_id], [SubjectName], [SubjectClass], [SubjectTeacher]) values
 (101, 'Maths', 'A', 'Jill'),
 (201, 'English', 'A', 'Amin'),
 (301, 'History', 'B', 'Cooper'),
 (401, 'Music', 'A', 'Thomas'),
 (501, 'Science', 'C', 'Sarah'),
 (102, 'Maths', 'B', 'Jill'),
 (202, 'English', 'B', 'Amin'),
 (302, 'History', 'C', 'Taylor'),
 (402, 'Music', 'B', 'Thomas'),
 (502, 'Science', 'D', 'Sarah'),
 (103, 'Maths', 'C', 'White'),
 (203, 'English', 'C', 'Amin'),
 (104, 'Maths', 'D', 'Amin'),
 (303, 'English', 'D', 'Taylor');

 --select * from Subjects
 --Set identity_insert Subjects OFF

 create table Class(
 Class_id int primary key not null,
 ClassName varchar(max),
 ClassTeacher varchar(max),
 );

 insert into Class([Class_id], [ClassName], [ClassTeacher]) values
(001, 'A', 'Jill'),
(002, 'B', 'Amin'),
(003, 'C', 'Sarah'),
(004, 'D', 'Taylor');

--select * from Class

create table Teachers(
FirstName varchar(max) not null,
LastName varchar(max) not null,
TeacherClass varchar(max) not null,
TeacherEmail varchar(max),
);

insert into Teachers([FirstName], [LastName], [TeacherClass], [TeacherEmail]) values
('Jill', 'Tom', 'A', 'Jtom@Hallemcollege.com'),
('Amin', 'Kabir', 'B', 'AKabir@Hallemcollege.com'),
('Cooper', 'Hill', 'E', 'Chill@Hallemcollege.com'),
('Thomas', 'Allen', '', 'Tallen@Hallemcollege.com'),
('Sarah', 'Young', 'C', 'Syoung@Hallemecollege.com'),
('Taylor', 'Lewis', 'D', 'Tlewis@Hallemcollege.com'),
('White', 'Cook', '', 'Wcook@Hallemecollege.com');

--List of Teachers name and subject
select Subject_id, SubjectTeacher
from Subjects

--Teachers who teach maths
select SubjectTeacher
from Subjects 
where SubjectName = 'Maths'

--Students that are older than 5
select FirstName, LastName 
from Students
where Age > 5

--Students that are older than 5 and in class B
select *
from Students
where Age >= 6 AND Class = 'B'

--Teacher who teach English or History
select SubjectTeacher, SubjectName
from Subjects
where SubjectName = 'English' OR SubjectName = 'History'

--Teacher who doesn't have any classes
select FirstName, LastName
from Teachers
where TeacherClass = ''

--ordering the students alphabetically by their surname
select *
from Students
order by LastName

--B

create database Constumers;
use Constumers

 -- cities that the customers are based it
 select City from Customers$

 -- number of cities
 select count(Country) from Customers$

 --Customers based in Europe
 select *
 from Customers$
 where NOT Country = 'Mexico' AND NOT Country = 'USA' AND NOT Country = 'Venezuela' 
 AND NOT Country = 'Argentina' AND NOT Country = 'Canada' AND NOT Country = 'Brazil'

 --Customers based outside London
 select CustomerName, Address
 from Customers$
 where NOT City = 'London'

 --Customers names sorted by the country and then by their name
 select CustomerName from Customers$
 order by Country, CustomerName
 
 --select Count(1) as ' Any Nulls'
 --from Customers$
 --where PostalCode > 1

 -- C

 --oldest student
 select * 
 from Students
 where [Age] = (select max([Age]) from Students) 
 
 --youngest students
 select *
 from Students
 where [Age] = (select min([Age]) from Students)

 --number of students in each class

 select count(1) 
 from Students
 where Class = 'A'

  select count(1) 
 from Students
 where Class = 'B'

  select count(1) 
 from Students
 where Class = 'C'

  select count(1) 
 from Students
 where Class = 'D'

   select count(1) 
 from Students
 where Class = 'E'

 --average age

 select AVG(Age) from Students

 --highest total score across all subjects (A05: 307)

 select sum(Mark)
 from Tests$
 where Student_ID = 'A01'

  select sum(Mark)
 from Tests$
 where Student_ID = 'A02'

  select sum(Mark)
 from Tests$
 where Student_ID = 'A03'

  select sum(Mark)
 from Tests$
 where Student_ID = 'A04'

  select sum(Mark)
 from Tests$
 where Student_ID = 'A05'

   select sum(Mark)
 from Tests$
 where Student_ID = 'A06'

   select sum(Mark)
 from Tests$
 where Student_ID = 'A07'

   select sum(Mark)
 from Tests$
 where Student_ID = 'A08'

   select sum(Mark)
 from Tests$
 where Student_ID = 'A09'

   select sum(Mark)
 from Tests$
 where Student_ID = 'A10'

   select sum(Mark)
 from Tests$
 where Student_ID = 'A11'

   select sum(Mark)
 from Tests$
 where Student_ID = 'A12'

   select sum(Mark)
 from Tests$
 where Student_ID = 'A13'

 -- list of students in a class within the right range

 
 select Age, FirstName, LastName
 from Students
 where Class = 'A'

  select Age, FirstName, LastName
 from Students
 where Class = 'D'

  select Age, FirstName, LastName 
 from Students
 where Class = 'E'

 -- list of students in a different class group
select Age, FirstName, LastName
 from Students
 where Class = 'B' And Not Age = 5 and Not Age = 6

 select Age, FirstName, LastName
 from Students
 where Class = 'C' And Not Age = 7 and Not Age = 8

 CREATE VIEW Student AS
 SELECT FirstName, LastName,
 CASE
      WHEN Age = 3 AND Age = 4 AND CLASS = 'A' THEN 'Student is in class A'
	  ELSE 'Student have been moved up one year'
END AS AgeText
FROM Students$

select * from [Student]

select concat(FirstName, LastName, Student_ID) from Students$

--create view ID Cards as
--select (FirstName + LastName + Student_ID),
--from Students$

-- D

-- the most expensive product
select * 
 from Products$
 where [Price] = (select max([Price]) from Products$) 

 -- the least expensive product
 select * 
 from Products$
 where [Price] = (select min([Price]) from Products$) 

 -- number of distinct products

 select count(distinct ProductID) from Products$

 -- average price

 select avg(Price) from Products$

 -- total products sold

 select sum(Quantity) from Order_Details$

 -- create a view to classify the orders
 create view Order_size as
 select OrderID, Quantity,
 Case 
      when Quantity < 10 then 'Quantity is small'
	  when Quantity between 10 and 20 then 'Quantity is medium'
	  when Quantity > 20 then 'Quantity is large'
	  else 'Quantity is larger than 20'
End as QuantityText
from Order_Details$

select * from Order_size

-- average order size fro small, medium and large
select avg(Quantity)
from Order_size
where Quantity < 10

select avg(Quantity)
from Order_size
where Quantity between 10 and 20

select avg(Quantity)
from Order_size
where Quantity > 20

select * from Employees$

-- number of employees older than 65
select count(1)
from Employees$
where  datediff(YY, BirthDate, getdate()) > 65

-- supplier that ships the most expensive product

select SupplierID
from Products$
where [Price] = (select max([Price]) from Products$) 

select SupplierName
from Suppliers$
where SupplierID = 18

--supplier that ships the most products

select * from Order_Details$
select * from Products$

select ProductID
from Order_Details$
order by ProductID


-- number of products that cost between 10 and 50
select count(1)
from Products$
where Price > 10 AND Price < 50