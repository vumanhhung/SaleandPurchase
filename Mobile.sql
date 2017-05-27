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
select * from Employee
INSERT INTO Employee([employeeID],[employeeName],[phoneNumber],[Address],[salary],[dateOfJoin]) VALUES(1,'Gemma','09586939491','886 Sed Rd.',121,'03/27/2014'),(2,'Piper','09577341772','P.O. Box 267, 9147 Vestibulum Road',577,'01/08/2012'),(3,'Lane','09949967522','570-6290 Maecenas St.',626,'08/06/2013'),(4,'Finn','09454984726','Ap #469-3575 Scelerisque Rd.',546,'04/27/2012'),(5,'Martin','09255537114','Ap #354-7918 Condimentum. Rd.',490,'03/02/2014'),(6,'Zoe','09357262789','2925 Et, St.',669,'12/24/2012'),(7,'Hector','09538968871','Ap #228-6743 Montes, Rd.',479,'03/21/2013'),(8,'Leandra','09958352459','P.O. Box 281, 9313 In St.',594,'05/15/2012'),(9,'Price','09241326333','4555 In Rd.',259,'02/09/2015'),(10,'Zane','09362712424','230 Tempus, Avenue',857,'10/18/2012');

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

create procedure getAllItems
as
begin
SELECT        Items.mobiName, Supplier.supName, Items.color, Items.size, Items.price, Items.guarantee
FROM            Items INNER JOIN
                         Supplier ON Items.supID = Supplier.supID
end

create procedure searchItems(
	@itemName varchar(30)
)
as
begin
SELECT        Items.mobiName, Supplier.supName, Items.color, Items.size, Items.price, Items.guarantee
FROM            Items INNER JOIN
                         Supplier ON Items.supID = Supplier.supID
						 where Items.mobiName like '%' + @itemName + '%'
end

exec searchItems 's'

exec getAllItems

insert into Items values (1, 'Samsung Galaxy S7', 1, 'Black', 123, '123', 1, 100)
insert into Items values (2, 'Apple IPhone 7', 2, 'Black', 123, '123', 1, 100)
insert into Items values (3, 'HTC Phone', 3, 'Black', 123, '123', 1, 100)

select * from Items
select * from Employee

create table Supplier(
supID varchar(10) primary key,
supName varchar(50),
[Address] varchar(20),
phoneNumber float,
typeOfMobile varchar(50)
)

Insert into Supplier values(1, 'Samsung', 'Korea', '0123456789', 'Landline')
Insert into Supplier values(2, 'Appple', 'USA', '0123456780', 'Mobile')
Insert into Supplier values(3, 'HTC', 'USA', '0123456780', 'Mobile')

select * from Supplier

create table Customer(
CustomerID varchar(10) primary key,
CustomerName varchar(50),
PhoneNumber varchar(20),
CustomerAddress varchar(100),
CustomerCompanyAddress varchar(100)
)
select * from Customer

select * from Customer where CustomerName like '%k%'
delete Customer
INSERT INTO Customer([CustomerID],[CustomerName],[PhoneNumber],[CustomerAddress],[CustomerCompanyAddress]) VALUES(1,'Kendall','09971281126','P.O. Box 678, 8189 Vestibulum Ave','4081 Egestas. St.'),(2,'Erica','09415464424','P.O. Box 176, 4981 Risus St.','Ap #920-6719 Non Av.'),(3,'Hannah','09857293796','P.O. Box 256, 1082 Mi Road','P.O. Box 281, 5183 Tempor Rd.'),(4,'Oren','09216494838','Ap #693-7351 Vulputate St.','9931 Vel Av.'),(5,'Brynn','09148226619','7274 Nonummy Rd.','789-2018 Vel Rd.'),(6,'Harlan','09262959715','P.O. Box 745, 5432 Lectus Road','4083 Dui. Rd.'),(7,'Kasper','09946465277','P.O. Box 609, 3762 Sed Ave','8764 Et, Avenue'),(8,'Jordan','09839736275','412-9276 Eros St.','P.O. Box 731, 1538 Sed Av.'),(9,'Hedy','09243435392','P.O. Box 941, 8409 Vivamus Avenue','P.O. Box 595, 9332 Quam Av.'),(10,'Stella','09645898125','P.O. Box 975, 5747 Dui Street','P.O. Box 239, 7236 Lorem St.');

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

create procedure searchCustomer(
	@username varchar(25)
)as
begin
select * from Customer where CustomerName like '%' + @username + '%'
end

create procedure searchEmployee(
	@username varchar(25)
)as
begin
select * from Employee where employeeName like '%' + @username + '%'
end

create procedure searchSupplier(
	@suppliername varchar(25)
)as
begin
select * from Supplier where supName like '%' + @suppliername + '%'
end

select * from Employee
exec searchEmployee 'g'
exec searchSupplier 's'

exec searchCustomer 'k'