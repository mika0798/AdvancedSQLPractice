-- Common Queries Practice -- 
-- *********************** --

-- Calculate the number of students per major --
SELECT major AS Major, COUNT(*) AS 'Total Students'
FROM students
GROUP BY major;

-- Calculate average gpa for each major --
SELECT major AS Major, AVG(gpa) AS 'Average GPA'
FROM students
GROUP BY major
ORDER BY AVG(gpa) DESC;

-- Find the course with the highest enrollment --
SELECT e.course_name, COUNT(*) AS Enrollment_Number
FROM students S
JOIN enrollments e USING (student_id)
GROUP BY e.course_name
ORDER BY Enrollment_Number DESC
LIMIT 1;

-- List students who are enrolled in both 'Introduction to Programming' and 'Calculus I' (1) using self-join --
SELECT s.student_id, s.name
FROM students s
JOIN enrollments e1 USING (student_id)
JOIN enrollments e2 USING (student_id)
WHERE e1.course_name LIKE 'Introduction to Programming'
	AND e2.course_name LIKE 'Calculus I';

-- Calculate the average age of students in each course -- 
SELECT e.course_name AS Course, ROUND(AVG(s.age),1) AS Average_Age
FROM students s
JOIN enrollments e USING (student_id)
GROUP BY e.course_name;

-- Find the most common major among students enrolled in 'Linear Algebra' using subquery-- 
SELECT major AS Major, COUNT(*) AS Enrollment_Count
FROM students
WHERE student_id IN (
	SELECT student_id
	FROM enrollments
	WHERE course_name LIKE 'Linear Algebra')
GROUP BY major
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Retrieve a table include student's name, major, gpa and the number of courses they are enrolled in --
SELECT s.name, s.major, s.gpa, COUNT(*) AS course_count
FROM students s
JOIN enrollments e USING (student_id)
GROUP BY s.name, s.major, s.gpa
ORDER BY s.gpa DESC;
