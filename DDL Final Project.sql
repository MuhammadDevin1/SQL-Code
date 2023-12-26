
-- Anggota Kelompok
-- Alvis Jaunata Hadi			(2502091752)	
-- Muhammad Devin Ardiansyah	(2502137431)
-- Mutiah Munawar				(2501989475)
-- Thresia Avilia Ni Putu Sekar (2502001372)

create database FinalProject
create table Staff(
StaffID varchar(10) not null primary key check(StaffID like 'STF[0-9][0-9][0-9]'),
StaffName varchar(50),
StaffGender varchar(10) check(StaffGender like 'Male' or StaffGender like 'Female'),
StaffCountry char(15),
StaffPhone varchar(13),
StaffSalary numeric(11,2),
StaffEmail varchar(50)
)

select *from Staff

create table Vendor(
VendorID varchar(10) not null primary key check(VendorID like 'VEN[0-9][0-9][0-9]'),
VendorName varchar(100),
VendorGender varchar(10) check(VendorGender like 'Male' or VendorGender like 'Female'),
VendorEmail varchar(50),
VendorCountry varchar(50),
VendorPhone varchar(13)
)

select *from Vendor

Create table PurchaseTransaction(
PurchaseTransactionID varchar(15) not null primary key check (PurchaseTransactionID like 'PTH[0-9][0-9][0-9]'),
StaffID varchar(10) not null foreign key references Staff(StaffID) on update cascade,
VendorID varchar(10) not null foreign key references Vendor(VendorID) on update cascade,
KeyboardID varchar(10) not null foreign key references Keyboard(KeyboardID) on update cascade, 
PurchaseDate date,
KeyboardPurchased int,
QuantityKeyboard int
)

select *from PurchaseTransaction


create table SwitchType(
SwitchTypeID varchar (10) not null primary key check(SwitchTypeID like 'STP[0-9][0-9][0-9]'),
SwitchTypeName varchar(50),
)

select *from SwitchType

create table SalesTransaction(
SalesTransactionID varchar (10) not null primary key check(SalesTransactionID like 'STH[0-9][0-9][0-9]'),
StaffID varchar(10) NOT NULL foreign key references Staff(StaffID) on update cascade,
CustomerID varchar(10) not null foreign key references Customer(CustomerID) on update cascade,
KeyboardID varchar(10) not null foreign key references Keyboard(KeyboardID) on update cascade, 
TransactionDate date,
keyboardPurchased int,
QuantityKeyboard int
)

select *from SalesTransaction

create table Keyboard(
KeyboardID varchar(10) not null primary key CHECK(KeyboardID LIKE 'KBD[0-9][0-9][0-9]'),
KeyboardName varchar(50),
KeyboardPrice numeric (11,2) check(KeyboardPrice between 200000 and 5000000), 
SwitchTypeID varchar(10) foreign key references SwitchType(SwitchTypeID) on update cascade
)


select *from Keyboard

create table Customer(
CustomerID varchar(10) not null primary key check(CustomerID like 'CST[0-9][0-9][0-9]'),
CustomerName varchar(30),
CustomerGender varchar(10) check(CustomerGender like 'Male' or CustomerGender like 'Female'),
CustomerEmail varchar(50),
CustomerCountry varchar(50),
CustomerPhone Numeric
)

select *from Customer





							 
--


