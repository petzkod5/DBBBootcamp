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
SELECT 
	Users.UserID,
	user_info.userName,
	Classes.className,
	class_levels.classLevel
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
SELECT
	i.userName,
	i.UserID
FROM class_levels c
INNER JOIN user_info i ON i.UserID=c.UserID
GROUP BY i.UserID, i.userName
HAVING COUNT(distinct c.classID) >= 2;


--Write a query that returns guests with 2 or more classes with levels higher than 5
SELECT
	i.userName,
	i.UserID
FROM class_levels c
INNER JOIN user_info i ON i.UserID=c.UserID
GROUP BY i.UserID, i.userName
HAVING COUNT(distinct c.classID) >= 2
ORDER BY i.UserID

--Write a query that returns guests with ONLY their highest level class
SELECT
	i.userName,
	u.UserID,
	max_level.classLevel,
	ci.className
FROM Users u
JOIN user_info i ON u.UserID = i.UserID
JOIN
	(
		SELECT *
		FROM class_levels c
			WHERE c.classLevel =
						(
							SELECT MAX(classLevel)
							FROM class_levels as c1
							WHERE c.classID = c1.classID
						)
	) as max_level
	ON i.UserID = max_level.UserID
JOIN
	Classes ci ON max_level.classID = ci.classID

--Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)
/* NOTE
	I DONT THINK THIS ACTUALLY WORKS BECAUSE THE DATE DATA IS BROKEN
	I USED RANDOMIZED SEEDED DATA FROM A PYTHON SCRIPT. DATES AARE NOT LINEAR
	YOU CAN HAVE A CHECK IN DAATE AFTER A CHECK OUT DATE AND VISE VERSA

	I do however think my logic is right? Maybe..
*/
DECLARE @myStartDate date, @myEndDate date
SET @myStartDate = '11/18/1997';
SET @myEndDate   = '1/1/2009';
SELECT 
	r.*,
	d.*
FROM 
	RoomStays r
JOIN Staydate d ON r.stayID = d.stayID
WHERE
	(d.checkedin >= @myStartDate AND d.checkedin <= @myStartDate)
	OR
	(d.checkedout >= @myEndDate AND d.checkedout <= @myEndDate)
	OR
	(d.checkedin <= @myStartDate AND d.checkedout IS NULL)

/* 
NUMBER 9: Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.
*/

select sysObj.name, sysCol.name, *
from sys.objects sysObj inner join sys.columns sysCol on sysObj.object_id = sysCol.object_id


SELECT 
	CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
FROM 
	INFORMATION_SCHEMA.TABLES
WHERE 
	TABLE_NAME = 'Taverns'
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
(
	CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
	Then CONCAT
		('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), ')') 
	Else '' 
	END)
, 
	CASE WHEN refConst.CONSTRAINT_NAME IS NOT NULL
	Then 
		(CONCAT(' FOREIGN KEY REFERENCES ', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
	Else '' 
	END
,
	CASE WHEN refConst.CONSTRAINT_NAME IS NULL AND keys.COLUMN_NAME IS NOT NULL
	Then 
		' PRIMARY KEY'
	Else '' 
	END
, 
',') as queryPiece 
FROM 
	INFORMATION_SCHEMA.COLUMNS as cols
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE as keys ON 
	(keys.TABLE_NAME = cols.TABLE_NAME and keys.COLUMN_NAME = cols.COLUMN_NAME)
LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as refConst ON 
	(refConst.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
LEFT JOIN 
	(SELECT DISTINCT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME 
		FROM 
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE) as constKeys 
	ON (constKeys.CONSTRAINT_NAME = refConst.UNIQUE_CONSTRAINT_NAME)
WHERE 
	cols.TABLE_NAME = 'Taverns'
UNION ALL
SELECT ')'; 
