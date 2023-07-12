-- 1. Total number of products sold so far
select count(*) as "Total number of Products"
from products;

-- 2. Total Revenue So far
select round(sum(Price*Quantity),2) as "Total Revenue"
from orderdetails as od
inner join products as p on p.ProductID = od.ProductID;

-- 3. Total Unique Products sold based on category.
select distinct ProductName, od.ProductID, CategoryName
from categories as c
inner join products as p on p.CategoryID = c.CategoryID
inner join orderdetails as od on od.ProductID = p.ProductID;

-- 4. Total Number of Purchase Transactions from customers
select count(o.OrderID) as "Total number of purchase transactions"
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID;

-- 5. Compare Orders made between 2022 – 2023
select year(OrderDate), count(OrderID)
from orders
group by (year(OrderDate));

-- 6.  What is total number of customers? Compare those that have made transaction and those that haven’t at all.
select count(CustomerID) as "Total Number of Customers"
from customers;

-- 7. Who are the Top 5 customers with the highest purchase value?
select count(o.OrderID) as "Number of Orders", c.CustomerID, c.CustomerName
from orders as o
inner join customers as c on c.CustomerID = o.CustomerID
group by c.CustomerID
limit 5;

-- 8. Top 5 best-selling products.
select ProductID, sum(Quantity)
from orderdetails
group by ProductID
order by sum(Quantity) desc
limit 5;

-- 9. What is the Transaction value per month?
select concat(month(OrderDate)) as "Month", count(o.OrderID) as "No of Orders", round(sum(Price)) as "Transaction value"
from orders as o
inner join orderdetails as od on od.OrderID = o.OrderID
inner join products as p on p.ProductID = od.ProductID
group by concat(month(OrderDate));

-- 10. Best Selling Product Category?
select c.CategoryID, CategoryName, count(OrderID) as "Number of Orders"
from categories as c
inner join products as p on p.CategoryID = c.CategoryID
inner join orderdetails as od on od.ProductID = p.ProductID
group by CategoryID;

-- 11. Buyers who have Transacted more than two times.
select CustomerID, count(OrderID)
from orders
group by CustomerID
having count(OrderID) > 2;

-- 12. Most Successful Employee.
select count(OrderID) as "Number of Orders", e.EmployeeID, FirstName, LastName
from employee as e
inner join orders as o on o.EmployeeID = e.EmployeeID
group by e.EmployeeID
order by count(OrderID) desc
limit 1;

-- 13. Most use Shipper
select count(OrderID) as "Number of Orders", s.ShipperID, ShipperName
from shippers as s
inner join orders as o on o.ShipperID = s.ShipperID
group by s.ShipperID
order by count(OrderID) desc
limit 1;

-- 14. Most use Supplier
select count(ProductID) as "Number of Products", s.SupplierID
from suppliers as s
inner join products as p on p.SupplierID = s.SupplierID
group by s.SupplierID
order by count(ProductID) desc
limit 1;


