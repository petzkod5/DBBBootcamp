create table GuestInfo
(
	UserID int foreign key (UserID) references Users(UserID),
	Birthday varchar(50),
	Cakeday varchar(50),
	StatusID int foreign key (StatusID) references Statuses(StatusID),
	levelID int foreign key (levelID) references Levels(levelID),
	classID int foreign key (classID) references Classes(ClassID)

)

create table Levels
(
	levelID int primary key identity(1,1),
	GuestID int foreign key (GuestID) references ,
	classID int foreign key (classID) references Classes(ClassID),
	levels int,
	date_leveled varchar(50)
)

create table Classes
(
	ClassID int primary key identity(1,1),
	className varchar(150)
)


--Goodbye rat bois
drop table if exists BasementRats
