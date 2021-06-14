create table user_info
(
	UserID int foreign key (UserID) references Users(UserID),
	userName varchar(150),
	Notes varchar(MAX),
	Birthday varchar(50),
	Cakeday varchar(50),
	StatusID int foreign key (StatusID) references Statuses(StatusID),
	levelID int foreign key (levelID) references Levels(levelID),

)

create table class_levels
(
	levelID int primary key identity(1,1),
	GuestID int foreign key (GuestID) references Users(UserID),
	classID int foreign key (classID) references Classes(ClassID),
	levels int,
	date_leveled date
)

create table Classes
(
	ClassID int primary key identity(1,1),
	className varchar(150)
)


--Goodbye rat bois
drop table if exists BasementRats
