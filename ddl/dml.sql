INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('Owen', 'Loveluck', 'loveluck.o@northeastern.edu', 'password', 'USA');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('Ryan', 'Milligan', 'milligan.r@northeastern.edu', 'password', 'USA');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('Eric', 'Qin', 'qin.e@northeastern.edu', 'password', 'USA');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('Juan', 'Martos', 'martos.j@northeastern.edu', 'password', 'Spain');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('Nate', 'Derbinski', 'derbinski.n@northeastern.edu', 'password', 'USA');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('John', 'Doe', 'doe.j@northeastern.edu', 'password', 'United Kingdom');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('Trevor', 'Condon', 'condon.c@northeastern.edu', 'password', 'USA');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('Constandinos', 'Andreou', 'andreou.c@northeastern.edu', 'password', 'Greece');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('James', 'Bond', 'bond.j@northeastern.edu', 'password', 'United Kingdom');
INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES ('Raj', 'Patel', 'patel.raj2@northeastern.edu', 'password', 'Canada');

-- 1
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'The Reichenbach Fall', 'Moriarty', 120.50);
-- 2
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'A Study in Pink', 'Dying cabbie', 135.00);
-- 3
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'The Mandalorian', 'A Mandalorian bounty hunter takes a tracking job for a client who pays well.',30.21);
-- 4
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'The Child', 'Having tracked down his quarry, the Mandalorian must now contend with thieving bandits.',35.00);
-- 5
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'Room Service from Mad Men', 'popular dishes from the 60s',10.00);
-- 6
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'Harry Potter Special', 'harry potter dishes',8.50);
-- 7
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('2012-19-05', 'Chelsea vs Bayern Munich', 'Champions League Final in Munich',90.00);
-- 8
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('2008-16-06', 'Celtics vs Lakers', 'NBA finals game 6', 100.00);
-- 9
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'Say My Name', 'As Walt unveils his new plan to keep all the hijacked chemicals and expand his business, the DEA investigation closes in on Mike.', 60.00);
-- 10
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'Face Off', 'After their plan to kill Gus fails, Walt and Jesse must act fast if they are to avoid being killed in revenge.', 65.00);
-- 11
INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES ('1964-10-01', 'Goldfinger', 'A martini. Shaken, not stirred', 119.00);


INSERT INTO `app` (Name, Description, Cost) VALUES ('Netflix', 'Most popular streaming platform', 14.00);
INSERT INTO `app` (Name, Description, Cost) VALUES ('Amazon Prime', 'Streaming service that comes with Amazon prime', 8.99);
INSERT INTO `app` (Name, Description, Cost) VALUES ('HBO MAX', 'HBO without requiring cable', 15.00);
INSERT INTO `app` (Name, Description, Cost) VALUES ('Hulu', 'TV shows with some ads. Has live sports.', 5.99);
INSERT INTO `app` (Name, Description, Cost) VALUES ('Youtube', 'Free platform, mostly by individual creators', 0.00);
INSERT INTO `app` (Name, Description, Cost) VALUES ('Peacock', 'For NBC shows and films', 4.99);
INSERT INTO `app` (Name, Description, Cost) VALUES ('Disney+', 'For Childrens shows and TV', 6.99);
INSERT INTO `app` (Name, Description, Cost) VALUES ('CBS All Access', 'For CBS shows', 5.99);
INSERT INTO `app` (Name, Description, Cost) VALUES ('ESPN+', 'Streming service for live sports on ESPN', 5.99);
INSERT INTO `app` (Name, Description, Cost) VALUES ('Fubo', 'Streaming service for live sports', 10.99);


INSERT INTO `shows` (Name, Description) VALUES ('Sherlock', 'detective and his partner john watson');
INSERT INTO `shows` (Name, Description) VALUES ('Champions League Soccer', '');
INSERT INTO `shows` (Name, Description) VALUES ('NBA', 'National Basketball Association Games');
INSERT INTO `shows` (Name, Description) VALUES ('NFL', 'National Football League Games');
INSERT INTO `shows` (Name, Description) VALUES ('The Mandalorian', 'Star Wars spin off');
INSERT INTO `shows` (Name, Description) VALUES ('Binging With Babish', 'Cooking show making dishes referenced in popular culture.');
INSERT INTO `shows` (Name, Description) VALUES ('Sesame Street', 'Muppets teach children basic concepts');
INSERT INTO `shows` (Name, Description) VALUES ('Ozark', 'Nice looking guy launders money');
INSERT INTO `shows` (Name, Description) VALUES ('Spongebob Squarepants', 'Small sponge lives life as a fry-cook');
INSERT INTO `shows` (Name, Description) VALUES ('Community', 'Community college students study Spanish');

INSERT INTO `Season` (Shows, Video, Number) VALUES ('Sherlock', 1, 2); 
INSERT INTO `Season` (Shows, Video, Number) VALUES ('Sherlock', 2, 1);
INSERT INTO `Season` (Shows, Video, Number) VALUES ('Champions League Soccer', 7, 2012);
INSERT INTO `Season` (Shows, Video, Number) VALUES ('NBA', 8, 2008);
INSERT INTO `Season` (Shows, Video, Number) VALUES ('The Mandalorian', 3, 1);
INSERT INTO `Season` (Shows, Video, Number) VALUES ('The Mandalorian', 4, 1);
INSERT INTO `Season` (Shows Video, Number) VALUES ('Binging With Babish', 5, 2);
INSERT INTO `Season` (Shows Video, Number) VALUES ('Binging With Babish', 6, 3);
INSERT INTO `Season` (Shows Video, Number) VALUES ('Breaking Bad', 9, 4);
INSERT INTO `Season` (Shows Video, Number) VALUES ('Breaking Bad', 10, 5);


INSERT INTO `platform` (Name, IsMobile) VALUES ('AppleTV', 0);
INSERT INTO `platform` (Name, IsMobile) VALUES ('Roku', 0);
INSERT INTO `platform` (Name, IsMobile) VALUES ('IOS', 1);
INSERT INTO `platform` (Name, IsMobile) VALUES ('Andriod', 1);
INSERT INTO `platform` (Name, IsMobile) VALUES ('Windows', 0);
INSERT INTO `platform` (Name, IsMobile) VALUES ('Android TV', 0);
INSERT INTO `platform` (Name, IsMobile) VALUES ('Chromecast', 0);
INSERT INTO `platform` (Name, IsMobile) VALUES ('WebOS', 0);
INSERT INTO `platform` (Name, IsMobile) VALUES ('Amazon Fire TV', 0);
INSERT INTO `platform` (Name, IsMobile) VALUES ('Mac OS', 0);


INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('IOS', 'Netflix', 4.6, 2.3);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('Andriod', 'Netflix', 4.6, 2.2);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('Roku', 'Netflix', 4.6, 3.0);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('IOS', 'Fubo', 4.3, 1.9);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('Andriod', 'Fubo', 4.3, 2.2);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('AppleTV', 'Fubo', 4.3, 2.8);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('IOS', 'Disney+', 4.3, 1.9);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('Andriod', 'Disney+', 4.3, 2.2);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('AppleTV', 'Disney+', 4.3, 2.8);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('IOS', 'Youtube', 4.9, 5.9);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('Andriod', 'Youtube', 4.7, 4.7);
INSERT INTO `PlatformApp` (Platform, App, Rating, Version) VALUES ('AppleTV', 'Youtube', 4.4, 4.3);


INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (1, 'Netflix', 1);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (2, 'Netflix', 1);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (3, 'Disney+', 1);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (4, 'Disney+', 1);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (5, 'Youtube', 0);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (6, 'Youtube', 0);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (7, 'Fubo', 1);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (8, 'Fubo', 1);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (9, 'Netflix', 1);
INSERT INTO `VideoApp` (Video, App, Subscription) VALUES (10, 'Netflix', 1);


INSERT INTO `UserLikes` (User, Video) VALUES ('loveluck.o@northeastern.edu', 1);
INSERT INTO `UserLikes` (User, Video) VALUES ('loveluck.o@northeastern.edu', 2);
INSERT INTO `UserLikes` (User, Video) VALUES ('loveluck.o@northeastern.edu', 7);
INSERT INTO `UserLikes` (User, Video) VALUES ('martos.j@northeastern.edu', 8);
INSERT INTO `UserLikes` (User, Video) VALUES ('martos.j@northeastern.edu', 9);
INSERT INTO `UserLikes` (User, Video) VALUES ('martos.j@northeastern.edu', 4);
INSERT INTO `UserLikes` (User, Video) VALUES ('milligan.r@northeastern.edu', 5);
INSERT INTO `UserLikes` (User, Video) VALUES ('milligan.r@northeastern.edu', 10);
INSERT INTO `UserLikes` (User, Video) VALUES ('milligan.r@northeastern.edu', 9);
INSERT INTO `UserLikes` (User, Video) VALUES ('milligan.r@northeastern.edu', 1);
INSERT INTO `UserLikes` (User, Video) VALUES ('milligan.r@northeastern.edu', 2);



INSERT INTO `WantsToWatch` (User, Video) VALUES ('loveluck.o@northeastern.edu', 6);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('loveluck.o@northeastern.edu', 5);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('loveluck.o@northeastern.edu', 2);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('martos.j@northeastern.edu', 4);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('martos.j@northeastern.edu', 5);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('martos.j@northeastern.edu', 1);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('milligan.r@northeastern.edu', 1);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('milligan.r@northeastern.edu', 2);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('milligan.r@northeastern.edu', 3);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('milligan.r@northeastern.edu', 4);
INSERT INTO `WantsToWatch` (User, Video) VALUES ('milligan.r@northeastern.edu', 5);



INSERT INTO `UserWatched` (User, Video) VALUES ('loveluck.o@northeastern.edu', 1);
INSERT INTO `UserWatched` (User, Video) VALUES ('loveluck.o@northeastern.edu', 2);
INSERT INTO `UserWatched` (User, Video) VALUES ('loveluck.o@northeastern.edu', 3);
INSERT INTO `UserWatched` (User, Video) VALUES ('loveluck.o@northeastern.edu', 4);
INSERT INTO `UserWatched` (User, Video) VALUES ('loveluck.o@northeastern.edu', 6);
INSERT INTO `UserWatched` (User, Video) VALUES ('loveluck.o@northeastern.edu', 7);
INSERT INTO `UserWatched` (User, Video) VALUES ('martos.j@northeastern.edu', 4);
INSERT INTO `UserWatched` (User, Video) VALUES ('martos.j@northeastern.edu', 5);
INSERT INTO `UserWatched` (User, Video) VALUES ('martos.j@northeastern.edu', 1);
INSERT INTO `UserWatched` (User, Video) VALUES ('martos.j@northeastern.edu', 10);
INSERT INTO `UserWatched` (User, Video) VALUES ('martos.j@northeastern.edu', 9);
INSERT INTO `UserWatched` (User, Video) VALUES ('martos.j@northeastern.edu', 8);
INSERT INTO `UserWatched` (User, Video) VALUES ('milligan.r@northeastern.edu', 1);
INSERT INTO `UserWatched` (User, Video) VALUES ('milligan.r@northeastern.edu', 2);
INSERT INTO `UserWatched` (User, Video) VALUES ('milligan.r@northeastern.edu', 3);
INSERT INTO `UserWatched` (User, Video) VALUES ('milligan.r@northeastern.edu', 4);
INSERT INTO `UserWatched` (User, Video) VALUES ('milligan.r@northeastern.edu', 5);


INSERT INTO `UserApps` (User, App) VALUES ('loveluck.o@northeastern.edu', 'Netflix');
INSERT INTO `UserApps` (User, App) VALUES ('loveluck.o@northeastern.edu', 'Disney+');
INSERT INTO `UserApps` (User, App) VALUES ('loveluck.o@northeastern.edu', 'Espn+');
INSERT INTO `UserApps` (User, App) VALUES ('milligan.r@northeastern.edu', 'Netflix');
INSERT INTO `UserApps` (User, App) VALUES ('milligan.r@northeastern.edu', 'Disney+');
INSERT INTO `UserApps` (User, App) VALUES ('milligan.r@northeastern.edu', 'Espn+');
INSERT INTO `UserApps` (User, App) VALUES ('martos.j@northeastern.edu', 'Netflix');
INSERT INTO `UserApps` (User, App) VALUES ('martos.j@northeastern.edu', 'Disney+');
INSERT INTO `UserApps` (User, App) VALUES ('martos.j@northeastern.edu', 'Youtube');
INSERT INTO `UserApps` (User, App) VALUES ('milligan.r@northeastern.edu', 'Youtube');
INSERT INTO `UserApps` (User, App) VALUES ('loveluck.o@northeastern.edu', 'Youtube');
