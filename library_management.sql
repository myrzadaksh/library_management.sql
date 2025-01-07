CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    publication_year INT,
    genre VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Authors (author_id, name, birth_year) 
VALUES 
(1, 'George Orwell', 1903),
(2, 'J.K. Rowling', 1965),
(3, 'Harper Lee', 1926);

INSERT INTO Books (book_id, title, author_id, publication_year, genre) 
VALUES 
(1, '1984', 1, 1949, 'Dystopian'),
(2, 'Animal Farm', 1, 1945, 'Political Satire'),
(3, 'Harry Potter and the Sorcerer\'s Stone', 2, 1997, 'Fantasy'),
(4, 'To Kill a Mockingbird', 3, 1960, 'Fiction');

-- Query to retrieve all books and their authors
SELECT 
    Books.title, 
    Authors.name AS author, 
    Books.publication_year, 
    Books.genre
FROM Books
JOIN Authors ON Books.author_id = Authors.author_id;

-- Query to find books published after 1950
SELECT 
    title, 
    publication_year 
FROM Books 
WHERE publication_year > 1950;

-- Query to find authors born before 1930
SELECT 
    name 
FROM Authors 
WHERE birth_year < 1930;
