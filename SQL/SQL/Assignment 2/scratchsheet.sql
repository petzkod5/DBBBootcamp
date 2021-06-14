create table user_info
(
	UserID int foreign key (UserID) references Users(UserID),
	userName varchar(150),
	Notes varchar(MAX),
	Birthday date,
	Cakeday date,
	StatusID int foreign key (StatusID) references Statuses(StatusID)
)

create table class_levels
(
	levelID int primary key identity(1,1),
	UserID int foreign key (UserID) references Users(UserID),
	classID int foreign key (classID) references Classes(ClassID),
	classLevel int,
	date_achieved date
)

create table Classes
(
	ClassID int primary key identity(1,1),
	className varchar(150)
)


--Goodbye rat bois
drop table if exists BasementRats
