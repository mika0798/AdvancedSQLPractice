-- Control Flow in Procedures Practice --
-- *********************************** --

-- Check GPA Procedure --
DELIMITER $$
CREATE PROCEDURE checkGpa(IN student_id_prm INT, OUT status VARCHAR(20))
BEGIN
	DECLARE gpa_value DECIMAL (3,2);
    
  SELECT gpa INTO gpa_value
  FROM students
  WHERE student_id = student_id_prm;
    
  IF gpa_value >= 3.5 THEN
		SET status = 'Excellent';
	ELSEIF gpa_value >= 2.0 THEN
		SET status = 'Good';
	ELSE 
		SET status = 'Incompetent';
	END IF;
END $$
DELIMITER ;

CALL checkGpa(18,@status);
SELECT @status;
