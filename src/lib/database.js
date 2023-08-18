const mysql = require('mysql2');
const { host, user, password, database } = require('../../config/database.json');

class Database {
 pool;

 constructor() {
  this.pool = mysql.createPool({
   host,
   user,
   password,
   database,
   connectionLimit: 10,
  });
 }

 getAllBooks() {
  const sql = 'SELECT * FROM view_books';
  return new Promise((resolve, reject) => {
   this.pool.execute(sql, (err, res) => {
    if (err) {
     reject(err);
    } else {
     resolve(res);
    }
   });
  });
 }

 getBookBy(column, columnValue) {
  const sql = `SELECT * FROM view_books WHERE ${column} = ?`;
  return new Promise((resolve, reject) => {
   this.pool.execute(sql, [columnValue], (err, res) => {
    if (err) {
     reject(err);
    } else {
     resolve(res[0]);
    }
   });
  });
 }

 insertBook(book) {
  const sql = 'INSERT INTO books (title, author, genre_id, price) VALUES (?,?,(SELECT id FROM genres WHERE description = ?),?)';
  return new Promise((resolve, reject) => {
   this.pool.execute(sql, [book.title, book.author, book.genre, book.price], (err, res) => {
    if (err) {
     reject(err);
    } else {
     resolve(res);
    }
   });
  });
 }

 updateBook(id, book) {
  const sql = 'UPDATE books SET title = ?, author = ?, genre_id = (SELECT id FROM genres WHERE description = ?), price = ? WHERE id = ?';
  return new Promise((resolve, reject) => {
   this.pool.execute(sql, [book.title, book.author, book.genre, book.price, id], (err, res) => {
    if (err) {
     reject(err);
    } else {
     resolve(res);
    }
   });
  });
 }

 deleteBook(id) {
  const sql = 'DELETE FROM books WHERE id = ?';
  return new Promise((resolve, reject) => {
   this.pool.execute(sql, [id], (err, res) => {
    if (err) {
     reject(err);
    } else {
     resolve(res);
    }
   });
  });
 }
}

module.exports = Database;
