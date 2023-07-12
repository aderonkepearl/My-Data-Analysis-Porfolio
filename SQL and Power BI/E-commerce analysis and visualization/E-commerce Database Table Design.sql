-- Create grocerystore Database
create database if not exists grocerystore;

-- Use grocerystore database
use grocerystore;

-- Create a employee table
create table employee (
	EmployeeID int not null,
    LastName varchar (255) default null,
    FirstName varchar (255) default null,
    BirthDate date default null,
    Photo varchar (200) default null,
    Notes text not null
);

-- Create orders table
create table orders (
	OrderID int(11) not null,
    CustomerID int(11) default null,
    EmployeeID int(11) default null,
    OrderDate DATE default null,
    ShipperID int(11) default null
);

-- Create customers table
create table customers (
	CustomerID int(11) not null,
    CustomerName varchar (255) default null,
    ContactName varchar (255) default null,
    Address varchar (255) default null,
    City varchar (255) default null,
    PostalCode varchar (255) default null,
    Country varchar (255) default null
);

-- Create orderdetails table
create table orderdetails (
	OrderDetailID int(11) not null,
    OrderID int(11) default null,
    ProductID int(11) default null,
    Quantity int(11) default null
);

-- Create products table
create table products (
	ProductID int(11) not null,
    ProductName varchar (255) default null,
    SupplierID int(11) default null,
    CategoryID int(11) default null, 
    Unit varchar (255) default null,
    Price double default null
);

-- Create categories table
create table categories (
	CategoryID int(11) not null,
    CategoryName varchar(255) default null,
    Description varchar (255) default null
);

-- Create suppliers table
create table suppliers (
	SupplierID int (11) not null,
    SupplierName varchar (255) default null,
    ContactName varchar (255) default null,
    Address varchar (255) default null,
    City varchar (255) default null,
    PostalCode varchar (255) default null,
    Country varchar (255) default null,
    Phone varchar (255) default null
);

-- Create shippers table
create table shippers (
	ShipperID int(11) not null,
    ShipperName varchar(255) default null,
    Phone varchar (255) default null
);
    
-- Step 2: Load data into tables
-- Imported data using load data wizard

insert into products (ProductID,ProductName,SupplierID,CategoryID,Unit,Price)
values (77,'Original Frankfurter grüne Soße',12, 2,'12 boxes',13);

insert into orderdetails (OrderDetailID,OrderID,ProductID,Quantity)
values (518,10443,28,12);


-- Step 3: Add constraint to all tables
-- Add a primary key to employee table
alter table employee
add primary key (EmployeeID);

-- Add a primary key to categories table
alter table categories
add primary key (CategoryID);

-- Add a primary key to customers table
alter table customers
add primary key (CustomerID);

-- Add a primary key to orderdetailstable
alter table orderdetails
add primary key (OrderDetailID);

-- Add a primary key to orders table
alter table orders
add primary key (OrderID);

-- Add a primary key to products table
alter table products
add primary key (ProductID);

-- Add a primary key to shippers table
alter table shippers
add primary key (ShipperID);

-- Describe to know informations about your table
describe shippers;

-- Add a primary key to suppliers table
alter table suppliers
add primary key (SupplierID);

-- Adding foreign keys
alter table products
add constraint foreign key (SupplierID) references suppliers (SupplierID),
add constraint foreign key (CategoryID) references categories (CategoryID);

describe products;

alter table orders
add key CustomerID (CustomerID),
add key EmployeeID (EmployeeID),
add key ShipperID (ShipperID);


alter table orders
add constraint `orders_ibfk_1` foreign key (CustomerID) references customers (CustomerID),
add constraint `orders_ibfk_2` foreign key (EmployeeID) references employee (EmployeeID),
add constraint `orders_ibfk_3` foreign key (ShipperID) references shippers (ShipperID);

describe orders;

alter table orderdetails
add key OrderID (OrderID),
add key ProductID (ProductID);

alter table orderdetails
add constraint `orderdetails_ibfk_1` foreign key (OrderID) references orders(OrderID),
add constraint `orderdetails_ibfk_2` foreign key (ProductID) references products(ProductID);

describe orderdetails;

select *
from Orderdetails;











    