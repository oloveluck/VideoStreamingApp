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

A list of users and whether or not they liked a video on a mobile platform. If they did, the title of the video is included.