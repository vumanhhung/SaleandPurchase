create database MobileStore
go
use MobileStore
go

create table Account(
	Username varchar(25),
	[Password] varchar(20)
)

create table Employee(
employeeID varchar(5) primary key,
employeeName varchar(50),
phoneNumber varchar(20),
[Address] varchar(50),
salary int,
dateOfJoin date,
)

create table Items(
mobiID varchar(10) primary key,
mobiName varchar(50),
supID varchar(10) foreign key references Supplier(supID),
color varchar(20),
size float,
price varchar(20),
guarantee int,
stock int
)

create table Supplier(
supID varchar(10) primary key,
supName varchar(50),
[Address] varchar(20),
phoneNumber float,
typeOfMobile varchar(50)
)

create table Customer(
CustomerID varchar(10) primary key,
CustomerName varchar(50),
PhoneNumber varchar(20),
CustomerAddress varchar(100),
CustomerCompanyAddress varchar(100)
)

create table Sales(
saleID varchar(10) primary key,
CustomerID varchar(10) foreign key references Customer(CustomerID),
employeeID varchar(5) foreign key references Employee(EmployeeID),
mobiID varchar(10) foreign key references Items(mobiID),
quantity int,
saleOff int,
Buydate date,
GuaranteeDate date,
buyQuantity int 
)

insert into Account values ('admin','admin')

create procedure signIn(
	@username varchar(25)
)as
begin
select * from Account where username = @username
end