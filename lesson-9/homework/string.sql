--Homework lesson9
--##  Easy-Level Tasks 

--#1
Select e.EmployeeID, e.Name, e.Salary,e.HireDate,e.ManagerID, d.DepartmentName from Employees e inner join Departments d
on e.DepartmentID=d.DepartmentID
where e.Salary>5000 order by e.salary 
--#2
--Write a query to join Customers and Orders using an INNER JOIN, and apply the 
WHERE clause to return only orders placed in 2023.
--Select * from Customers 
--Select * from Orders
--Select * from Customers c inner join Orders o on c.CustomerID=o.CustomerID
where year (o.orderdate)=2023
Select c.CustomerID,c.FirstName,c.LastName,o.OrderID,o.OrderDate from Customers c inner join Orders o on c.CustomerID=o.CustomerID
where year (o.orderdate)=2023
--#3
select e.EmployeeID,e.Name,e.DepartmentID,e.Salary,e.HireDate,e.ManagerID,d.DepartmentName from Employees e
left join Departments d on e.DepartmentID=d.DepartmentID
--#4
Select distinct * from Suppliers s 
right join Products p on p.SupplierID=s.SupplierID
--#5
Select distinct * from Orders o 
full join Payments p
on o.OrderID=p.OrderID
--#6
select * from Employees e left join Employees m on e.ManagerID= m.EmployeeID
select e.employeeID, e.name as EmployeeName,m.Name as ManagerName, m.DepartmentID 
from Employees e left join Employees m on e.ManagerID= m.EmployeeID
--#7
Select distinct s.StudentID,s.Name,c.CourseID,c.CourseName from Students s 
inner join Enrollments e on s.StudentID=e.StudentID
inner join Courses c on c.CourseID=e.CourseID where CourseName='math 101'

Select distinct * from Students s 
inner join Enrollments e on s.StudentID=e.StudentID
inner join Courses c on c.CourseID=e.CourseID where CourseName='math 101'
--#8
Select c.CustomerID,c.firstName,c.lastName,c.city,c.country,o.orderID,o.orderDate,o.Quantity from
Customers c inner join Orders o on c.CustomerID=o.CustomerID where o.Quantity>3
--Select * from Customers c inner join Orders o on c.CustomerID=o.CustomerID
--#9
Select  d.DepartmentID,d.DepartmentName, e.Name, e.EmployeeID,e.Salary,e.HireDate 
from Departments d left join Employees e on d.DepartmentID=e.DepartmentID where d.DepartmentName='Human Resources'
--Select  *  from Departments d left join Employees e on d.DepartmentID=e.DepartmentID where d.DepartmentName='Human Resources'

--Medium-Level Tasks 
--#10
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount --,sum (e.salary) as Salarytotal
FROM Employees e
INNER JOIN Departments  d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 10 --and sum(e.salary)>500000
--#11
select p.ProductName,p.Price,s.ProductID from Products p left join Sales s on s.ProductID=p.ProductID
where s.ProductID is null
--#12
Select * from Orders o right join Customers c on o.CustomerID=c.CustomerID
Select c.CustomerID , c.FirstName,c.LastName,count (o.Quantity) as Orderquantity from Orders o right join Customers c 
on o.CustomerID=c.CustomerID
group by c.CustomerID , c.FirstName,c.LastName having count (o.Quantity)>=1
--#13
Select * from Employees e full join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentID is null
--#14
--Write a query to perform a SELF JOIN on the Employees table to show employees who report to the same manager.
Select * from Employees
SELECT E1.EmployeeID AS EmployeeID1, E1.Name AS EmployeeName1,
       E2.EmployeeID AS EmployeeID2, E2.Name AS EmployeeName2,
       E1.ManagerID
FROM Employees E1
INNER JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
WHERE E1.EmployeeID != E2.EmployeeID;
--#15
--Write a query to perform a LEFT OUTER JOIN between Orders and Customers, 
followed by a WHERE clause to filter orders placed in the year 2022.
Select o.CustomerID,o.OrderDate,c.FirstName,c.LastName from Orders o left join Customers c on o.CustomerID=c.CustomerID
where year (o.OrderDate)=2022
--#16
--Write a query to use the ON clause with INNER JOIN to return only the employees
from the 'Sales' department whose salary is greater than 5000.
Select * from Departments d inner join Employees e on d.DepartmentID=e.DepartmentID
where d.DepartmentName='Sales' and e.Salary>5000
Select * from Employees
--#17
--Write a query to join Employees and Departments using INNER JOIN, 
and use WHERE to filter employees whose department''s DepartmentName is 'IT'.
Select * from Departments d inner join Employees e on d.DepartmentID=e.DepartmentID
where d.DepartmentName='IT'
--#18
--Write a query to join Orders and Payments using a FULL OUTER JOIN, 
and use the WHERE clause to show only the orders that have corresponding payments.
select * from Payments p full join Orders o on p.OrderID=o.OrderID
where p.PaymentMethod is not null
--#19
--Write a query to perform a LEFT OUTER JOIN between Products and Orders, 
and use the WHERE clause to show products that have no orders.
Select * from Products p left join Orders o on p.ProductID=o.ProductID where o.ProductID is null
--Hard-Level Tasks 
--#20
--Write a query using a JOIN between Employees and Departments, 
followed by a WHERE clause to show employees whose salary is higher than the average salary of all employees.
Select * from Employees e join Departments d on e.DepartmentID=d.DepartmentID
where e.Salary > (select avg (Salary) from Employees) order by Salary
--#21 
Write a query to perform a LEFT OUTER JOIN between Orders and Payments, 
and use the WHERE clause to return all orders placed before 2020 that have not been paid yet.
SELECT * FROM Orders o left join Payments p on o.OrderID=p.OrderID
where year (OrderDate)<2020 and p.PaymentID is null

--#22
--Write a query to perform a FULL OUTER JOIN between Products and Categories, 
and use the WHERE clause to filter only products that have no category assigned.
Select * from Products p full join Categories c on p.Category=c.CategoryID
where c.CategoryID is null
--#23
--Write a query to perform a SELF JOIN on the Employees table to find employees
who report to the same manager and earn more than 5000.
--Select * from Employees
SELECT E1.EmployeeID, E1.Name, E1.Salary, E2.EmployeeID AS ManagerID, E2.Name AS ManagerName
FROM Employees E1
INNER JOIN Employees E2 ON E1.ManagerID = E2.EmployeeID
WHERE E1.Salary > 5000 order by Salary
--#24
--Write a query to join Employees and Departments using a RIGHT OUTER JOIN, 
and use the WHERE clause to show employees from departments where the department name starts with ‘M’.
Select e.Name,d.DepartmentName from Employees e right join Departments d on e.DepartmentID=d.DepartmentID
where d.DepartmentName like 'M%'
--#25
--Write a query to join Products and Sales, and use WHERE to filter only sales greater than 1000.
Select * from Products p join Sales s on p.ProductID=s.ProductID
where s.SaleAmount>1000
--#26
--Write a query to perform a LEFT OUTER JOIN between Students and Courses, and use the WHERE 
clause to show only students who have not enrolled in 'Math 101'.(USE ENROLLMENTS TABLE AS A BRIDGE TABLE)
Select distinct s.StudentID,s.Name,c.CourseID,c.CourseName from Students s 
inner join Enrollments e on s.StudentID=e.StudentID
inner join Courses c on c.CourseID=e.CourseID where CourseName!='math 101'
--#27
--Write a query using a FULL OUTER JOIN between Orders and Payments, 
followed by a WHERE clause to filter out the orders with no payment.
Select * from Payments p full join Orders o on p.OrderID=p.OrderID
where p.PaymentID is  null;
--#28
Write a query to join Products and Categories using an INNER JOIN, 
and use the WHERE clause to filter products that belong to either 'Electronics' or 'Furniture'.
Select * from Products p join Categories c on p.Category=c.CategoryID
where c.CategoryName in ('Electronics' ,'Furniture')
--or
Select * from Products p join Categories c on p.Category=c.CategoryID
where c.CategoryName ='Electronics' or c.CategoryName='Furniture'
