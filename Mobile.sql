create database MobileStore
go
use MobileStore
go

create table Employee(
employeeCode varchar(5) primary key,
userName varchar(25),
[password] varchar(20),
employeeName varchar(50),
phoneNumber varchar(12),
[Address] varchar(50),
salary int,
dateOfJoin date,
[role] int
)

select * from Employee where userName = 'admin' and [password] = 'admin'

select [password] from Employee where employeeCode = 12345

update Employee set [password] = 'admin' where employeeCode = 12345
delete Employee where userName = ''

select * from Employee

create table Supplier(
supID int identity primary key,
supName varchar(50),
[Address] varchar(20),
phoneNumber varchar(12),
typeOfMobile varchar(50)
)

select * from Supplier
select * from Customer

create table Customer(
CustomerID int identity primary key,
CustomerName varchar(50),
PhoneNumber varchar(12),
CustomerAddress varchar(100),
CustomerCompanyAddress varchar(100)
)

create table Items(
mobiID int identity primary key,
mobiName varchar(50),
supID int foreign key references Supplier(supID),
color varchar(20),
screenSize float,
price varchar(20),
guarantee int,
stock int
)

create table Purchase(
	purchaseID int identity primary key,
	customerID int foreign key references Customer(CustomerID),
	employeeCode varchar(5) foreign key references Employee(EmployeeCode),
	buydate date,
	totalPrice int
)

create table PurchaseDetail(
	purchaseID int foreign key references Purchase(purchaseID),
	mobiID int foreign key references Items(mobiID),
	quantity int,
	saleOff int,
	unitPrice int,
	guarantee int
)
drop table PurchaseDetail
INSERT INTO Employee([employeeCode],[userName],[password],[employeeName],[phoneNumber],[Address],[salary],[dateOfJoin],[role]) VALUES('94501','Lillith','LVS97BHV9CB','Aline S. Buckley','09245923814','725-4477 Diam Road',459,'05/26/16',1),('89271','Patience','HGX17GFA4AA','Melyssa Dalton','09624842841','Ap #364-5806 Ut Rd.',110,'08/03/15',0),('81625','Priscilla','XKG42OYQ5DP','Cameron Davidson','09643586245','Ap #149-4927 Vitae, Road',240,'05/15/13',0),('64487','Aspen','VCG78TLQ1OO','Willa Travis','09642857242','Ap #453-1100 Et, Ave',112,'10/05/14',1),('63343','Jonas','CCK04DKF8RP','Kieran B. Donaldson','09394481489','6937 Velit. Av.',315,'04/13/13',1),('24478','Ivory','CFF05IBV7FH','Brady Morgan','09423266526','P.O. Box 919, 1826 Aliquet St.',241,'11/25/11',0),('14702','Thomas','NPP54XUV0NL','Kadeem Parsons','09692937964','154-1480 Scelerisque Road',452,'06/18/13',1),('38794','Sebastian','VTB77CTE7JN','Armand Oneill','09458924242','323-2720 Magna Rd.',287,'02/07/11',0),('22037','Fatima','BKL30FWV4RT','Kenneth E. Holman','09521554837','1830 Sed St.',338,'11/29/11',0),('36285','Yoko','YVB39XIY1HA','Jennifer Haynes','09781752555','5130 Adipiscing Av.',127,'10/07/12',0);

INSERT INTO Employee VALUES('12345','admin','admin','Aline S. Buckley','09245923814','725-4477 Diam Road',459,'05/26/16',1)
select * from Employee

Insert into Supplier values('Samsung', 'Korea', '0123456789', 'Android')
Insert into Supplier values('Appple', 'USA', '0123456780', 'IOS')
Insert into Supplier values('HTC', 'USA', '0123456780', 'Android')

insert into Items values ('Samsung Galaxy S7', 1, 'Black', 123, '123', 1, 100)
insert into Items values ('Apple IPhone 7', 2, 'Black', 123, '123', 1, 100)
insert into Items values ('HTC Phone', 3, 'Black', 123, '123', 1, 100)

INSERT INTO Customer VALUES('Kendall','09971281126','P.O. Box 678, 8189 Vestibulum Ave','4081 Egestas. St.'),('Erica','09415464424','P.O. Box 176, 4981 Risus St.','Ap #920-6719 Non Av.'),('Hannah','09857293796','P.O. Box 256, 1082 Mi Road','P.O. Box 281, 5183 Tempor Rd.'),('Oren','09216494838','Ap #693-7351 Vulputate St.','9931 Vel Av.'),('Brynn','09148226619','7274 Nonummy Rd.','789-2018 Vel Rd.'),('Harlan','09262959715','P.O. Box 745, 5432 Lectus Road','4083 Dui. Rd.'),('Kasper','09946465277','P.O. Box 609, 3762 Sed Ave','8764 Et, Avenue'),('Jordan','09839736275','412-9276 Eros St.','P.O. Box 731, 1538 Sed Av.'),('Hedy','09243435392','P.O. Box 941, 8409 Vivamus Avenue','P.O. Box 595, 9332 Quam Av.'),('Stella','09645898125','P.O. Box 975, 5747 Dui Street','P.O. Box 239, 7236 Lorem St.');

insert into Purchase values(1, '12345', '7/6/2017', 123) 
insert into PurchaseDetail values(1,1, 1, 0, 123, 1) 
insert into PurchaseDetail values(1,2, 1, 0, 123, 1) 
insert into PurchaseDetail values(1,3,3,0,123,1)

create procedure signIn(
	@username varchar(25)
)as
begin
select * from Employee where username = @username
end

drop procedure signIn

create procedure getAllItems
as
begin
SELECT       mobiID, Items.mobiName, Supplier.supName, Items.color, Items.screenSize, Items.price, Items.guarantee, stock
FROM            Items INNER JOIN
                         Supplier ON Items.supID = Supplier.supID
end

drop procedure getAllItems

create procedure searchItems(
	@itemName varchar(30)
)
as
begin
SELECT        Items.mobiName, Supplier.supName, Items.color, Items.screenSize, Items.price, Items.guarantee
FROM            Items INNER JOIN
                         Supplier ON Items.supID = Supplier.supID
						 where Items.mobiName like '%' + @itemName + '%'
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

create procedure getPurchaseList 
as 
begin 
SELECT        purchaseID,Customer.CustomerName, Employee.employeeName, Purchase.buydate, Purchase.totalPrice 
FROM            Customer INNER JOIN 
                         Purchase ON Customer.CustomerID = Purchase.customerID INNER JOIN 
                         Employee ON Purchase.employeeCode = Employee.employeeCode 
end 
 
create procedure searchPurchaseList( 
    @customerName varchar(50) 
) 
as 
begin 
SELECT        purchaseID,Customer.CustomerName, Employee.employeeName, Purchase.buydate, Purchase.totalPrice 
FROM            Customer INNER JOIN 
                         Purchase ON Customer.CustomerID = Purchase.customerID INNER JOIN 
                         Employee ON Purchase.employeeCode = Employee.employeeCode 
                         where CustomerName like '%' + @customerName + '%' 
end 
 
exec searchPurchaseList 'e' 
 
drop procedure getPurchaseDetail 
 
create procedure getPurchaseDetail( 
    @id int 
)as 
begin 
SELECT        purchaseID,Customer.CustomerName, Employee.employeeName, Purchase.buydate, Purchase.totalPrice 
FROM            Customer INNER JOIN 
                         Purchase ON Customer.CustomerID = Purchase.customerID INNER JOIN 
                         Employee ON Purchase.employeeCode = Employee.employeeCode 
                         where purchaseID = @id 
end 

create procedure getPurchaseDetailItemList( 
    @id int 
)as 
begin 
 
SELECT        Items.mobiName, PurchaseDetail.quantity, PurchaseDetail.unitPrice 
FROM            Items INNER JOIN 
                         PurchaseDetail ON Items.mobiID = PurchaseDetail.mobiID 
                         where purchaseID = @id 
end 
