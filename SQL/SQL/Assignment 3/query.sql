SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='DBBootCamp'

CREATE VIEW [User Info] AS
SELECT DISTINCT *
FROM Users
INNER JOIN user_info ON user_info.UserID=Users.UserID
INNER JOIN class_levels ON class_levels.UserID=Users.UserID
INNER JOIN Classes ON Classes.classID=class_levels.classID

select * from UserRoles
select * from Roles
select * from Sales
select * from Orders
select * from Services_Offered
select * from Taverns
select * from class_levels
select * from user_info
select * from ServiceStatuses
select * from UserStatuses
select * from Users
select * from Locations
select * from Supplies
select * from Classes
select * from Rooms
select * from RoomInfo
select * from RoomStays

-- Write a query that returns guests with a birthday before 2000.
SELECT user_info.userName, Users.UserID, user_info.Birthday
FROM Users
INNER JOIN user_info ON Users.UserID=user_info.UserID
WHERE user_info.Birthday < '1/1/2000'

-- Write a query to return rooms that cost more than 100 gold a night
SELECT Taverns.TavernName,Rooms.RoomID,RoomInfo.RoomNumber,RoomStays.rate
FROM Rooms
INNER JOIN RoomInfo ON Rooms.RoomID=RoomInfo.RoomID
INNER JOIN Taverns ON Taverns.TavernID=Rooms.TavernID
INNER JOIN RoomStays ON RoomStays.RoomID=Rooms.RoomID
WHERE RoomStays.rate > 100

-- Write a query that returns UNIQUE guest names. 
SELECT DISTINCT *
from Users
INNER JOIN user_info ON user_info.UserID=Users.UserID

--Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]
SELECT *
FROM Users
INNER JOIN user_info ON user_info.UserID=Users.UserID
order by user_info.userName ASC

--Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)
SELECT Users.UserID,user_info.userName,Classes.className,class_levels.classLevel,
	CASE
		WHEN class_levels.classLevel >= 1 AND class_levels.classLevel <= 10 THEN '1-10'
		WHEN class_levels.classLevel >=11 AND class_levels.classLevel <= 20 THEN '11-20'
		WHEN class_levels.classLevel >=21 AND class_levels.classLevel <= 30 THEN '21-30'
		WHEN class_levels.classLevel >=31 AND class_levels.classLevel <= 40 THEN '31-40'
		ELSE 'Pro'
	END AS ClassGroup
FROM Users
INNER JOIN user_info ON user_info.UserID=Users.UserID
INNER JOIN class_levels ON class_levels.UserID=Users.UserID
INNER JOIN Classes ON Classes.classID=class_levels.classID
ORDER BY Users.UserID