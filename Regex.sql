-- Regex Practice --
-- ************** --

-- Find students name starts with 'A'--
SELECT *
FROM students
WHERE name LIKE 'A%';

SELECT * 
FROM students
WHERE name REGEXP '^A';

-- Find students name ends with 'n' --
SELECT * 
FROM students
WHERE name REGEXP 'n$';

SELECT *
FROM students
WHERE name LIKE '%n';

-- Find students with major name includes 'Science' or 'Math'
SELECT *
FROM students
WHERE major REGEXP 'Science|Math';

-- Find students with major name has exactly two words --
SELECT * 
FROM students
WHERE major REGEXP '^[A-Za-z]+ [A-Za-z]+$';

-- Find students with first name starts by a vowel --
SELECT *
FROM students
WHERE name REGEXP '^[AEIOUaeiou]';

-- Find students with last name starts by a vowel -
SELECT name AS full_name, SUBSTRING_INDEX(name, ' ', -1) AS last_name
FROM students
WHERE SUBSTRING_INDEX(name, ' ', -1) REGEXP '^[AEIOUaeiou]';
