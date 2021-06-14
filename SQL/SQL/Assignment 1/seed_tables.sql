use DBBootCamp







-- Locations
insert into Locations (LocName) values ('New Jersey')
insert into Locations (LocName) values ('Kansas')
insert into Locations (LocName) values ('Hrothgar')
insert into Locations (LocName) values ('Stormwind')
insert into Locations (LocName) values ('Mesopotamia')

-- Insert Users
insert into Users (RoleID) values (1);
insert into Users (RoleID) values (2);
insert into Users (RoleID) values (5);
insert into Users (RoleID) values (3);
insert into Users (RoleID) values (1);
insert into Users (RoleID) values (4);

-- Insert Taverns
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Atlantis',4,1,1);
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Battlestar',1,2,5);
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Goldshire',3,2,2);
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Midgard',5,2,3);
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Blue Moon Inn',2,2,4);


--Insert Services_Offered

--Insert Orders

--Insert Sales

-- Insert Roles
insert into Roles (RoleName) values ('Owner')
insert into Roles (RoleName) values ('Swain')
insert into Roles (RoleName) values ('Bar Maiden')
insert into Roles (RoleName) values ('Filthy Peasant Patron')

-- Insert UserRoles
insert into UserRoles (RoleID,UserID) values (1,1)
insert into UserRoles (RoleID,UserID) values (2,3)
insert into UserRoles (RoleID,UserID) values (3,4)
insert into UserRoles (RoleID,UserID) values (4,2)
insert into UserRoles (RoleID,UserID) values (4,5)
insert into UserRoles (RoleID,UserID) values (4,6)




select * from UserRoles
select * from Roles
select * from Sales
select * from Orders
select * from Services_Offered
select * from Taverns
select * from class_levels
select * from user_info
select * from Statuses
select * from Users
select * from Locations
select * from Supplies
select * from Classes


