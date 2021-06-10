use DBBootCamp

-- Insert Taverns
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Atlantis',4,1,1);
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Battlestar',1,2,5);
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Goldshire',3,2,2);
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Midgard',5,2,3);
insert into Taverns (TavernName,FloorsCount,OwnerID,LocationID) values ('Blue Moon Inn',2,2,4);

-- Insert Users
insert into Users (UserName,Birthday,RoleID) values ('Cloud','11/18/1997',1);
insert into Users (UserName,Birthday,RoleID) values ('Doge','12/1/1997',2);
insert into Users (UserName,Birthday,RoleID) values ('Aaron','1/18/1997',5);
insert into Users (UserName,Birthday,RoleID) values ('Logan','2/18/1997',3);
insert into Users (UserName,Birthday,RoleID) values ('Dylan','5/18/1997',1);
insert into Users (UserName,Birthday,RoleID) values ('Danny','6/18/1997',4);

-- Locations
insert into Locations (LocName) values ('New Jersey')
insert into Locations (LocName) values ('Kansas')
insert into Locations (LocName) values ('Hrothgar')
insert into Locations (LocName) values ('Stormwind')
insert into Locations (LocName) values ('Mesopotamia')


-- Insert BasementRats
insert into BasementRats (RatName,TavernID) values ('Jimmay',2);
insert into BasementRats (RatName,TavernID) values ('Neutron',1);
insert into BasementRats (RatName,TavernID) values ('Carl',3);
insert into BasementRats (RatName,TavernID) values ('Sheen',5);
insert into BasementRats (RatName,TavernID) values ('Cwoissant',3);
insert into BasementRats (RatName,TavernID) values ('smol',1);


-- Insert UserRoles
insert into UserRoles (UserID) values (1)
insert into UserRoles (UserID) values (3)
insert into UserRoles (UserID) values (4)
insert into UserRoles (UserID) values (2)
insert into UserRoles (UserID) values (5)
insert into UserRoles (UserID) values (6)

-- Insert Roles
insert into Roles (RoleName) values ('Owner')
insert into Roles (RoleName) values ('Swain')
insert into Roles (RoleName) values ('Bar Maiden')
insert into Roles (RoleName) values ('Filthy Peasant Patron')


select * from Taverns --
select * from Users --
select * from Locations --
select * from UserRoles
select * from BasementRats --
select * from Roles --


