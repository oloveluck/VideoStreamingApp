CREATE TABLE Users (
	FirstName varchar(255), 
	LastName varchar(255), 
	Email varchar(255), 
	Password varchar(255), 
	Country varchar(255)
);

CREATE DOMAIN PLATFORM (

);

CREATE DOMAIN TAGS (

);

CREATE TABLE Apps (
	Name varchar(255), 
	Description varchar(255), 
	Platform PLATFORM, 
	Mobile bit
);

CREATE TABLE Videos (
	Title varchar(255), 
	Description varchar(255), 
	ReleaseDate varchar(255), 
	Duration int, 
	HostApp Apps, 
	Tags TAGS
);

CREATE DOMAIN SeqVideo (

);

CREATE TABLE Shows (
	Title varchar(255), 
	Description varchar(255), 
	SeasonSequence SeqVideo
);