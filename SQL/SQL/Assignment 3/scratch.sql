use DBBootCamp

create table Rooms
(
	RoomID int primary key identifier(1,1),
	TavernID int foreign key (TavernID) references Taverns(TavernID),
	StatusID int foreign key (StatusID) references Statuses(StatusID)
)

create table RoomInfo
(
	RoomID int foreign key (RoomID) references Rooms(RoomID),
	RoomNumber int,
)

create table RoomStays
(
	stayID int primary key identifier(1,1),
	UserID int foreign key (UserID) references Users(UserID),
	RoomID int foreign key (RoomID) references Rooms(RoomID),
	sale float,
	rate float,
)

create table Staydate
(
	stayID int foreign key (stayID) references RoomStays(stayID),
	checkedin date,
	checkedout date

)