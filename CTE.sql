-- Common Table Expressions (CTEs) --
-- ******************************* --

-- Find majors with number of students less than 8 --
WITH student_count AS (
	SELECT major AS Major, COUNT(student_id) AS Student_Count
  FROM students
  GROUP BY major
) 
SELECT Major, Student_Count
FROM student_count
WHERE Student_Count < 8;
