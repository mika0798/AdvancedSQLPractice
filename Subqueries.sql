-- Subqueries Practice -- 
-- ******************* --

-- Find students who enrolled in at least one course (1) --
SELECT DISTINCT s.name
FROM students s
JOIN enrollments e
	ON s.student_id = e.student_id;
    
-- Find students who enrolled in at least one course (2) --
SELECT name
FROM students
WHERE student_id IN (
	SELECT student_id
  FROM enrollments
);

-- List students who are enrolled in both 'Introduction to Programming' and 'Calculus I' (2) using subquery + IN --
SELECT name AS Name, gpa AS GPA
FROM students
WHERE student_id IN (
	SELECT student_id
  FROM enrollments
  WHERE course_name LIKE 'Introduction to Programming'
)
AND student_id IN (
	SELECT student_id
  FROM enrollments
  WHERE course_name LIKE 'Calculus I'
);

-- Find the students with the highest gpa of each course (1) using subquery + self-join --
SELECT e.course_name AS Course, s.name AS Name, s.gpa AS GPA
FROM students s
JOIN enrollments e
	ON s.student_id = e.student_id
WHERE s.gpa = (
	SELECT MAX(s2.gpa)
  FROM students s2
  JOIN enrollments e2
	ON s2.student_id = e2.student_id
	WHERE e.course_name = e2.course_name
)
ORDER BY GPA DESC;
