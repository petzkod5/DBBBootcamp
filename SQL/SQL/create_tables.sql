use DBBootCamp

drop table if exists BasementRats
drop table if exists Taverns
drop table if exists UserRoles
drop table if exists Users
drop table if exists Locations
drop table if exists Supplies
drop table if exists Sales
drop table if exists Orders
drop table if exists Services_Offered
drop table if exists Statuses
drop table if exists Roles

create table Locations
(
	LocationID int primary key identity(1,1),
	LocName varchar(150)
)



create table Users
(
	UserID int primary key identity(1,1),
	UserName varchar(100),
	RoleID int
)


create table Taverns
(
	TavernID int primary key identity(1,1),
	TavernName varchar(50),
	FloorsCount int,
	OwnerID int foreign key (OwnerID) references Users(UserID),
	LocationID int foreign key (LocationID) references Locations(LocationID)
)


create table Roles
(
	ID int primary key identity(1,1),
	RoleName varchar(150)
)


create table UserRoles
(
	RoleID int foreign key (RoleID) references Roles(ID),
	UserID int foreign key (UserID) references Users(UserID)
)


create table BasementRats
(
	ID int primary key identity(1,1),
	RatName varchar(150),
	TavernID int foreign key (TavernID) references Taverns(TavernID)
)


create table Supplies
(
	ItemID int primary key identity(1,1),
	iWeight float,
	itemName varchar(200)
)


create table Orders
(
	OrderID int primary key identity(1,1),
	ItemID int,
	TavernID int,
	orderDate varchar(50),
	cost float,
	amount float
)


create table Services_Offered
(
	ServiceID int primary key identity(1,1),
	TavernID int,
	serviceName varchar(150),
	StatusID int
)


create table Statuses
(
	StatusID int primary key identity(1,1),
	statusName varchar(150)
)


create table Sales
(
	SaleID int primary key identity(1,1),
	ServiceID int,
	UserID int,
	TavernID int,
	price float,
	date varchar(150),
	amount float
)


