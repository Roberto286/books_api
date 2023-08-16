USE mysql;

DROP DATABASE IF EXISTS books_api;

CREATE DATABASE books_api;

USE books_api;

CREATE TABLE
    genres (
        id INT AUTO_INCREMENT PRIMARY KEY,
        description VARCHAR(255)
    );

CREATE TABLE
    books (
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        author VARCHAR(255) NOT NULL,
        genre_id INT,
        price DECIMAL(6, 2),
        UNIQUE KEY title_author (title, author),
        FOREIGN KEY (genre_id) REFERENCES genres(id)
    );

CREATE VIEW view_books AS
SELECT
    b.id,
    b.title,
    b.author,
    b.price,
    g.description as genre
FROM books b
    INNER JOIN genres g ON b.genre_id = g.id;

INSERT INTO
    genres (description)
VALUES ('crime'), ('comedy'), ('fantasy'), ('romantic'), ('kids'), ('science'), ('action'), ('mystery'), ('horror'), ('thriller'), ('historical');

INSERT INTO
    books (title, author, genre_id, price)
VALUES (
        'The Mystery of the Yellow Lake',
        'Chris Rock',
        7,
        19.99
    ), (
        'To Kill a Mockingbird',
        'Harper Lee',
        11,
        14.99
    ), (
        'Harry Potter and the Sorcerer\'s Stone',
        'J.K. Rowling',
        3,
        24.99
    ), (
        'Pride and Prejudice',
        'Jane Austen',
        4,
        12.99
    ), (
        'The Hobbit',
        'J.R.R. Tolkien',
        3,
        18.99
    ), (
        '1984',
        'George Orwell',
        6,
        15.99
    ), (
        'The Da Vinci Code',
        'Dan Brown',
        8,
        20.99
    ), (
        'The Great Gatsby',
        'F. Scott Fitzgerald',
        4,
        13.99
    ), (
        'Brave New World',
        'Aldous Huxley',
        6,
        16.99
    ), (
        'The Catcher in the Rye',
        'J.D. Salinger',
        7,
        14.99
    ), (
        'The Lord of the Rings',
        'J.R.R. Tolkien',
        3,
        22.99
    ), (
        'Jane Eyre',
        'Charlotte Brontë',
        4,
        11.99
    ), (
        'The Chronicles of Narnia',
        'C.S. Lewis',
        3,
        19.99
    ), (
        'The Alchemist',
        'Paulo Coelho',
        5,
        17.99
    ), (
        'Gone with the Wind',
        'Margaret Mitchell',
        4,
        15.99
    ), (
        'The Hunger Games',
        'Suzanne Collins',
        7,
        14.99
    ), (
        'The Shining',
        'Stephen King',
        8,
        18.99
    ), (
        'The Kite Runner',
        'Khaled Hosseini',
        9,
        16.99
    ), (
        'Frankenstein',
        'Mary Shelley',
        10,
        12.99
    ), (
        'One Hundred Years of Solitude',
        'Gabriel García Márquez',
        6,
        20.99
    ), (
        'Fahrenheit 451',
        'Ray Bradbury',
        6,
        14.99
    ), (
        'Lord of the Flies',
        'William Golding',
        7,
        13.99
    ), (
        'Moby-Dick',
        'Herman Melville',
        11,
        17.99
    ), (
        'The Handmaid\'s Tale',
        'Margaret Atwood',
        7,
        15.99
    ), (
        'The Picture of Dorian Gray',
        'Oscar Wilde',
        4,
        13.99
    ), (
        'A Tale of Two Cities',
        'Charles Dickens',
        4,
        11.99
    ), (
        'Dracula',
        'Bram Stoker',
        10,
        16.99
    ), (
        'War and Peace',
        'Leo Tolstoy',
        11,
        22.99
    ), (
        'The Fault in Our Stars',
        'John Green',
        9,
        14.99
    ), (
        'The Road',
        'Cormac McCarthy',
        8,
        15.99
    ), (
        'The Color Purple',
        'Alice Walker',
        4,
        13.99
    ), (
        'The Giver',
        'Lois Lowry',
        5,
        12.99
    ), (
        'The Grapes of Wrath',
        'John Steinbeck',
        7,
        18.99
    ), (
        'A Clockwork Orange',
        'Anthony Burgess',
        6,
        16.99
    ), (
        'Wuthering Heights',
        'Emily Brontë',
        4,
        14.99
    ), (
        'The Outsiders',
        'S.E. Hinton',
        9,
        11.99
    ), (
        'Great Expectations',
        'Charles Dickens',
        4,
        13.99
    ), (
        'The Sun Also Rises',
        'Ernest Hemingway',
        4,
        15.99
    ), (
        'Catch-22',
        'Joseph Heller',
        6,
        14.99
    ), (
        'The Prince',
        'Niccolò Machiavelli',
        11,
        10.99
    ), (
        'The Old Man and the Sea',
        'Ernest Hemingway',
        7,
        12.99
    ), (
        'Don Quixote',
        'Miguel de Cervantes',
        11,
        20.99
    ), (
        'A Game of Thrones',
        'George R.R. Martin',
        3,
        22.99
    ), (
        'The Jungle Book',
        'Rudyard Kipling',
        5,
        11.99
    ), (
        'The Sound and the Fury',
        'William Faulkner',
        6,
        15.99
    ), (
        'The Divine Comedy',
        'Dante Alighieri',
        11,
        18.99
    ), (
        'The Odyssey',
        'Homer',
        11,
        17.99
    ), (
        'The Count of Monte Cristo',
        'Alexandre Dumas',
        11,
        16.99
    ), ('The Iliad', 'Homer', 11, 15.99), (
        'Crime and Punishment',
        'Fyodor Dostoevsky',
        10,
        14.99
    ), (
        'Les Misérables',
        'Victor Hugo',
        11,
        19.99
    ), (
        'The Scarlet Letter',
        'Nathaniel Hawthorne',
        4,
        12.99
    ), (
        'The Little Prince',
        'Antoine de Saint-Exupéry',
        5,
        10.99
    ), (
        'A Christmas Carol',
        'Charles Dickens',
        4,
        9.99
    ), (
        'The Raven',
        'Edgar Allan Poe',
        10,
        8.99
    ), (
        'The Adventures of Huckleberry Finn',
        'Mark Twain',
        7,
        16.99
    ), (
        'Alice\'s Adventures in Wonderland',
        'Lewis Carroll',
        5,
        14.99
    ), (
        'The War of the Worlds',
        'H.G. Wells',
        6,
        11.99
    ), (
        'Dr. Jekyll and Mr. Hyde',
        'Robert Louis Stevenson',
        10,
        13.99
    ), (
        'The Wind in the Willows',
        'Kenneth Grahame',
        5,
        12.99
    ), (
        'Around the World in Eighty Days',
        'Jules Verne',
        11,
        17.99
    ), (
        'Treasure Island',
        'Robert Louis Stevenson',
        11,
        14.99
    ), (
        'The Time Machine',
        'H.G. Wells',
        6,
        16.99
    ), (
        'The Adventures of Sherlock Holmes',
        'Arthur Conan Doyle',
        8,
        15.99
    ), (
        'Anne of Green Gables',
        'L.M. Montgomery',
        4,
        12.99
    ), (
        'Aesop\'s Fables',
        'Aesop',
        11,
        10.99
    ), (
        'Little Women',
        'Louisa May Alcott',
        4,
        13.99
    ), (
        'Peter Pan',
        'J.M. Barrie',
        5,
        11.99
    ), (
        'The Call of the Wild',
        'Jack London',
        7,
        14.99
    ), (
        'The Three Musketeers',
        'Alexandre Dumas',
        11,
        16.99
    ), (
        'Romeo and Juliet',
        'William Shakespeare',
        4,
        9.99
    ), (
        'Macbeth',
        'William Shakespeare',
        4,
        10.99
    );