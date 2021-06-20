use DBBootCamp

--Write a query to return users who have owner roles
SELECT Users.UserID,user_info.userName,Roles.RoleName
FROM Users
INNER JOIN user_info ON user_info.UserID=Users.UserID
INNER JOIN Roles ON Roles.ID=Users.RoleID
WHERE Users.RoleID = 1
ORDER BY Users.UserID ASC

--Write a query to return users who have owner roles and information about their taverns
SELECT Users.UserID,user_info.userName,Roles.RoleName,Taverns.TavernName,Locations.LocName
FROM Users
JOIN user_info ON user_info.UserID=Users.UserID
JOIN Roles ON Roles.ID=Users.RoleID
JOIN Taverns ON Taverns.OwnerID=Users.UserID
JOIN Locations ON Locations.LocationID=Taverns.LocationID
WHERE Users.RoleID = 1

--Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels
SELECT Users.UserID,user_info.userName,Classes.className,class_levels.classLevel
FROM Users
JOIN user_info ON user_info.UserID=Users.UserID
JOIN class_levels ON class_levels.UserID=Users.UserID
JOIN Classes ON Classes.classID=class_levels.classID
ORDER BY user_info.userName ASC


--Write a query that returns the top 10 sales in terms of sales price and what the services were
SELECT TOP 10 * 
FROM Sales
INNER JOIN Services_Offered ON Services_Offered.ServiceID=Sales.ServiceID
ORDER BY Sales.price DESC

--Write a query that returns guests with 2 or more classes



--Write a query that returns guests with 2 or more classes with levels higher than 5