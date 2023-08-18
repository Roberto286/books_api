const helmet = require('helmet');
const { port } = require('../config/server');
const app = require('express')();
const Database = require('./lib/database');
const Error = require('./lib/error');
const bodyParser = require('body-parser');

const database = new Database();

app.use(helmet());

app.use(bodyParser.json());

//CREATE
app.post('/books', (req, res, next) => {
 if (!req._body) {
  return next(new Error(400, 'You need to provide a valide book'));
 }
 const newBook = req.body;
 database.insertBook(
  newBook,
  () => {
   res.send(newBook);
  },
  (error) => {
   console.log(error);
   next(new Error(500, 'Error while creating new book'));
  }
 );
});
//READ
app.get('/books', (req, res, next) => {
 database.getAllBooks(
  (books) => {
   res.send(books);
  },
  (error) => {
   console.log(error);
   next(new Error(500, 'Error while retrieving all books'));
  }
 );
});

app.get('/books/:id', (req, res, next) => {
 const id = req.params.id;

 database.getBookBy(
  'id',
  id,
  (book) => {
   if (book) {
    res.send(book);
   } else {
    next(new Error(404, `Book with id ${id} not found`));
   }
  },
  (err) => {
   console.log(err);
   next(new Error(500, `error while retrieving book with id ${id}`));
  }
 );
});

//UPDATE

//DELETE

//MIDDLEWARE
app.use((err, req, res, next) => {
 res.status(err.status).send(err.message);
});

app.listen(port, () => {
 console.log(`app listening on ${port}`);
});
