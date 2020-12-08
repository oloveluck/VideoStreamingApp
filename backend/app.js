const mysql = require('mysql');
const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()

///////////////////////////////////////
///////////////////////////////////////

const connInfo = {
  host: "localhost",
  user: "root",
  password: "",
  database: "project",
};

const PORT = 8080;

app.use(cors());
app.use(bodyParser.urlencoded({extended: true}));

///////////////////////////////////////
///////////////////////////////////////

app.listen(PORT, () => {
  console.log('Listening on port %s', PORT)
});

// Register a new user.
app.post('/register', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      console.log(req.body);
      const params = [req.body['firstName'], req.body['lastName'],
        req.body['email'], req.body['password'], req.body['country']];
      const sql = "INSERT INTO `users` (FirstName, LastName, Email, Password, Country) VALUES (?, ?, ?, Password( ? ), ?);";
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          res.status(200).json({
            msg: `Inserted ${result.affectedRows} rows`
          })
        }
      });
      conn.end()
    }
  });
})

// Subscribe a user to an app
app.post('/subscribe', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      console.log(req.body);
      const params = [req.body['email'], req.body['app']];
      const sql = "INSERT INTO `UserApps` (User, App) VALUES (?, ?);";
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          res.status(200).json({
            msg: `Inserted ${result.affectedRows} rows`
          })
        }
      });
      conn.end()
    }
  })
})

// --Add a show to a users list. username and show name are parameterized.
app.post('/list/add', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      console.log(req.body);
      const params = [req.body['email'], req.body['show']];
      const sql = "INSERT INTO `ShowToWatch` (User, `ShowName`) VALUES (?, ?)";
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          res.status(200).json({
            msg: `Inserted ${result.affectedRows} rows`
          })
        }
      });
      conn.end()
    }
  })
})

//--update an apps version on a platform
app.post('/version', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      console.log(req.body);
      const params = [req.body['version'], req.body['app'],
        req.body['platform']];
      const sql = "UPDATE PlatformApp pa JOIN Platform p ON p.Name = pa.Platform JOIN App a ON a.Name = pa.App SET pa.version = ? WHERE a.Name = ? and p.Name = ?;";
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          res.status(200).json({
            msg: `Inserted ${result.affectedRows} rows`
          })
        }
      });
      conn.end()
    }
  })
})

//-- add a new video. All inputs are parameterized.
app.post('/video/add', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      console.log(req.body);
      const params = [req.body['releaseDate'], req.body['title'],
        req.body['description'], req.body['duration']];
      const sql = "INSERT INTO `video` (ReleaseDate, Title, Description, Duration) VALUES (?, ?, ?, ?);";
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          res.status(200).json({
            msg: `Inserted ${result.affectedRows} rows`
          })
        }
      });
      conn.end()
    }
  })
})

//-- produce a ranked list of the top 10 watched shows corresponding with each app.
app.get('/top-10', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      console.log(req.body);
      const params = [];
      const sql = `SELECT s.Name as showName, v.Platform as platform, SUM(viewsTable.numViews) as views FROM \`show\` s JOIN episode e on s.Name = e.Show JOIN Video v on v.ID = e.Video JOIN (SELECT uw.Video as videoId, COUNT(uw.Video) as numviews FROM userwatched uw where uw.Video GROUP BY videoId) viewsTable on viewsTable.videoId = v.ID GROUP BY s.Name, v.Platform ORDER BY VIEWS DESC`;
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result.slice(0, 10)
          });
        }
      });
      conn.end()
    }
  })
})

// -- find all free videos on a particular platform. Platform is parameterized.
app.get('/free', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [req.body['platform']];
      const sql = `SELECT v.Title as title FROM Video v JOIN VideoApp va ON v.ID = va.Video JOIN App a ON a.Name = va.App WHERE va.Subscription = 0 AND v.Platform = ? ORDER BY title DESC;`;
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          res.status(200).json({
            rows: result
          });
        }
      });
      conn.end()
    }
  })
})

//-- find all long videos that were released this year and aren't part of any show. Long is determined by the user and parameterized.
app.get('/video/released', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [req.body['duration']];
      const sql = `SELECT v.Title as title, v.ReleaseDate as ReleaseDate FROM Video v WHERE v.Duration > ? AND v.ReleaseDate > (curdate() - interval 1 year) AND v.ID NOT IN(SELECT Video FROM episode) ORDER BY title DESC`;
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result
          });
        }
      });
      conn.end()
    }
  })
})

// -- produce a ranked list of revenue generated by apps in a country. No parameters needed.
app.get('/revenue', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [];
      const sql = `SELECT SUM(a.Cost) as revenue, u.Country as country FROM App a join UserApps ua on a.Name = ua.App join Users u on u.email = ua.User GROUP BY country ORDER BY (revenue) DESC;`;
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result
          });
        }
      });
      conn.end()
    }
  })
})

// -- produce a ranked list of watched counts from the top 3 video tags
app.get('/views', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [];
      const sql = `SELECT vt.tagName as Tag, COUNT(*) as watchedCount FROM video v JOIN userwatched uw ON uw.Video = v.ID JOIN videotag vt on vt.Video = v.ID GROUP BY vt.tagName ORDER BY watchedCount DESC;`;
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result.slice(0, 3)
          });
        }
      });
      conn.end()
    }
  })
})

// -- Find the the app available on iOS that has the most videos that user with first name ? and last name ? has watched but does not like
app.get('/worst-app', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [req.body['firstname'], req.body['lastname']];
      const sql = 'select videoapp.App from app inner join platformapp inner join platform inner join videoapp left JOIN (Select wantstowatch.Video as Video from users inner join wantstowatch on users.Email = wantstowatch.User where users.FirstName = ? and users.LastName = ? Except Select userlikes.Video as Video from users inner join userlikes on users.Email = userlikes.User where users.FirstName = ? and users.LastName = ?) as ryans on app.Name = platformapp.App and platformapp.Platform = platform.Name and app.Name = videoapp.Video and videoapp.Video = ryans.Video where platform.Name = "IOS" group by videoapp.App having COUNT(*) = (select max(big.counts) from (SELECT videoapp.App, COUNT(*) as counts from app inner join platformapp inner join platform inner join videoapp left JOIN (Select wantstowatch.Video as Video from users inner join wantstowatch on users.Email = wantstowatch.User where users.FirstName = ? and users.LastName = ? Except Select userlikes.Video as Video from users inner join userlikes " on users.Email = userlikes.User where users.FirstName = ? and users.LastName = ?) as ryans on app.Name = platformapp.App and platformapp.Platform = platform.Name and app.Name = videoapp.Video and videoapp.Video = ryans.Video where platform.Name = "IOS" group by videoapp.App) as big)';
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result.slice(0, 3)
          });
        }
      });
      conn.end()
    }
  })
})

// -- produce a list of users and whether or not they liked a video on a mobile platform. If they did, the title of the video is included
app.get('/liked-mobile', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [];
      const sql = 'SELECT users.FirstName AS fName, users.LastName AS lName, users.Email AS Email, video.Title AS likedMobileVideo \n'
          + 'FROM (((((\n'
          + '    SELECT DISTINCT app.Name AS mobileApp, platform.Name AS mobilePlat\n'
          + '\tFROM (app INNER JOIN platformapp ON app.Name=platformapp.App) INNER JOIN platform ON platformapp.Platform=platform.Name\n'
          + '\tWHERE platform.IsMobile=1\n'
          + '\tORDER BY mobileApp ASC, mobilePlat ASC\n'
          + '    ) as ma INNER JOIN (\n'
          + '        SELECT DISTINCT app.Name AS likeApp\n'
          + '\t\tFROM ((app INNER JOIN videoapp ON app.Name=videoapp.App) INNER JOIN video ON videoapp.Video=video.ID) INNER JOIN userlikes ON video.ID=userlikes.Video\n'
          + '\t\tORDER BY likeApp ASC\n'
          + '        ) as la ON la.likeApp = ma.mobileApp) INNER JOIN videoapp ON la.likeApp=videoapp.App) INNER JOIN video ON video.ID=videoapp.Video) INNER JOIN \n'
          + '        userlikes ON userlikes.Video=video.ID) RIGHT JOIN users ON userlikes.User=users.Email\n'
          + 'GROUP BY likedMobileVideo\n'
          + 'ORDER BY likedMobileVideo DESC;';
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result.slice(0, 3)
          });
        }
      });
      conn.end()
    }
  })
})


// -- produce a list of all videos that people want to watch and are free
app.get('/free-videos', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [];
      const sql = 'SELECT users.Email AS Email, video.Title AS freeToWatch\n'
          + 'FROM (((\n'
          + '    SELECT video.Title AS freeVideo\n'
          + '    FROM video INNER JOIN videoapp ON video.ID=videoapp.Video\n'
          + '    WHERE videoapp.Subscription = 0\n'
          + '    ) AS fv INNER JOIN Video ON fv.freeVideo=video.ID) INNER JOIN wantstowatch ON wantstowatch.Video=video.ID) RIGHT JOIN users ON users.Email=wantstowatch.User\n'
          + 'ORDER BY Email ASC;';
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result.slice(0, 3)
          });
        }
      });
      conn.end()
    }
  })
})


// -- given a video name, produce all videos in its season, or just details on the video if it does not belong to a season
app.get('/season', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [req.body['video']];
      const sql = 'select video.ID, video.ReleaseDate, video.Title as videoTitle, video.Description as videoDescription, shows.Name as showName, shows.Description as showDescription\n'
          + 'from video inner join season inner join shows\n'
          + 'on season.Video = video.ID and season.Shows = shows.Name\n'
          + 'where season.Number IN\n'
          + '(select season.Number\n'
          + 'from video left join season\n'
          + 'on season.Video = video.ID\n'
          + 'where video.Title = ?)\n'
          + 'and season.Shows IN \n'
          + '(select season.Shows\n'
          + 'from video left join season\n'
          + 'on season.Video = video.ID\n'
          + 'where video.Title = ?)\n'
          + 'order by video.ID, video.Title';
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result.slice(0, 3)
          });
        }
      });
      conn.end()
    }
  })
})


// -- list every show that a specific paramaterized app has videos for
app.get('/season', (req, res) => {
  const conn = mysql.createConnection(connInfo);
  conn.connect((err) => {
    if (err) {
      res.status(500).json({"msg": err.sqlMessage})
    } else {
      const params = [req.body['app']];
      const sql = 'SELECT *\n'
          + 'from shows inner join season\n'
          + 'where season.Number in\n'
          + '(select season.number\n'
          + 'from app inner join videoapp inner join season\n'
          + 'where app.Name = ?)\n'
          + 'and season.Shows IN\n'
          + '(select season.Shows\n'
          + 'from app inner join videoapp inner join season\n'
          + 'where app.Name = ?)\n'
          + 'GROUP by shows.Name\n'
          + 'order by shows.Name, season.Video';
      conn.query(sql, params, (err, result, fields) => {
        if (err) {
          console.log(params)
          res.status(200).json({"msg": err.sqlMessage})
        } else {
          // for local testing only
          res.header("Access-Control-Allow-Origin", "*");
          console.log(result);
          res.status(200).json({
            rows: result.slice(0, 3)
          });
        }
      });
      conn.end()
    }
  })
})