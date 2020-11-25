CREATE TABLE Users (
	FirstName VARCHAR(255), 
	LastName VARCHAR(255), 
	Email VARCHAR(255) PRIMARY KEY,
	Password VARCHAR(255), 
	Country VARCHAR(255)
);
CREATE TABLE Video (
	ID INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	ReleaseDate DATE, 
	Title VARCHAR(255), 
	Description VARCHAR(255),
	Duration DOUBLE,
	Platform VARCHAR(255)
);
CREATE TABLE App (
	Name VARCHAR(255) PRIMARY KEY, 
	Description VARCHAR(255),
	Cost DOUBLE
);
CREATE TABLE `Show` (
	Name VARCHAR(255) PRIMARY KEY,
	Description VARCHAR(255)
);
CREATE TABLE Platform (
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


CREATE TABLE Episode (
	`Show`VARCHAR(255),
	Video INT(8) UNSIGNED,
	EpisodeNumber INT NOT NULL,
	SeasonNumber INT NOT NULL,
	FOREIGN KEY(`Show`) REFERENCES `Show`(Name),
    PRIMARY KEY(`Show`, Video),
	FOREIGN KEY(Video) REFERENCES Video(ID)
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

CREATE TABLE ToWatch (
	User VARCHAR(255),
	FOREIGN KEY(User) REFERENCES Users(Email),
	Video INT(8) UNSIGNED,
    PRIMARY KEY(Video, User),
	FOREIGN KEY(Video) REFERENCES Video(ID)
);

CREATE TABLE ShowToWatch (
	User VARCHAR(255),
	FOREIGN KEY(User) REFERENCES Users(Email),
	ShowName VARCHAR(255),
	FOREIGN KEY(ShowName) REFERENCES `Show`(Name),
    PRIMARY KEY(ShowName, User)
);

CREATE TABLE UserWatched (
	User VARCHAR(255),
	FOREIGN KEY(User) REFERENCES Users(Email),
	Video INT(8) UNSIGNED,
    PRIMARY KEY(Video, User),
	FOREIGN KEY(Video) REFERENCES Video(ID)
); 


CREATE TABLE UserApps (
	USER VARCHAR(255),
	FOREIGN KEY(User) REFERENCES Users(Email),
	App VARCHAR(255),
	FOREIGN KEY(App) REFERENCES App(Name),
	PRIMARY KEY(USER, App)
);


CREATE TABLE VideoTag (
	Video INT(8) UNSIGNED,
	tagName VARCHAR(255),
	FOREIGN KEY(Video) REFERENCES Video(ID),
	PRIMARY KEY(tagName, Video)
);
	