/* 
GET_CLASSGROUP
Returns a level grouping for a user.
Beginner/Intermediate/Expert
w/ minor error checking
dbo.GET_CLASSGROUP(@level)

@level int
	used to calculate grouping
*/

DROP FUNCTION IF EXISTS GET_CLASSGROUP
CREATE FUNCTION GET_CLASSGROUP(
	@level int
)
RETURNS varchar(50) AS
BEGIN
	RETURN
	CASE 
		WHEN @level BETWEEN 1 AND 6 THEN 'Beginner'
		WHEN @level BETWEEN 6 AND 11 THEN 'intermediate'
		WHEN @level > 10 THEN 'Expert'
		ELSE 'You should not have gotten this output'
	END
END;

/*
gor();
Gets Open Rooms

Get a table of open rooms based on date given

dbo.gor(@day)

@date date
	Holds the day value, expected MM/DD/YYYY
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION gor 
(	
	
	@date date 
	 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT
	r.RoomID
	FROM
	RoomStays r
		JOIN
		Staydate s ON
		s.stayID = r.stayID
	WHERE
	@date NOT BETWEEN s.checkedin AND s.checkedout
		
)
GO



/*
============================
	  Rooms_In_Range
============================
Get all the room ids and 
Tavern names associated
from a MIN and MAX price
============================

@min
	minimum price
@max
	maximum price
*/

CREATE FUNCTION Rooms_In_Range 
(	
	
	@min float,
	@max float
	 
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT *
	FROM RoomStays r
	WHERE
		r.rate BETWEEN @min AND @max
		
)
GO