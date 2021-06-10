--Relate Tavern to Users and Location
alter table Taverns add foreign key (OwnerID) references Users(UserID)
alter table Taverns add foreign key (LocationID) references Locations(LocationID)

--Relate BasementRats to Taverns
alter table BasementRats add foreign key (TavernID) references Taverns(TavernID)

--Relate UserRoles to Users
alter table UserRoles add foreign key (UserID) references Users(UserID)

--Relate UserRoles to Roles
alter table UserRoles add foreign key (RoleID) references Roles(ID)


/* TO DO

	Create New Tables
			Supplies
				with attributes weight, name
			Orders
				with attributes date, supply id, tavern id, cost, amount
			Services
				with attributes Tavern ID, servicename,servicestatusID
			Status
				with attributes StatusID, StatusName
					active,inactive,instock,outofstock,discont
			Sales
				with attributes serviceID, UserID, price, date, amountpurchased, tavernID

	Create Joins on Tables.


*/