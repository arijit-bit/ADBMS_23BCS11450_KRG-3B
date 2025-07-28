-- Problem Title: Author-Book Relationship Using Joins and Basic SQL Operations
--/Design two tables — one for storing author details and the other for book details.
--/Ensure a foreign key relationship from the book to its respective author.Insert at 
--/least three records in each table.
--/Perform an INNER JOIN to link each book with its author using the common author ID.
--/Select the book title, author name, and author’s country.
--/Sample Output Description:
--/When the join is performed, we get a list where each book title is shown along with
--/s author’s name and their country.

-- Create table for authors
CREATE TABLE AuthorDetails (
    auth_id INT PRIMARY KEY,
    auth_name VARCHAR(100),
    auth_country VARCHAR(100)
);

-- Create table for books
CREATE TABLE BookDetails (
    bk_id INT PRIMARY KEY,
    bk_title VARCHAR(150),
    auth_id INT,
    FOREIGN KEY (auth_id) REFERENCES AuthorDetails(auth_id)
);

-- Insert records into AuthorDetails
INSERT INTO AuthorDetails (auth_id, auth_name, auth_country) VALUES
(10, 'John Smith', 'UK'),
(11, 'Emily Brown', 'USA'),
(12, 'Raj Mehta', 'India');

-- Insert records into BookDetails
INSERT INTO BookDetails (bk_id, bk_title, auth_id) VALUES
(201, 'Ocean Tales', 10),
(202, 'Sky Adventures', 11),
(203, 'Desert Secrets', 12);

-- Perform INNER JOIN to display required data
SELECT 
    BD.bk_title AS Book_Title,
    AD.auth_name AS Author_Name,
    AD.auth_country AS Author_Country
FROM 
    BookDetails BD
INNER JOIN 
    AuthorDetails AD ON BD.auth_id = AD.auth_id;
