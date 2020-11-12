DROP database project;
CREATE database project;
CREATE TABLE user (
	FirstName VARCHAR(255), 
	LastName VARCHAR(255), 
	Email VARCHAR(255) PRIMARY KEY,
	Password VARCHAR(255), 
	Country VARCHAR(255)
);

CREATE TABLE video (
	ID INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	ReleaseDate DATE, 
	Title VARCHAR(255), 
	Description VARCHAR(255)
);

CREATE TABLE app (
	Name VARCHAR(255) PRIMARY KEY, 
	Description VARCHAR(255)
);

CREATE TABLE show (
	Name VARCHAR(255) PRIMARY KEY,
	Description VARCHAR(255)
);

CREATE TABLE platform (
	Name VARCHAR(255) PRIMARY KEY, 
	IsMobile TINYINT(1)
);

CREATE TABLE PlatformApp (
	Platform VARCHAR(255),
	FOREIGN KEY(Platform) REFERENCES Platform(Name), 
	App VARCHAR(255),
    PRIMARY KEY(Platform, APP),
	FOREIGN KEY(App) REFERENCES App(Name), 
	Rating DOUBLE, 
	Version DOUBLE
);

CREATE TABLE Season (
	Show VARCHAR(255), 
	FOREIGN KEY(Shows) REFERENCES Shows(Name), 
	Video INT(8) UNSIGNED,
    PRIMARY KEY(Shows, Video),
	FOREIGN KEY(Video) REFERENCES Video(ID), 
	Number INT(4)
);

CREATE TABLE VideoApp (
	Video INT(8) UNSIGNED,
	FOREIGN KEY(Video) REFERENCES Video(ID), 
	App VARCHAR(255),
    PRIMARY KEY(Video, App),
	FOREIGN KEY(App) REFERENCES App(Name), 
	Subscription TINYINT(1)
);

CREATE TABLE UserLikes (
	User VARCHAR(255),
	FOREIGN KEY(User) REFERENCES Users(Email), 
	Video INT(8) UNSIGNED,
    PRIMARY KEY(Video, User),
    FOREIGN KEY(Video) REFERENCES Video(ID)
);

CREATE TABLE WantsToWatch (
	User VARCHAR(255),
	FOREIGN KEY(User) REFERENCES Users(Email), 
	Video INT(8) UNSIGNED,
    PRIMARY KEY(Video, User),
	FOREIGN KEY(Video) REFERENCES Video(ID)
);

CREATE TABLE UserWatched (
	User VARCHAR(255),
	FOREIGN KEY(User) REFERENCES Users(Email), 
	Video INT(8) UNSIGNED,
    PRIMARY KEY(Video, User),
	FOREIGN KEY(Video) REFERENCES Video(ID)
);