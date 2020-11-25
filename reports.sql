SELECT users.FirstName AS fName, users.LastName AS lName, users.Email AS Email, video.Title AS likedMobileVideo 
FROM (((((
    SELECT DISTINCT app.Name AS mobileApp, platform.Name AS mobilePlat
	FROM (app INNER JOIN platformapp ON app.Name=platformapp.App) INNER JOIN platform ON platformapp.Platform=platform.Name
	WHERE platform.IsMobile=1
	ORDER BY mobileApp ASC, mobilePlat ASC
    ) as ma INNER JOIN (
        SELECT DISTINCT app.Name AS likeApp
		FROM ((app INNER JOIN videoapp ON app.Name=videoapp.App) INNER JOIN video ON videoapp.Video=video.ID) INNER JOIN userlikes ON video.ID=userlikes.Video
		ORDER BY likeApp ASC
        ) as la ON la.likeApp = ma.mobileApp) INNER JOIN videoapp ON la.likeApp=videoapp.App) INNER JOIN video ON video.ID=videoapp.Video) INNER JOIN 
        userlikes ON userlikes.Video=video.ID) RIGHT JOIN users ON userlikes.User=users.Email
GROUP BY likedMobileVideo
ORDER BY likedMobileVideo DESC;
/*
A list of users and whether or not they liked a video on a mobile platform. If they did, the title of the video is included.
1pt Strong motivation,
1pt Right join,
1pt Grouping,
2pt 2 Subqueries
1pt 3+ tables
*/

SELECT users.Email AS Email, video.Title AS freeToWatch
FROM (((
    SELECT video.Title AS freeVideo
    FROM video INNER JOIN videoapp ON video.ID=videoapp.Video
    WHERE videoapp.Subscription = 0
    ) AS fv INNER JOIN Video ON fv.freeVideo=video.ID) INNER JOIN wantstowatch ON wantstowatch.Video=video.ID) RIGHT JOIN users ON users.Email=wantstowatch.User
ORDER BY Email ASC;
/* List all videos that people want to watch and are free 
1pt Strong motivation,
1pt Right join
1pt Order
1pt 3+ tables
1pt Aggregate
1pt Where not used on join
*/

/* Find the the app available on iOS that has the most videos that Ryan has watched but does not like 
1 point, strong motivation, this query is relevant to determining recommendations for advertising and is a relevant and interesting point of data
1 point, two where conditions in the subquery not used for joins to determine name
1 point, clear grouping
1 point, clear aggregate functions
1 point, query result via EXCEPT, which is basically a union/intersect
1 point, two subqueries
1 point, contains a left join
1 point, 5 joined tables
8 points total.
*/

select videoapp.App
from app inner join platformapp inner join platform inner join videoapp left JOIN
(Select wantstowatch.Video as Video
from users inner join wantstowatch
on users.Email = wantstowatch.User
where users.FirstName = "Ryan" and users.LastName = "Milligan"
Except
Select userlikes.Video as Video
from users inner join userlikes
on users.Email = userlikes.User
where users.FirstName = "Ryan" and users.LastName = "Milligan") as ryans
on app.Name = platformapp.App and platformapp.Platform = platform.Name and app.Name = videoapp.Video and videoapp.Video = ryans.Video
where platform.Name = "IOS"
group by videoapp.App
having COUNT(*) = (
select max(big.counts) from (SELECT videoapp.App, COUNT(*) as counts
from app inner join platformapp inner join platform inner join videoapp left JOIN
(Select wantstowatch.Video as Video
from users inner join wantstowatch
on users.Email = wantstowatch.User
where users.FirstName = "Ryan" and users.LastName = "Milligan"
Except
Select userlikes.Video as Video
from users inner join userlikes
on users.Email = userlikes.User
where users.FirstName = "Ryan" and users.LastName = "Milligan") as ryans
on app.Name = platformapp.App and platformapp.Platform = platform.Name and app.Name = videoapp.Video and videoapp.Video = ryans.Video
where platform.Name = "IOS"
group by videoapp.App) as big)

/* given a video name, produce all videos in its season, or just details on the video if it does not belong to a season 
3 tables joined
non inner join
2 subqueries
2 ordered fields
where clause not used for joins
strong motivation as this is a useful function to creating lists and recommendations for a user
*/

select video.ID, video.ReleaseDate, video.Title as videoTitle, video.Description as videoDescription, shows.Name as showName, shows.Description as showDescription
from video inner join season inner join shows
on season.Video = video.ID and season.Shows = shows.Name
where season.Number IN
(select season.Number
from video left join season
on season.Video = video.ID
where video.Title = "The Child")
and season.Shows IN 
(select season.Shows
from video left join season
on season.Video = video.ID
where video.Title = "The Child")
order by video.ID, video.Title

/* Lists every show that a specific paramaterized app has videos for */
/* 1 point for strong motivation as this is a very useful datapoint for selecting apps based off their offerings
3 tables joined
left join
2 subqueries
aggregate function
ordering by multiple fields
*/
SELECT *
from shows inner join season
where season.Number in
(select season.number
from app inner join videoapp inner join season
where app.Name = "Netflix")
and season.Shows IN
(select season.Shows
from app inner join videoapp inner join season
where app.Name = "Netflix")
GROUP by shows.Name
order by shows.Name, season.Video
