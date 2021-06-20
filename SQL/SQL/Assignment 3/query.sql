SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='DBBootCamp'

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

-- Write a query that returns guests with a birthday before 2000.
SELECT user_info.userName, Users.UserID, user_info.Birthday
FROM Users
INNER JOIN user_info ON Users.UserID=user_info.UserID
WHERE user_info.Birthday < '1/1/2000'

-- Write a query to return rooms that cost more than 100 gold a night

