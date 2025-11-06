-- Procedures Practice --
-- ******************* --

-- Average GPA Procedure --
DELIMITER $$
CREATE PROCEDURE getAverageGpa()
BEGIN
	SELECT AVG(gpa) AS averageGpa
  FROM students;
END $$    
DELIMITER ;

CALL getAverageGpa();

-- Get Student by Id Procedure --
DELIMITER $$
CREATE PROCEDURE getStudentById(IN id_param INT)
BEGIN
	SELECT * 
  FROM students
  WHERE student_id = id_param;
END $$
DELIMITER ;

CALL getStudentById(5);

-- Get Total Students --
DELIMITER $$
CREATE PROCEDURE getTotalStudents(OUT total INT)
BEGIN
	SELECT COUNT(*) INTO total 
  FROM students;
END $$
DELIMITER ;

CALL getTotalStudents(@total);
SELECT @total;

-- Get Top Students --
-- Retrieve students with GPA greater than a specific GPA --
DELIMITER $$
CREATE PROCEDURE getTopStudent(IN minGpa DECIMAL (3,2))
BEGIN
	SELECT name, major, gpa
  FROM students
  WHERE gpa > minGpa;
END $$
DELIMITER ;

CALL getTopStudent(3.5);

-- Update Student Major --
DELIMITER $$
CREATE PROCEDURE updateStudentMajor(IN id_param INT,IN major_param VARCHAR(50))
BEGIN
	UPDATE students
  SET major = major_param
  WHERE student_id = id_param;
END $$
DELIMITER ;

CALL getStudentById(1);
CALL updateStudentMajor(1,'Chemistry');
CALL getStudentById(1);

-- Delete a Student Procedure --
DELIMITER $$
CREATE PROCEDURE deleteStudent(IN id_param INT)
BEGIN
	DELETE FROM students
  WHERE student_id = id_param;
END $$
DELIMITER ;

-- Calculate Average GPA of a Course --
DROP PROCEDURE IF EXISTS averageCourseGpa;
DELIMITER $$
CREATE PROCEDURE averageCourseGpa(IN name_param VARCHAR(50))
BEGIN
	SELECT e.course_name AS Course, AVG(s.gpa) AS AverageGPA
  FROM students s
  JOIN enrollments e USING (student_id)
  GROUP BY e.course_name
  HAVING e.course_name LIKE name_param;
END $$
DELIMITER ;

CALL averageCourseGpa('Introduction to Programming');
