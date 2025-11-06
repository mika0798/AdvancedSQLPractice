-- Derived Tables --
-- ************** --

-- Find the students with the highest gpa of each course (2) using derived table + JOIN --
SELECT e.course_name, s.name, s.gpa
FROM enrollments e
JOIN students s USING (student_id)
JOIN (
  SELECT e2.course_name, MAX(s2.gpa) AS max_gpa
  FROM enrollments e2
  JOIN students s2 USING (student_id)
  GROUP BY e2.course_name
) m ON e.course_name = m.course_name
WHERE s.gpa = m.max_gpa
ORDER BY e.course_name;
