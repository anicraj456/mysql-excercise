-- BOOK

CREATE TABLE book (
   book_id INT AUTO_INCREMENT PRIMARY KEY,
   author_id INT,
   title VARCHAR(255),
   isbn INT,
   available BOOL,
   genre_id INT
);

-- Author 

CREATE TABLE author (
   author_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   birthday DATE,
   deathday DATE
);

-- Patron

CREATE TABLE patron (
   patron_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   loan_id INT
);

-- reference books

CREATE TABLE reference_books (
   reference_id INT AUTO_INCREMENT PRIMARY KEY,
   edition INT,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

INSERT INTO reference_books(edition, book_id)
VALUE (5,32);

-- Genre 

CREATE TABLE genre (
   genre_id INT PRIMARY KEY,
   genres VARCHAR(100)
);

-- loan 

CREATE TABLE loan (
   loan_id INT AUTO_INCREMENT PRIMARY KEY,
   patron_id INT,
   date_out DATE,
   date_in DATE,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

-- mystery 

SELECT title, isbn FROM book
WHERE genre_id = 6;

-- living authors

SELECT book.title, author.first_name, author.last_name
FROM book
INNER JOIN author ON book.author_id = author.author_id
WHERE author.deathday IS null;

-- Loan Out a Book

SET @book_loaned=16,@patron=22;
UPDATE book
SET available=0
WHERE book_id=@book_loaned;
INSERT INTO loan(date_out,patron_id,book_id)
VALUES(CURRENT_DATE(),18,@book_loaned);
UPDATE patron
SET loan_id=(
   SELECT loan_id FROM loan
   WHERE (patron_id=18) AND (date_out = CURRENT_DATE())
   )
   WHERE patron_id = 18;
   
-- Check a Book Back In

SET @returned_book_id=3;
SET @book_loan_id=(
SELECT loan_id FROM loan
WHERE (book_id = @returned_book_id) AND (date_in IS null)
);
UPDATE book
SET available=1
WHERE book_id = @returned_book_id;
UPDATE loan
SET date_in=CURRENT_DATE()
WHERE loan_id =@book_loan_id;
UPDATE patron
SET loan_id = null
WHERE patron_id = @returning_patron_id;

-- wrap up

SELECT patron.first_name,patron.last_name,genre.genres
FROM patron
INNER JOIN loan ON patron.loan_id = loan.loan_id
INNER JOIN book ON book.book_id = loan.book_id
INNER JOIN genre ON book.genre_id = genre.genre_id
WHERE loan.date_in IS null;

-- Bonus

SELECT genre.genres,COUNT(*)
FROM genre INNER JOIN book
ON genre.genre_id = book.genre_id
GROUP BY genre.genres
ORDER BY genre.genres;

UPDATE book
SET available = CASE
  WHEN genre_id =25 THEN 0
  ELSE available
  END
WHERE book_id > 0;



