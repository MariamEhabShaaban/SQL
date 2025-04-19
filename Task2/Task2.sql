
CREATE TABLE students (
    id IDENTITY(1,1) INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class VARCHAR(50) NOT NULL
);

CREATE TABLE subjects (
    id IDENTITY(1,1) INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE grades (
    id IDENTITY(1,1) INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    grade INT CHECK (grade BETWEEN 0 AND 100),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);


INSERT INTO students ( name, class) VALUES
( 'Alice Johnson', '10A'),
( 'Bob Smith', '10B'),
( 'Charlie Brown', '10A'),
( 'Diana Prince', '10C');


INSERT INTO subjects ( name) VALUES
( 'Mathematics'),
('Physics'),
( 'Arabic'),
('Chemistry');


INSERT INTO grades ( student_id, subject_id, grade) VALUES

( 1, 1, 92), 
( 1, 2, 88),  
( 1, 3, 95),  


( 2, 1, 85),  
( 2, 2, 78), 
( 2, 4, 82), 


( 3, 1, 90),
( 3, 3, 86),  
( 3, 4, 91), 


( 4, 2, 94),  
( 4, 3, 89), 
( 4, 4, 87);  


SELECT s.id, s.name, s.class, ROUND(AVG(g.grade), 2) AS average_grade
FROM students s
JOIN grades g ON s.id = g.student_id
GROUP BY s.id, s.name, s.class

SELECT sub.name AS subject,MAX(g.grade) AS highest_grade,MIN(g.grade) AS lowest_grade
FROM subjects sub
JOIN grades g ON sub.id = g.subject_id
GROUP BY sub.name


SELECT DISTINCT s.id, s.name, s.class
FROM students s
JOIN grades g ON s.id = g.student_id
WHERE g.grade > 85



