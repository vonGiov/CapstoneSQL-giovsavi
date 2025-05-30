/*
Task2
Project: Student Database Management System(PostgreSQL)
Objective: Design and implement a student database management system using PostgreSQL
that allows storing and retrieving student information efficiently. The project will include the
following tasks:


1. Database Setup
Create a database named "student_database."
*/

CREATE DATABASE student_database;

/*
Create a table called " student_table " with the following columns: Student_id (integer),
Stu_name (text), Department (text), email_id (text ),Phone_no (numeric), Address (text),
Date_of_birth (date), Gender (text), Major (text), GPA (numeric),Grade (text) should be A,B,C
etc.
*/



CREATE TABLE student_table (
    Student_id INTEGER PRIMARY KEY,
    Stu_name TEXT NOT NULL,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT CHECK (Gender IN ('Male', 'Female', 'Other')),
    Major TEXT,
    GPA NUMERIC(4, 2) CHECK (GPA BETWEEN 0 AND 10),
    Grade TEXT CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);

-- 2. Data Entry
-- Insert 10 sample records into the "student_table" using INSERT command.


INSERT INTO student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
(1, 'Alice Johnson', 'Science', 'alice.johnson@example.com', 1234567890, '123 Maple St', '2002-04-12', 'Female', 'Biology', 9.2, 'A'),
(2, 'Bob Smith', 'Engineering', 'bob.smith@example.com', 2345678901, '456 Oak Ave', '2001-06-23', 'Male', 'Mechanical', 4.8, 'C'),
(3, 'Charlie Lee', 'Arts', 'charlie.lee@example.com', 3456789012, '789 Pine Rd', '2003-02-15', 'Male', 'History', 3.5, 'D'),
(4, 'Diana Ross', 'Science', 'diana.ross@example.com', 4567890123, '321 Elm Blvd', '2000-11-30', 'Female', 'Chemistry', 9.7, 'A'),
(5, 'Ethan Brown', 'Engineering', 'ethan.brown@example.com', 5678901234, '654 Cedar St', '2002-06-10', 'Male', 'Electrical', 5.9, 'C'),
(6, 'Fiona Davis', 'Business', 'fiona.davis@example.com', 6789012345, '987 Spruce Ln', '2001-09-05', 'Female', 'Marketing', 6.8, 'B'),
(7, 'George Miller', 'Business', 'george.miller@example.com', 7890123456, '741 Birch Way', '2000-01-20', 'Male', 'Finance', 4.2, 'D'),
(8, 'Hannah Wilson', 'Arts', 'hannah.wilson@example.com', 8901234567, '852 Willow Dr', '2002-10-15', 'Female', 'Literature', 7.5, 'B'),
(9, 'Ian Clark', 'Science', 'ian.clark@example.com', 9012345678, '963 Fir Ct', '2003-03-25', 'Male', 'Physics', 2.9, 'F'),
(10, 'Jenna Taylor', 'Engineering', 'jenna.taylor@example.com', 1122334455, '159 Redwood Blvd', '2001-08-19', 'Female', 'Civil', 8.1, 'A');


-- 3. Student Information Retrieval
-- Develop a query to retrieve all students' information from the "student_table" and sort them in descending order by their grade

SELECT *
FROM student_table
ORDER BY Grade DESC;


-- 4. Query for Male Students:
-- Implement a query to retrieve information about all male students from the "student_table."

SELECT *
FROM student_table
WHERE Gender = 'Male';


-- 5. Query for Students with GPA less than 5.0
-- Create a query to fetch the details of students who have a GPA less than 5.0 from the "student_table."

SELECT *
FROM student_table
WHERE GPA < 5.0;


-- 6. Update Student Email and Grade
-- Write an update statement to modify the email and grade of a student with a specific ID in the "student_table."

UPDATE student_table
SET 
    email_id = 'new.email@example.com',
    Grade = 'B'
WHERE 
    Student_id = 3;

SELECT *
FROM student_table
WHERE
    Student_id = 3;

-- 7. Query for Students with Grade "B"
-- Develop a query to retrieve the names and ages of all students who have a grade of "B" from the "student_table."

SELECT 
    Stu_name,
    DATE_PART('year', AGE(Date_of_birth)) AS Age
FROM 
    student_table
WHERE 
    Grade = 'B';


-- 8. Grouping and Calculation
-- Create a query to group the "student_table" by the "Department" and "Gender" columns and calculate the average GPA for each combination.

SELECT 
    Department,
    Gender,
    ROUND(AVG(GPA), 2) AS Average_GPA
FROM 
    student_table
GROUP BY 
    Department,
    Gender;


-- 9. Table Renaming
-- Rename the "student_table" to "student_info" using the appropriate SQL statement.

ALTER TABLE student_table
RENAME TO student_info;



-- 10. Retrieve Student with Highest GPA
-- Write a query to retrieve the name of the student with the highest GPA from the "student_info" table.

SELECT 
    Stu_name,
    GPA
FROM 
    student_info
ORDER BY 
    GPA DESC
LIMIT 1;





