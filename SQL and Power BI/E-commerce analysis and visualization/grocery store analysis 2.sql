-- 1. Select customer name together with each order the customer made
select CustomerName, OrderID
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID;

-- 2. Select order id together with name of employee who handled the order.
select OrderID, LastName, FirstName
from employee as e
inner join orders as o on o.EmployeeID = e.EmployeeID;

-- 3. Select customers who did not placed any order yet 
select c.CustomerID, CustomerName
from customers as c
left join orders as o on o.CustomerID = c.CustomerID
where o.CustomerID is null;

-- 4. Select order id together with the name of products.
select OrderID, ProductName
from orderdetails as od
inner join products as p on p.ProductID = od.ProductID;

-- 5. Select products that no one bought. (not sure)
select *
from products 
where ProductID not in (select ProductID from orderdetails);

-- 6. Select customer together with the products that they bought
select CustomerName, ProductName
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID
inner join orderdetails as od on od.OrderID = o.OrderID
inner join products as p on p.ProductID = od.ProductID;

-- 7. Select product names together with the name of corresponding category
select ProductName, CategoryName
from products as p 
inner join categories as c on c.CategoryID = p.CategoryID;

-- 8. Select orders together with the name of the shipping company.
select OrderID, ShipperName
from orders as o
inner join shippers as s on s.ShipperID = o.ShipperID;

-- 9. Select customers with id greater than 50 together with each order they made.
select c.CustomerID, count(OrderID) as "Each Order Made"
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID
group by CustomerID
having CustomerID > 50;

-- 10. Select employees together with orders with order id greater than 10400.
select e.EmployeeID, OrderID
from employee as e 
inner join orders as o on o.EmployeeID = e.EmployeeID
having OrderID > 10400;

-- 11. Select the most expensive product.
select ProductName, max(Price) 
from products
group by ProductName
order by max(Price) desc
limit 1;
 
-- 12. Select the second most expensive product.
select ProductName, max(Price) 
from products
group by ProductName
order by max(Price) desc
limit 1,1;

-- 13. Select name and price of each product, sort the result by price in decreasing order
select ProductName, Price
from products
order by Price desc;

-- 14. Select 5 most expensive products.
select ProductName, Price 
from products
order by Price desc, ProductName asc
limit 0,5;

-- 15. Select 5 most expensive products without the most expensive (in final 4 products).
select ProductName, Price 
from products
order by Price desc, ProductName asc
limit 1,4;

-- 16. Select name of the cheapest product (only name) without using LIMIT and OFFSET.
create view min_price as
select min(Price) as min_price
from products;

select ProductName
from products as p
inner join min_price as mp on p.Price = mp.min_price;

-- 17. Select name of the cheapest product (only name) using subquery.
select ProductName
from products
where price = (
	select min(Price)
    from products
);

-- 18. Select number of employees with LastName that starts with 'D' 
select trim(LastName) as "Last Name"
from employee
where trim(LastName) like "D%";

-- 19. Select customer name together with the number of orders made by the corresponding customer, sort the result by number of orders in decreasing order.
select CustomerName, count(OrderID)
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID
group by CustomerName
order by count(OrderID) desc;

-- 20. Add up the price of all products.
select sum(Price) as "Total Price of all products"
from products;

-- 21. Select orderID together with the total price of that Order, order the result by total price of order in increasing order 
select OrderID, sum(Price) as "Total Price"
from orderdetails as od
inner join products as p on p.ProductID = od.ProductID
group by OrderID
order by sum(Price) asc;

-- 22. Select customer who spend the most money
select CustomerName
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID
inner join orderdetails as od on od.OrderID = o.OrderID
inner join products as p on p.ProductID = od.ProductID
group by c.CustomerID
order by sum(p.Price) desc
limit 1;

-- 23. Select customer who spend the most money and lives in Canada.
select CustomerName
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID
inner join orderdetails as od on od.OrderID = o.OrderID
inner join products as p on p.ProductID = od.ProductID
where c.Country = "Canada"
group by c.CustomerID
order by sum(p.Price) desc
limit 1;

-- 24. Select customer who spend the second most money
select c.CustomerID, count(c.CustomerID), CustomerName, sum(Price * Quantity) as "Total Amount"
from customers as c
inner join orders as o on o.CustomerID = c.CustomerID
inner join orderdetails as od on od.OrderID = o.OrderID
inner join products as p on p.ProductID = od.ProductID
group by c.CustomerID
order by sum(p.Price) desc
limit 1,1;

-- 25. Select shipper together with the total price of proceed orders.
select ShipperName, sum(OrderID)
from shippers as s
inner join orders as o on o.ShipperID = s.ShipperID
group by ShipperName;



