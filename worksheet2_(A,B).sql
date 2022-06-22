-- A
use HallemCollege;

--all the students whose name starts with C

Select * from Students$
where FirstName like 'c%'


-- students whose name starts with c and is at least 3 characters long

select * from Students$
where FirstName like 'c__%'

-- students from class A whose surname is in the second half of the alphabet

select * from Students$
where class like 'A' AND LastName Between 'N' AND 'Z'

--number of students who doesn't have an 'a' in their full name

select COUNT(Student_ID) from Students$
where FirstName like '^a' and LastName like '^a'

-- students who have double vowels in their name
select * from Students$
where FirstName like '%[aeiou]%[aeiou]%' AND LastName like '%[aeiou]%[aeiou]%'

-- Teachers who teach History, English or Music
select * from Subjects$
where Subject_Name IN ('History', 'Music', 'English')
 
 -- Teachers who don't teach the subjects listed above

 select * from Subjects$
where Subject_Name NOT IN ('History', 'Music', 'English')

-- Number of students in each class
select count(Student_ID), Class AS '# Students' from Students$
group by Class

-- Difference between the hioghest and lowest grade in each subject

select (max(Mark) - min (Mark)), Subject_Name from Tests$
group by Subject_Name

-- Subjects that had and average score score above 50

select AVG(Mark), Subject_Name from Tests$
group by Subject_Name
having AVG(Mark) > 50

-- B

use Constumers;

-- Costumers that name doesn't end in 't'

select * from Customers$
where CustomerName not like '%t'

-- suppliers whose name contains 'or'

select * from Suppliers$
where SupplierName like '%or%'

-- customers who live in a city containing 'es'

select CustomerID, CustomerName, City
from Customers$
where City like '%es%'

-- customers who live in a city not starting with 'b', 's' or 'p'

select CustomerID, CustomerName, City
from Customers$
where City not like 'b%' AND City not like 's%' AND City not like 'p%'

-- customers based in Germany, France or UK

select CustomerID, CustomerName, Country
from Customers$
where Country In ('Germany', 'France', 'UK')

-- supplier that supplies the most products

select ProductID from Order_Details$
where [Quantity] = (select max(Quantity) from Order_Details$)

select SupplierID from Products$
where ProductID = 55

select * from Suppliers$
where SupplierID = 25

-- products that are in category 1,2,3 and between 10 and 50

select * from Products$
where CategoryID in (1, 2, 3) AND Price BETWEEN 10 AND 50

-- products that are in category 1,2,3 and outside the range (10,50)

select * from Products$
where CategoryID in (1, 2, 3) AND Price NOT BETWEEN 10 AND 50

-- number of costumers in each country

select count(1) AS '#Costumers' , Country
from Customers$
group by Country

-- Countries with more that 5 Costumers

select COUNT(1) AS [#Costumers], Country
from Customers$
group by Country
having COUNT(1) > 5

-- C

select * from Special_Dietary$

select * from Students$

-- 2.table with Students_ID for students having special dietary requirements

select Student_ID
from Students$
INNER JOIN Special_Dietary$ ON Students$.FirstName = Special_Dietary$.FirstName
where Special_Dietary = 'Y'

-- 3.class with the most dietary requirements

select count(Students$.Student_ID) as 'Studentd_id', Students$.Class
from Students$
INNER JOIN Special_Dietary$ ON Students$.FirstName = Special_Dietary$.FirstName
where Special_Dietary = 'Y' 
group by Students$.Class

-- 4.average age of someone who has dietary problems and someone who has not

select AVG(Students$.Age) AS 'Average_age'
from Students$
INNER JOIN Special_Dietary$ ON Students$.FirstName = Special_Dietary$.FirstName
where Special_Dietary = 'Y'

select AVG(Students$.Age) AS 'Average_age'
from Students$
INNER JOIN Special_Dietary$ ON Students$.FirstName = Special_Dietary$.FirstName
where Special_Dietary = 'N'

-- 5.Teachers assigned to a class

select * from Teachers$
where Teacher_Class IS NULL

select * from Students$
select * from Teachers$

-- 6. Students who have a guardian working as a teacher

select Students$.FirstName, Students$.LastName, Teachers$.FirstName as 'Teacher_FirstName'
, Teachers$.LastName as ' Teacher_LastName', Students$.Guardian_Email
from Students$
Inner join Teachers$ on Students$.Guardian_Email = Teachers$.Teacher_Email

-- 7. Does the students from 6. have dietary requirements?


select Students$.FirstName, Students$.LastName, Teachers$.FirstName as 'Teacher_FirstName'
, Teachers$.LastName as ' Teacher_LastName', Students$.Guardian_Email, Special_Dietary$.Special_Dietary
from Students$
Inner join Teachers$ on Students$.Guardian_Email = Teachers$.Teacher_Email
Inner join Special_Dietary$ on Special_Dietary$.LastName = Students$.LastName

--select Special_Dietary
--from Special_Dietary$
--where FirstName = 'Paige'

-- 8. list with subjects each class does not take
-- Do all students take all subjects? If no, provide a list which subjects each class does not take

select * from Subjects$
select * from Students$

select Subject_Name, Subject_Class
from Subjects$
order by Subject_Name

select Subject_Name, Subject_Class
from Subjects$
left join 
full outer join Stude


-- 9. number of students each teacher have

select * from Students$
select * from Teachers$

select count(Students$Students_ID), Teachers$.FirstName as 'Teacher FirstName' , Teachers$LastName as 'Teacher LastName'
from Students$
group by Class


-- D
use Constumers;
-- 1.all the orders with shipper information

select Shippers$.ShipperID, Shippers$.ShipperName, Shippers$.Phone, Orders$.OrderID
from Shippers$
right join Orders$ on Orders$.ShipperID = Shippers$.ShipperID

-- 2.shippers(suppliers) and customers that belong to the same city

select * from Orders$
select * from Customers$
select * from Suppliers$
select * from Shippers$
select * from Order_Details$

select Customers$.CustomerName as 'Customer' , Suppliers$.SupplierName as 'Supplier', Customers$.City
from Customers$, Suppliers$
where Customers$.City = Suppliers$.City

-- 3. all records from the Customers table + all matches in the Orders table

select * from Orders$
right join Customers$ on Orders$.CustomerID = Customers$.CustomerID 

-- 4.number of customers in each country

select count(1) AS '#Costumers' , Country
from Customers$
group by Country

-- 6. 
select Customers$.ContactName, Customers$.City,
count(Orders$.OrderID) as 'Order amount' , Orders$.OrderDate
from Orders$
full outer join Customers$ on Orders$.CustomerID = Customers$.CustomerID
group by Orders$.OrderDate, Customers$.ContactName, Customers$.City

-- 7. combine the rows from shippers table with the rows from customers table

select *
from Shippers$
cross join Customers$

-- 8. 


select * from Products$