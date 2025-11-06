CREATE DATABASE university;
USE university;
CREATE TABLE students (
	student_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    major VARCHAR(50),
    gpa DECIMAL(3,2)
);
INSERT INTO students (name, age, major) VALUES
('Alice Johnson', 20, 'Computer Science'),
('Bob Smith', 22, 'Mathematics'),
('Charlie Brown', 19, 'History'),
('David Lee', 21, 'Computer Science'),
('Eve Wilson', 23, 'English'),
('Frank Miller', 20, 'Mathematics'),
('Grace Davis', 22, 'History'),
('Henry Garcia', 19, 'Computer Science'),
('Ivy Rodriguez', 21, 'English'),
('Jack Martinez', 23, 'Mathematics'),
('Karen White', 20, 'Computer Science'),
('Liam Green', 22, 'Mathematics'),
('Mia Taylor', 19, 'History'),
('Noah Anderson', 21, 'English'),
('Olivia Thomas', 23, 'Computer Science'),
('Peter Jackson', 20, 'Mathematics'),
('Quinn Moore', 22, 'History'),
('Ryan Martin', 19, 'English'),
('Sophia Thompson', 21, 'Computer Science'),
('Tyler Garcia', 23, 'Mathematics'),
('Ursula Perez', 20, 'Computer Science'),
('Victor Wilson', 22, 'Mathematics'),
('Wendy Sanchez', 19, 'History'),
('Xavier Clark', 21, 'English'),
('Yara Lewis', 23, 'Mathematics'),
('Zachary Young', 20, 'Computer Science'),
('Abigail Allen', 22, 'History'),
('Benjamin Wright', 19, 'English'),
('Caleb King', 21, 'Computer Science'),
('Daniel Scott', 23, 'Mathematics');
UPDATE students
SET gpa = ROUND(RAND() * 4, 2);

CREATE TABLE enrollments (
	enrollments_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    student_id INT,
    course_name VARCHAR(100),
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) 
);

INSERT INTO enrollments (student_id, course_name, enrollment_date) VALUES
(1, 'Introduction to Programming', '2024-09-05'),
(1, 'Calculus I', '2024-09-05'),
(3, 'Linear Algebra', '2024-09-05'),
(5, 'Introduction to Programming', '2024-09-05'),
(7, 'Calculus I', '2024-09-05'),
(9, 'Linear Algebra', '2024-09-05'),
(11, 'Introduction to Programming', '2024-09-05'),
(13, 'Calculus I', '2024-09-05'),
(15, 'Linear Algebra', '2024-09-05'),
(17, 'Introduction to Programming', '2024-09-05'),
(19, 'Calculus I', '2024-09-05'),
(21, 'Linear Algebra', '2024-09-05'),
(23, 'Introduction to Programming', '2024-09-05'),
(25, 'Calculus I', '2024-09-05'),
(27, 'Linear Algebra', '2024-09-05'),
(2, 'Probability and Statistics', '2024-09-05'),
(4, 'Differential Equations', '2024-09-05'),
(6, 'Probability and Statistics', '2024-09-05'),
(8, 'Differential Equations', '2024-09-05'),
(10, 'Probability and Statistics', '2024-09-05'),
(12, 'Differential Equations', '2024-09-05'),
(14, 'Probability and Statistics', '2024-09-05'),
(16, 'Differential Equations', '2024-09-05'),
(20, 'Differential Equations', '2024-09-05'),
(22, 'Probability and Statistics', '2024-09-05'),
(24, 'Differential Equations', '2024-09-05'),
(26, 'Probability and Statistics', '2024-09-05');
