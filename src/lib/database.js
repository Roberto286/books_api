const mysql = require('mysql2');
const { host, user, password, database } = require('../../config/database.json');

class Database {
 pool;

 constructor() {
  this.pool = mysql.createPool({
   host: host,
   user: user,
   password: password,
   database: database,
   waitForConnections: true,
   connectionLimit: 10,
   maxIdle: 10,
   idleTimeout: 60000,
   queueLimit: 0,
   enableKeepAlive: true,
   keepAliveInitialDelay: 0,
  });
 }

 getAllBooks(callback_success, callback_error) {
  const sql = 'SELECT * FROM view_books';
  this.pool.execute(sql, (err, res) => {
   if (err) {
    callback_error(err);
   } else {
    callback_success(res);
   }
  });
 }

 getBookBy(column, columnValue, callback_success, callback_error) {
  const sql = `SELECT * FROM view_books WHERE ${column} = ?`;
  this.pool.execute(sql, [columnValue], (err, res) => {
   if (err) {
    callback_error(err);
   } else {
    callback_success(res[0]);
   }
  });
 }

 insertBook(book, callback_success, callback_error) {
  const sql = 'INSERT INTO books (title, author, genre_id, price) VALUES (?,?,(SELECT id FROM genres WHERE description = ?),?)';

  this.pool.execute(sql, [book.title, book.author, book.genre, book.price], (err, res) => {
   if (err) {
    callback_error(err);
   } else {
    callback_success(res);
   }
  });
 }
}
module.exports = Database;
