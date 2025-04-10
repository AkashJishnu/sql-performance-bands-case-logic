-- Task 1: Pass/Fail evaluation
SELECT name, marks,
  CASE 
    WHEN marks >= 50 THEN 'Pass'
    ELSE 'Fail'
  END AS result
FROM students;

-- Task 2: Letter grading (A–F)
SELECT name, marks,
  CASE 
    WHEN marks >= 90 THEN 'A'
    WHEN marks BETWEEN 80 AND 89 THEN 'B'
    WHEN marks BETWEEN 70 AND 79 THEN 'C'
    WHEN marks BETWEEN 60 AND 69 THEN 'D'
    ELSE 'F'
  END AS grade
FROM students;

-- Task 3: Department-based labels (JOIN + CASE)
SELECT s.name, d.department_name,
  CASE 
    WHEN d.department_name = 'Computer Science' THEN 'Tech'
    WHEN d.department_name = 'Physics' THEN 'Sci'
    WHEN d.department_name = 'Literature' THEN 'Lit'
    ELSE 'Unassigned'
  END AS dept_label
FROM students s
LEFT JOIN departments d ON s.department_id = d.department_id;

-- Task 4: Performance label (Topper, Performer, Improver)
SELECT name, marks,
  CASE 
    WHEN marks >= 90 THEN 'Topper'
    WHEN marks BETWEEN 70 AND 89 THEN 'Performer'
    ELSE 'Improver'
  END AS performance_label
FROM students
ORDER BY
  CASE 
    WHEN marks >= 90 THEN 1
    WHEN marks BETWEEN 70 AND 89 THEN 2
    ELSE 3
  END;

-- Task 5: Custom ordering using CASE in ORDER BY
SELECT *
FROM (
  SELECT name, marks,
    CASE  
      WHEN marks >= 90 THEN 'Excellent'
      WHEN marks BETWEEN 75 AND 89 THEN 'Good'
      WHEN marks BETWEEN 50 AND 74 THEN 'Average'
      ELSE 'Poor'
    END AS performance
  FROM students
) AS a
ORDER BY 
  CASE 
    WHEN performance = 'Excellent' THEN 1
    WHEN performance = 'Good' THEN 2
    WHEN performance = 'Average' THEN 3
    ELSE 4
  END,
  marks DESC;

-- Task 6: Count students in each performance band (GROUP BY + CASE)
SELECT
  CASE 
    WHEN marks >= 90 THEN 'Excellent'
    WHEN marks BETWEEN 75 AND 89 THEN 'Good'
    WHEN marks BETWEEN 50 AND 74 THEN 'Average'
    ELSE 'Poor'
  END AS performance,
  COUNT(*) AS count
FROM students
GROUP BY
  CASE 
    WHEN marks >= 90 THEN 'Excellent'
    WHEN marks BETWEEN 75 AND 89 THEN 'Good'
    WHEN marks BETWEEN 50 AND 74 THEN 'Average'
    ELSE 'Poor'
  END;

-- Task 7: Multiple CASE expressions in one query
SELECT name, marks,
  CASE 
    WHEN marks >= 90 THEN 'A'
    WHEN marks BETWEEN 80 AND 89 THEN 'B'
    WHEN marks BETWEEN 70 AND 79 THEN 'C'
    WHEN marks BETWEEN 60 AND 69 THEN 'D'
    ELSE 'F'
  END AS grade,
  CASE 
    WHEN marks >= 90 THEN 'Excellent'
    WHEN marks BETWEEN 75 AND 89 THEN 'Good'
    WHEN marks BETWEEN 50 AND 74 THEN 'Average'
    ELSE 'Poor'
  END AS remarks,
  CASE 
    WHEN marks >= 50 THEN 'Pass'
    ELSE 'Fail'
  END AS verdict
FROM students;

-- Task 8: Aggregated conditional counts using SUM(CASE WHEN ...)
SELECT
  SUM(CASE WHEN marks >= 90 THEN 1 ELSE 0 END) AS Excellent,
  SUM(CASE WHEN marks BETWEEN 75 AND 89 THEN 1 ELSE 0 END) AS Good,
  SUM(CASE WHEN marks BETWEEN 50 AND 74 THEN 1 ELSE 0 END) AS Average,
  SUM(CASE WHEN marks < 50 THEN 1 ELSE 0 END) AS Poor
FROM students;

-- Task 9: Nested CASE logic for scholarship assignment
SELECT name, marks, department_name,
  CASE
    WHEN marks >= 90 AND department_name = 'Computer Science' THEN 10000
    WHEN marks >= 90 THEN 5000
    WHEN marks BETWEEN 75 AND 89 THEN 3000
    ELSE 0
  END AS scholarship_amount
FROM students s
JOIN departments d ON s.department_id = d.department_id;
