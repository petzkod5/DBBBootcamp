use DBBootCamp


drop table if exists UserRoles
drop table if exists Roles
drop table if exists Sales
drop table if exists Orders
drop table if exists Services_Offered
drop table if exists Taverns
drop table if exists class_levels
drop table if exists user_info
drop table if exists Statuses
drop table if exists Users
drop table if exists Locations
drop table if exists Supplies
drop table if exists Classes

--Create Classes Table to keep track of the different classes
create table Classes
(
	classID int primary key identity(1,1),
	className varchar(150)
)
create table Supplies
(
	ItemID int primary key identity(1,1),
	iWeight float,
	itemName varchar(200)
)
create table Locations
(
	LocationID int primary key identity(1,1),
	LocName varchar(150)
)

-- Removed Birthday so it can be added to user_info
create table Users
(
	UserID int primary key identity(1,1),
	RoleID int
)
create table Statuses
(
	StatusID int primary key identity(1,1),
	statusName varchar(150)
)
create table Roles
(
	ID int primary key identity(1,1),
	RoleName varchar(150)
)
create table user_info
(
	UserID int foreign key (UserID) references Users(UserID),
	userName varchar(150),
	Notes varchar(MAX),
	Birthday date,
	Cakeday date,
	StatusID int foreign key (StatusID) references Statuses(StatusID)
)
create table class_levels
(
	levelID int primary key identity(1,1),
	UserID int foreign key (UserID) references Users(UserID),
	classID int foreign key (classID) references Classes(ClassID),
	classLevel int,
	date_achieved date
)
create table Taverns
(
	TavernID int primary key identity(1,1),
	TavernName varchar(50),
	FloorsCount int,
	OwnerID int foreign key (OwnerID) references Users(UserID),
	LocationID int foreign key (LocationID) references Locations(LocationID)
)
create table Services_Offered
(
	ServiceID int primary key identity(1,1),
	TavernID int foreign key (TavernID) references Taverns(TavernID),
	serviceName varchar(150),
	StatusID int foreign key (StatusID) references Statuses(StatusID)
)
create table Orders
(
	OrderID int primary key identity(1,1),
	ItemID int foreign key (ItemID) references Supplies(ItemID),
	TavernID int foreign key (TavernID) references Taverns(TavernID),
	orderDate date,
	cost float,
	amount float
)

create table Sales
(
	SaleID int primary key identity(1,1),
	ServiceID int foreign key (ServiceID) references Services_Offered(ServiceID),
	UserID int foreign key (UserID) references Users(UserID),
	TavernID int foreign key (TavernID) references Taverns(TavernID),
	price float,
	saledate date,
	amount float
)

create table UserRoles
(
	RoleID int foreign key (RoleID) references Roles(ID),
	UserID int foreign key (UserID) references Users(UserID)
)

--removed basementrats bye ratbois
