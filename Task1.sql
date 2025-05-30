/*
Task1
Project Title: Academic Management System ( using SQL)

Project Description:
Design and develop an Academic Management System using SQL. The projects should involve
three tables 1.StudentInfo 2. CoursesInfo 3.EnrollmentInfo. The Aim is to create a system that
allows for managing student information and course enrollment. The project will include the
following tasks:

1. Database Creation:

a) Create the StudentInfo table with columns STU_ ID, STU_NAME, DOB, PHONE_NO,
EMAIL_ID,ADDRESS.

b) Create the CoursesInfo table with columns COURSE_ID,
COURSE_NAME,COURSE_INSTRUCTOR NAME.

c) Create the EnrollmentInfo with columns ENROLLMENT_ID, STU_ ID, COURSE_ID,
ENROLL_STATUS(Enrolled/Not Enrolled). The FOREIGN KEY constraint in the EnrollmentInfo
table references the STU_ID column in the StudentInfo table and the COURSE_ID column in the
CoursesInfo table.


2. Data Creation:
Insert some sample data for StudentInfo table , CoursesInfo table, EnrollmentInfo with
respective fields.
*/






CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(100),
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(100),
    ADDRESS VARCHAR(255)
);


CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(100),
    COURSE_INSTRUCTOR_NAME VARCHAR(100)
);

CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20) CHECK (ENROLL_STATUS IN ('Enrolled', 'Not Enrolled')),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);




INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES
(1, 'Alice Johnson', '2002-04-12', '1234567890', 'alice@example.com', '123 Apple St'),
(2, 'Bob Smith', '2001-07-23', '0987654321', 'bob@example.com', '456 Banana Ave'),
(3, 'Charlie Lee', '2003-02-15', '5551234567', 'charlie@example.com', '789 Cherry Blvd'),
(4, 'Diana Ross', '2000-11-30', '3216549870', 'diana@example.com', '101 Orange Dr'),
(5, 'Ethan Brown', '2002-06-10', '9876543210', 'ethan@example.com', '202 Grape Ln'),
(6, 'Fiona Davis', '2001-09-05', '6667778888', 'fiona@example.com', '301 Peach Ct'),
(7, 'George Miller', '2000-01-20', '7778889999', 'george@example.com', '402 Plum Blvd'),
(8, 'Hannah Wilson', '2002-10-15', '8889990000', 'hannah@example.com', '503 Kiwi Rd'),
(9, 'Ian Clark', '2003-03-25', '9990001111', 'ian@example.com', '604 Mango St'),
(10, 'Jenna Taylor', '2001-08-19', '1112223333', 'jenna@example.com', '705 Berry Way'),
(11, 'Kevin Harris', '2000-12-30', '2223334444', 'kevin@example.com', '806 Lemon Ln'),
(12, 'Laura Martinez', '2002-05-12', '3334445555', 'laura@example.com', '907 Coconut Dr'),
(13, 'Mark Allen', '2003-01-05', '4445556666', 'mark@example.com', '1008 Lime Cir'),
(14, 'Nina Evans', '2001-03-15', '5556667777', 'nina@example.com', '1109 Papaya Sq'),
(15, 'Oscar Green', '2002-07-22', '6667778889', 'oscar@example.com', '1210 Nectarine Blvd'),
(16, 'Paula Hill', '2000-11-11', '7778889990', 'paula@example.com', '1311 Guava St'),
(17, 'Quentin Young', '2001-04-04', '8889990001', 'quentin@example.com', '1412 Fig Ln'),
(18, 'Rachel Adams', '2002-02-18', '9990001112', 'rachel@example.com', '1513 Raisin Rd'),
(19, 'Steve Brooks', '2003-06-30', '1112223334', 'steve@example.com', '1614 Chestnut Ct'),
(20, 'Tina Carter', '2001-01-09', '2223334445', 'tina@example.com', '1715 Walnut Ave');



INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
(101, 'Mathematics', 'Dr. Alan Turing'),
(102, 'Physics', 'Dr. Marie Curie'),
(103, 'Computer Science', 'Dr. Ada Lovelace'),
(104, 'Chemistry', 'Dr. Dmitri Mendeleev'),
(105, 'English Literature', 'Prof. William Shakespeare'),
(106, 'History', 'Dr. Howard Zinn'),
(107, 'Biology', 'Dr. Charles Darwin'),
(108, 'Art', 'Prof. Leonardo da Vinci'),
(109, 'Economics', 'Dr. Adam Smith'),
(110, 'Philosophy', 'Prof. Socrates');



INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES
(1, 1, 101, 'Enrolled'), (2, 1, 103, 'Enrolled'),
(3, 2, 102, 'Enrolled'), (4, 2, 104, 'Enrolled'),
(5, 3, 101, 'Enrolled'), (6, 3, 105, 'Not Enrolled'),
(7, 4, 103, 'Enrolled'), (8, 4, 106, 'Enrolled'),
(9, 5, 102, 'Enrolled'), (10, 5, 107, 'Enrolled'),
(11, 6, 104, 'Enrolled'), (12, 6, 108, 'Enrolled'),
(13, 7, 105, 'Enrolled'), (14, 7, 109, 'Enrolled'),
(15, 8, 106, 'Enrolled'), (16, 8, 110, 'Enrolled'),
(17, 9, 101, 'Enrolled'), (18, 9, 107, 'Not Enrolled'),
(19, 10, 102, 'Enrolled'), (20, 10, 108, 'Enrolled'),
(21, 11, 103, 'Enrolled'), (22, 11, 109, 'Enrolled'),
(23, 12, 104, 'Enrolled'), (24, 12, 110, 'Enrolled'),
(25, 13, 105, 'Enrolled'), (26, 13, 106, 'Not Enrolled'),
(27, 14, 101, 'Enrolled'), (28, 14, 102, 'Not Enrolled'),
(29, 15, 103, 'Enrolled'), (30, 15, 104, 'Not Enrolled'),
(31, 16, 105, 'Enrolled'), (32, 16, 106, 'Enrolled'),
(33, 17, 107, 'Enrolled'), (34, 17, 108, 'Enrolled'),
(35, 18, 109, 'Enrolled'), (36, 18, 110, 'Enrolled'),
(37, 19, 101, 'Enrolled'), (38, 19, 103, 'Not Enrolled'),
(39, 20, 102, 'Enrolled'), (40, 20, 104, 'Enrolled');


SELECT "3. Retrieve the Student Information" as Message;
SELECT "a) Write a query to retrieve student details, such as student name, contact informations, and
Enrollment status" as Message;
SELECT " " as Message;

SELECT 
    S.STU_NAME,
    S.PHONE_NO,
    S.EMAIL_ID,
    E.ENROLL_STATUS
FROM 
    StudentInfo S
JOIN 
    EnrollmentInfo E ON S.STU_ID = E.STU_ID;

SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "b) Write a query to retrieve a list of courses in which a specific student is enrolled" AS Message;
SELECT " " AS MESSAGE;

SELECT 
    S.STU_NAME,
    C.COURSE_NAME,
    C.COURSE_INSTRUCTOR_NAME
FROM 
    StudentInfo S
JOIN 
    EnrollmentInfo E ON S.STU_ID = E.STU_ID
JOIN 
    CoursesInfo C ON E.COURSE_ID = C.COURSE_ID
WHERE 
    S.STU_NAME = 'Alice Johnson'
    AND E.ENROLL_STATUS = 'Enrolled';


SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "c) Write a query to retrieve course information, including course name, instructor information" AS Message;
SELECT " " AS MESSAGE;

SELECT * FROM CoursesInfo;




SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "d) Write a query to retrieve course information for a specific course" AS Message;
SELECT " " AS MESSAGE;

SELECT * FROM CoursesInfo
WHERE
    COURSE_NAME = 'Computer Science';


SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "e) Write a query to retrieve course information for multiple courses" AS Message;
SELECT " " AS MESSAGE;


SELECT 
    COURSE_ID,
    COURSE_NAME,
    COURSE_INSTRUCTOR_NAME
FROM 
    CoursesInfo
WHERE 
    COURSE_NAME IN ('Mathematics', 'Physics', 'Computer Science');



SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "4. Reporting and Analytics (Using joining queries)" AS Message;
SELECT "a) Write a query to retrieve the number of students enrolled in each course" AS MESSAGE;
SELECT " " AS MESSAGE;

SELECT 
    C.COURSE_NAME,
    COUNT(E.STU_ID) AS Enrolled_Student_Count
FROM 
    CoursesInfo C
JOIN 
    EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID
WHERE 
    E.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    C.COURSE_NAME;


SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "b) Write a query to retrieve the list of students enrolled in a specific course" AS MESSAGE;
SELECT " " AS MESSAGE;

SELECT 
    S.STU_NAME,
    S.EMAIL_ID,
    S.PHONE_NO,
    C.COURSE_NAME
FROM 
    StudentInfo S
JOIN 
    EnrollmentInfo E ON S.STU_ID = E.STU_ID
JOIN 
    CoursesInfo C ON E.COURSE_ID = C.COURSE_ID
WHERE 
    C.COURSE_ID = 103
    AND E.ENROLL_STATUS = 'Enrolled';


SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "c) Write a query to retrieve the count of enrolled students for each instructor" AS MESSAGE;
SELECT " " AS MESSAGE;

SELECT 
    C.COURSE_INSTRUCTOR_NAME,
    COUNT(E.STU_ID) AS Enrolled_Student_Count
FROM 
    CoursesInfo C
JOIN 
    EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID
WHERE 
    E.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    C.COURSE_INSTRUCTOR_NAME;



SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "d) Write a query to retrieve the list of students who are enrolled in multiple courses" AS MESSAGE;
SELECT " " AS MESSAGE;

SELECT 
    S.STU_NAME,
    S.EMAIL_ID,
    S.PHONE_NO,
    COUNT(E.COURSE_ID) AS Courses_Enrolled
FROM 
    StudentInfo S
JOIN 
    EnrollmentInfo E ON S.STU_ID = E.STU_ID
WHERE 
    E.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    S.STU_ID, S.STU_NAME, S.EMAIL_ID, S.PHONE_NO
HAVING 
    COUNT(E.COURSE_ID) > 1;


SELECT " " AS MESSAGE;
SELECT " " AS MESSAGE;
SELECT "e) Write a query to retrieve the courses that have the highest number of enrolled students(arranging from highest to lowest)" AS MESSAGE;
SELECT " " AS MESSAGE;

SELECT 
    C.COURSE_NAME,
    COUNT(E.STU_ID) AS Enrolled_Student_Count
FROM 
    CoursesInfo C
JOIN 
    EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID
WHERE 
    E.ENROLL_STATUS = 'Enrolled'
GROUP BY 
    C.COURSE_NAME
ORDER BY 
    Enrolled_Student_Count DESC
LIMIT 5;



