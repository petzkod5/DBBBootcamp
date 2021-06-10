use DBBootCamp


create table Taverns
(
	TavernID int primary key identity(1,1),
	TavernName varchar(50),
	FloorsCount int,
	OwnerID int,
	LocationID int
)

create table Users
(
	UserID int primary key identity(1,1),
	UserName varchar(100),
	Birthday varchar(100),
	RoleID int
)

create table UserRoles
(
	RoleID int,
	UserID int
)

create table Roles
(
	ID int primary key identity(1,1),
	RoleName varchar(150)
)

create table Locations
(
	LocationID int primary key identity(1,1),
	LocName varchar(150)
)

drop table BasementRats
create table BasementRats
(
	ID int primary key identity(1,1),
	RatName varchar(150),
	TavernID int
)

