-- Window Functions --
-- **************** --

-- Assign rank to students based on GPA --
SELECT name AS Name, gpa AS GPA, ROW_NUMBER() OVER (ORDER BY gpa DESC) AS 'Rank'
FROM students;

 -- Rank students in each major by their GPA --
SELECT student_id, name, major, gpa,
		RANK() OVER (PARTITION BY major ORDER BY gpa DESC) AS rank_in_major
FROM students
ORDER BY major, rank_in_major;

-- Find the students with the highest gpa of each course (3) using derived table + window function --
SELECT course_name, name, gpa
FROM (
  SELECT e.course_name, s.name, s.gpa,
         ROW_NUMBER() OVER (PARTITION BY e.course_name ORDER BY s.gpa DESC) AS rnk
  FROM enrollments e
  JOIN students s USING (student_id)
) t
WHERE rnk = 1
ORDER BY gpa DESC;
