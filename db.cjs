const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Edu200212!',
    database: 'db_ticket',
});

module.exports = connection;