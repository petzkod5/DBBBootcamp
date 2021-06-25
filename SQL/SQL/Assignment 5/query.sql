--Write a query to return a “report” of all users and their roles
/* Note. Seeded Data is randomized from Python script. It makes 0 sense. */
SELECT 
	u.UserID,
	i.userName,
	R.RoleName
FROM Users u
JOIN user_info i ON
	u.UserID = i.UserID
JOIN 
	(
	SELECT *
	FROM UserRoles
	JOIN Roles ON
		Roles.ID = UserRoles.RoleID
	) as R
	ON u.UserID = R.UserID


--Write a query to return all classes and the count of guests that hold those classes
SELECT
	c.classID as ID,
	c.className as CLASS,
	totalguests as TOTAL
FROM
	Classes as C




/*Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels. 
		Add a column that labels them beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)*/
SELECT
	u.UserID as ID,
	i.userName 'Guest Name',
	c.className as Class,
	c.classLevel as _Level,
	dbo.GET_CLASSGROUP(c.classLevel)
FROM Users u
JOIN user_info i ON
	i.UserID = u.UserID
JOIN 
	(
		SELECT 
			class_levels.UserID,
			class_levels.classLevel,
			Classes.className
		FROM class_levels
		JOIN Classes ON 
			Classes.classID=class_levels.classID
	) as c ON
	c.UserID = u.UserID

--Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)
--Function found in functions.sql
SELECT
	(SELECT dbo.GET_CLASSGROUP	(-1))	'Wrong Input',
	(SELECT dbo.GET_CLASSGROUP	( 5))	'1-5',
	(SELECT dbo.GET_CLASSGROUP	( 6))	'5-10',
	(SELECT dbo.GET_CLASSGROUP	(15))	'10+'


--Write a function that returns a report of all open rooms (not used) on a particular day (input) and which tavern they belong to 
DECLARE @date date;
SET @date = '01/01/2020';
SELECT op.RoomID, x.TavernName
FROM dbo.gor(@date) op
	JOIN 
	(
		SELECT t.TavernName,r.RoomID
		FROM Taverns t
			JOIN
				Rooms r ON
				r.TavernID = t.TavernID
	) AS x ON
	x.RoomID = op.RoomID
ORDER BY x.TavernName

--Modify the same function from 5 to instead return a report of prices in a range (min and max prices) - Return Rooms and their taverns based on price inputs
SELECT 
	rir.RoomID,
	rir.rate,
	tr.TavernName
FROM dbo.Rooms_In_Range(5,100) rir
	JOIN
		(
			SELECT t.TavernName,r.RoomID
			FROM Taverns t
				JOIN
					Rooms r ON
					r.TavernID = t.TavernID
		) as tr ON
		tr.RoomID = rir.RoomID
ORDER BY rir.rate ASC
--Write a command that uses the result from 6 to Create a Room in another tavern that undercuts (is less than) the cheapest room by a penny - thereby making the new room the cheapest one
INSERT INTO RoomStays
(


)