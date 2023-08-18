const helmet = require('helmet');
const { port } = require('../config/server');
const app = require('express')();
const Database = require('./lib/database');
const Error = require('./lib/error');
const bodyParser = require('body-parser');

const database = new Database();

app.use(helmet());

app.use(bodyParser.json());

// CREATE
app.post('/books', (req, res, next) => {
 if (!req.body) {
  return next(new Error(400, 'You need to provide a valid book'));
 }

 const newBook = req.body;
 database
  .insertBook(newBook)
  .then(() => {
   res.send(newBook);
  })
  .catch((error) => {
   console.log(error);
   next(new Error(500, 'Error while creating new book'));
  });
});

// READ
app.get('/books', (req, res, next) => {
 database
  .getAllBooks()
  .then((books) => {
   res.send(books);
  })
  .catch((error) => {
   console.log(error);
   next(new Error(500, 'Error while retrieving all books'));
  });
});

app.get('/books/:id', (req, res, next) => {
 const id = req.params.id;

 database
  .getBookBy('id', id)
  .then((book) => {
   if (book) {
    res.send(book);
   } else {
    next(new Error(404, `Book with id ${id} not found`));
   }
  })
  .catch((error) => {
   console.log(error);
   next(new Error(500, `Error while retrieving book with id ${id}`));
  });
});

// UPDATE
app.put('/books/:id', (req, res, next) => {
 if (!req.body) {
  next(new Error(400, 'You need to provide a valid book'));
 }

 const id = req.params.id;
 const updatedBook = req.body;

 database
  .updateBook(id, updatedBook)
  .then(() => {
   res.send(updatedBook);
  })
  .catch((error) => {
   console.log(error);
   next(new Error(500, `Error while updating book ${id}`));
  });
});

// DELETE
app.delete('/books/:id', (req, res, next) => {
 const id = req.params.id;

 database
  .deleteBook(id)
  .then(() => {
   res.send();
  })
  .catch((error) => {
   console.log(error);
   next(new Error(500, `Error while deleting book with id ${id}`));
  });
});

// ERROR HANDLING MIDDLEWARE
app.use((err, req, res, next) => {
 res.status(err.status || 500).send(err.message || 'Internal Server Error');
});

app.listen(port, () => {
 console.log(`app listening on ${port}`);
});
