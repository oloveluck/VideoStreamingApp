import mysql from 'mysql'

const connect = async () => {
    let db = await mysql.createConnection({
        host : 'localhost',
        user : 'root', 
        password : null, 
        database : 'chinook'
    }) 
    console.log('CREATED CONNECTION');
    await db.connect();
    console.log('Connected');
    db.query('SELECT * from Track', (err, rows) => {
        if (err) throw err;
        console.log(rows);
    });
}

export default connect;
