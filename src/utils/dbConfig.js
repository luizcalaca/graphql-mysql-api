const mysql = require('mysql2/promise');

const dbConfig = {
    host:'127.0.0.1',
    port: '3306',
    user: 'calaca',
    password: 'calaca',
    database: 'mydatabase',
};

const connection = await mysql.createConnection(dbConfig);

module.exports = connection;

