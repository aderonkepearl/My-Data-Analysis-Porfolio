-- Q1. Create a report that shows category name and description from the categories table sorted by category name
select CategoryName, Description
from northwind.categories
order by CategoryName;

-- Q2. Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select ContactName, CompanyName, ContactTitle, Phone
from northwind.customers
order by Phone;

-- Q3. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate from the employees table sorted from the newest to the oldest employee.
select upper(FirstName) as "First Name", upper(LastName) as "Last Name", HireDate
from northwind.employees
order by HireDate desc;

-- Q4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order
select OrderID, OrderDate, ShippedDate, CustomerID, Freight
from northwind.orders
order by Freight desc
limit 10;

-- Q5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table
select lower(CustomerID) as "ID"
from northwind.customers;

-- Q6. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order
select CompanyName, Fax, Phone, Country, HomePage
from northwind.suppliers
order by Country desc, CompanyName asc;

-- Q7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
select CompanyName, ContactName
from northwind.customers
where City = 'Buenos Aires';

-- Q8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock
select ProductName, UnitPrice, QuantityPerUnit
from northwind.products
where UnitsInStock = 0;

-- Q9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
select ContactName, Address, City 
from northwind.customers
where Country not in ('Germany', 'Mexico', 'Spain');

-- Q10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
select OrderDate, ShippedDate, CustomerID, Freight
from northwind.orders
where OrderDate = '1996-05-21';

-- Q11. Create a report showing FirstName, LastName, Country from the employees not from United States.
select FirstName, LastName, Country
from northwind.employees
where Country not in ('United States'); 

-- Q12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped laterthan the required date.
select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
from northwind.orders
where ShippedDate > RequiredDate;

-- Q13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
select City, CompanyName, ContactName
from northwind.customers
where City like 'A%'or City like 'B%';

-- Q14. Create a report showing all the even numbers of OrderID from the orders table.
select OrderID
from northwind.orders
where OrderID % 2 = 0;

-- Q15. Create a report that shows all the orders where the freight cost more than $500.
select freight
from northwind.orders
where freight > 500;

-- Q16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder
select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
from northwind.products
where UnitsInStock < ReorderLevel;

-- Q17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number
select CompanyName, ContactName 
from northwind.customers
where Fax is null;

-- Q18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
select  FirstName, LastName
from northwind.employees
where ReportsTo is null;

-- Q19. Create a report showing all the odd numbers of OrderID from the orders table.
select OrderID
from northwind.orders
where OrderID % 2 != 0;

-- Q20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
select CompanyName, ContactName, Fax
from northwind.customers
where Fax is null
order by ContactName;

-- Q21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the namesorted by ContactName
select City, CompanyName, ContactName 
from northwind.customers
where City like "%L%"
order by ContactName;

-- Q22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
select FirstName, LastName, BirthDate
from northwind.employees
where BirthDate between '1950-01-01' and '1959-12-31';

-- Q23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table
select FirstName, LastName, year (Birthdate) as "Birth Year"
from northwind.employees;

-- Q24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement
select OrderID, count(OrderID) as "NumberofOrders"
from `order details`
group by OrderID
order by NumberofOrders desc;

-- Q25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids,Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
select s.SupplierID, p.ProductName, s.CompanyName
from suppliers as s
join products as p on s.SupplierID = p.SupplierID
where s.CompanyName in ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
order by SupplierID;

-- Q26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124".
select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress 
from northwind.orders
where ShipPostalCode like "98124%";

-- Q27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in theirContactTitle.
select ContactName, ContactTitle, CompanyName
from northwind.customers
where ContactTitle not like '%sales%';

-- Q28. Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle";
select LastName, FirstName, City 
from northwind.employees
where City not in ("Seattle");

-- Q29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
select CompanyName, ContactTitle, City, Country
from northwind.customers
where Country in ('Mexico', 'Spain') and city <> 'Madrid';

-- Q30. Create a select statement that outputs the following
select concat(FirstName, " ", LastName," ", "can be reached at", " x ", Extension)
from employees;

-- Q31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
select ContactName
from northwind.customers
where ContactName not like '_a%';

-- Q32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
select round(avg(UnitPrice),0) as AveragePrice, sum(UnitsInStock) as TotalStock, max(UnitsOnOrder) as MaxOrder
from northwind.products;

-- Q33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table
select s.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, p.UnitPrice
from products as p
join suppliers as s on p.SupplierID = s.SupplierID
join categories as c on c.CategoryID = p.CategoryID;

-- Q34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement
select CustomerID, sum(Freight)
from orders
group by CustomerID
having sum(Freight) > 200;

-- Q35.  Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase
select o.OrderID, c.ContactName, od.UnitPrice, od.Quantity, od.Discount
from `order details` as od
join orders as o on od.OrderID = o.OrderID
join customers as c on c.CustomerID = o.CustomerID
where od.Discount <> 0;

-- Q36.  Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin.
select a.EmployeeID, concat(a.LastName," ", a.FirstName) as "Employee", concat(b.LastName," ", b.FirstName) as "Manager"
from  employees a
inner join employees b on b.EmployeeID = a.ReportsTo 
order by a.EmployeeID;

-- Q37. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively
select avg(UnitPrice) as "Average Price", min(UnitPrice) as "Minimum Price", max(UnitPrice) as "Maximum Price"
from products;

-- Q38.  Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View.
create view customerinfo as
select  c.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate
from customers as c
join orders as o on c.CustomerID = o.CustomerID;

-- Q39. Change the name of the view you created from customerinfo to customer details.
rename table customerinfo
to customerdetails;

-- Q40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables. HINT: Create a View
create view productdetails as 
select p.ProductID, s.CompanyName, p.ProductName, c.CategoryName, c.Description, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
from products as p
inner join suppliers as s on s.SupplierID = p.SupplierID
inner join categories as c on c.CategoryID = p.CategoryID;

-- Q41. Drop the customer details view 
drop view customerdetails;

-- Q42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
select substring(CategoryName,1,5) as "Short Info"
from categories;

-- Q43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create a Table, use the LIKE Statement and INSERT INTO statement
create table shippers_duplicate like shippers;
insert into shippers_duplicate
select *
from shippers;

-- Q44. Create a select statement that outputs the following from the shippers_duplicate Table:
alter table shippers_duplicate
add Email varchar (30);

update shippers_duplicate
set Email = 'speedyexpress@gmail.com'
where ShipperID = 1;

update shippers_duplicate
set Email = 'unitedpackage@gmail.com'
where ShipperID = 2;

update shippers_duplicate
set Email = 'federalshipping@gmail.com'
where ShipperID = 3;

select *
from shippers_duplicate;

-- Q45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category
select s.CompanyName, p.ProductName
from products as p
join categories as c on c.CategoryID = p.CategoryID
join suppliers as s on s.SupplierID = p.SupplierID
where c.CategoryName = 'Seafood';

-- Q46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
select p.CategoryID, s.CompanyName, p.ProductName
from products as p
inner join suppliers as s on s.SupplierID = p.SupplierID
where CategoryID = '5'; 

-- Q47. Delete the shippers_duplicate table.
drop table shippers_duplicate;

-- Q48. Create a select statement that ouputs the following from the employees table.
select LastName, FirstName, Title, 2023- year(BirthDate) as "Age"
from employees; 

-- Q49.  Create a report that the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.
select CompanyName, count(OrderID) as "Number of Orders"
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID
where OrderDate >= "1994-12-31"
group by CompanyName having count(OrderID)>10;

-- Q50. Create a select statement that ouputs the following from the product table
select concat(ProductName, " ", "weighs/is", " ", QuantityPerUnit, " ", "and", " ", "cost", " ", "$",UnitPrice) as "Product Category"
from products;
