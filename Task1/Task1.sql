
CREATE TABLE books (
	id  IDENTITY(1,1) INT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	author VARCHAR(255) NOT NULL,
	published_year INT NOT NULL,
	available_copies INT  
)


CREATE TABLE members (
	id  IDENTITY(1,1) INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	join_date DATE NOT NULL
)

CREATE TABLE borrowings (
	id  IDENTITY(1,1) INT PRIMARY KEY,
	member_id INT NOT NULL,
	book_id INT NOT NULL,
	borrow_date DATE ,
	return_date DATE
)

INSERT INTO books ( title, author, published_year, available_copies) VALUES
('To Kill a Mockingbird', 'Harper Lee', 1960, 3),
( '1984', 'George Orwell', 1949, 2),
( 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 1),
( 'Pride and Prejudice', 'Jane Austen', 1813, 4),
( 'The Catcher in the Rye', 'J.D. Salinger', 1951, 2);

INSERT INTO members ( name, email, join_date) VALUES
('John Smith', 'john.smith@email.com', '2020-01-15'),
('Emily Johnson', 'emily.j@email.com', '2021-03-22'),
('Michael Brown', 'michael.b@email.com', '2019-11-05'),
('Sarah Davis', 'sarah.d@email.com', '2022-02-18'),
('David Wilson', 'david.w@email.com', '2021-07-30');


INSERT INTO borrowings ( member_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2025-04-10', '2025-06-01'),
(2, 3, '2025-04-15', '2025-07-10'),
(3, 2, '2025-04-01', NULL),
(4, 5, '2025-03-20', NULL),
(5, 4, '2024-08-05', NULL),
(1, 2, '2024-08-10', NULL),
(2, 1, '2024-07-25', '2024-08-15'),
(3, 4, '2023-08-01', NULL),
(4, 3, '2023-07-15', '2023-08-05'),
(5, 5, '2023-08-12', NULL);



SELECT b.title ,m.name
FROM borrowings br
JOIN books b
ON b.id=br.book_id
JOIN members m
ON m.id=br.member_id



SELECT m.name ,COUNT(br.book_id) AS borrowed
FROM borrowings br
JOIN members m
ON m.id=br.member_id
GROUP BY m.name


SELECT b.title ,br.borrow_date
FROM borrowings br
JOIN books b
ON b.id=br.book_id
WHERE br.borrow_date >= DATEADD(DAY,-30,GETDATE())