-- Drop tables if they exist (for safe re-runs)
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    marks INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert sample departments
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Literature'),
(4, 'Business');

-- Insert sample students
INSERT INTO students (student_id, name, department_id, marks) VALUES
(1, 'Akash', 1, 95),
(2, 'Priya', 2, 81),
(3, 'Meera', NULL, 65),
(4, 'Rahul', 1, 49),
(5, 'Daniel', 3, 73);
