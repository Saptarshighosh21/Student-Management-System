CREATE DATABASE STUDENT;
USE STUDENT;
CREATE TABLE student_info(student_id INT PRIMARY KEY, name VARCHAR(50), Email VARCHAR (70), Department VARCHAR (50), Enrollment_year INT);
INSERT INTO student_info 
VALUES
(101, 'Riya Sharma', 'riya.sharma@yahoo.com', 'Computer Science', 2021),
(102, 'Arjun Mehta', 'arjun.mehta@hotmail.com', 'Mechanical Engineering', 2020),
(103, 'Sara Das', 'sara.das@outlook.com', 'Electrical Engineering', 2022),
(104, 'Kunal Roy', 'kunal.roy@gmail.com', 'Computer Science', 2021),
(105, 'Megha Jain', 'megha.jain@icloud.com', 'Civil Engineering', 2020);

CREATE TABLE Courses(course_id INT PRIMARY KEY, Title varchar(50), Department varchar (50), Credits int);
INSERT INTO Courses 
VALUES
(1,'Database Systems', 'Computer Science', 4),
(2,'Thermodynamics', 'Mechanical Engineering', 3),
(3,'Digital Circuits', 'Electrical Engineering', 4),
(4, 'Structural Analysis', 'Civil Engineering', 3),
(5, 'Operating Systems', 'Computer Science', 4);

CREATE TABLE studentGPA (
student_id int, 
semester VARCHAR(20), 
gpa DECIMAL(3,2), 
remarks VARCHAR(50),
FOREIGN KEY (student_id) REFERENCES student_info(student_id));
INSERT INTO StudentGPA (student_id, semester, gpa, remarks) 
VALUES
(101, 'Fall 2023', 3.85, 'Dean’s List'),
(101, 'Spring 2024', 3.60, 'Good Standing'),
(102, 'Fall 2023', 2.90, 'Average'),
(102, 'Spring 2024', 3.10, 'Improved'),
(103, 'Fall 2023', 3.95, 'Honors'),
(103, 'Spring 2024', 3.80, 'Excellent'),
(104, 'Fall 2023', 3.10, 'Satisfactory'),
(104, 'Spring 2024', 2.70, 'Needs Improvement'),
(105, 'Fall 2023', 2.50, 'Academic Warning'),
(105, 'Spring 2024', 3.00, 'Improved');

SELECT*FROM StudentGPA;

CREATE TABLE Faculty (faculty_id INT PRIMARY KEY, name varchar(50), email VARCHAR(50), Department varchar (50));
INSERT INTO Faculty 
VALUES
(1, 'Dr. Anita Rao', 'anita.rao@univ.edu', 'Computer Science'),
(2, 'Dr. Rahul Verma', 'rahul.verma@univ.edu', 'Mechanical Engineering'),
(3, 'Dr. Leena Ghosh', 'leena.ghosh@univ.edu', 'Electrical Engineering'),
(4, 'Dr. Vinay Kulkarni', 'vinay.kulkarni@univ.edu', 'Civil Engineering');

CREATE TABLE CourseAssignments (course_id INT, faculty_id INT,
FOREIGN KEY (course_id) REFERENCES Courses(course_id), 
FOREIGN KEY (faculty_id) REFERENCES Faculty (faculty_id));
INSERT INTO CourseAssignments 
VALUES
(1, 1),  -- Database Systems taught by Dr. Anita Rao
(2, 2),  -- Thermodynamics by Dr. Rahul Verma
(3, 3),  -- Digital Circuits by Dr. Leena Ghosh
(4, 4),  -- Structural Analysis by Dr. Vinay Kulkarni
(5, 1);  -- Operating Systems also taught by Dr. Anita Rao

SELECT * FROM CourseAssignments;

CREATE TABLE Enrollments (student_id INT, course_id INT, enrollment_date DATE, grade VARCHAR(1),
FOREIGN KEY (student_id) REFERENCES student_info(student_id), 
FOREIGN KEY (course_id) REFERENCES Courses(course_id));
INSERT INTO Enrollments 
VALUES
(101, 1, '2023-08-01', 'A'),
(101, 5, '2023-08-01', 'B'),
(102, 2, '2023-08-01', 'A'),
(103, 3, '2023-08-01', 'C'),
(104, 1, '2023-08-01', 'A'),
(104, 5, '2023-08-01', 'A'),
(105, 4, '2023-08-01', 'B');

SET SQL_SAFE_UPDATES = 0;          ### SAFE MODE OFF

#### JOIN ALL TABLES

SELECT 
   s.student_id, s.name, s.Department, ca.course_id, e.grade, c.Title, f.faculty_id, f.name, sg.semester, sg.gpa
FROM Enrollments as e
JOIN student_info as s on s.student_id = e.student_id
JOIN CourseAssignments as ca ON ca.course_id = e.course_id              
JOIN Courses as c ON e.course_id = c.course_id
JOIN Faculty as f ON ca.faculty_id = f.faculty_id
JOIN StudentGPA as sg ON sg.student_id = s.student_id;

######## 1. Top 3 Students by GPA in Fall 2023

SELECT 
      s.student_id, s.name, sg.semester, sg.gpa
FROM  student_info as s
JOIN  StudentGPA as sg ON sg.student_id = s.student_id
WHERE semester = "Fall 2023" 
ORDER BY gpa DESC
LIMIT 3;    

######## 2. Students with the Highest GPA Overall (any semester)

SELECT s.student_id, s.name, sg.semester, sg.gpa
FROM  student_info as s
JOIN  StudentGPA as sg ON sg.student_id = s.student_id 
WHERE sg.gpa = (SELECT MAX(GPA) FROM StudentGPA); 

######## 3. Average GPA Per Semester

SELECT semester, ROUND(AVG(gpa),2) AS Avg_GPA
FROM StudentGPA
GROUP BY semester
ORDER BY semester;

######## 4. Highest GPA based on Department

SELECT s.Department, sg.gpa
FROM  student_info as s
JOIN  StudentGPA as sg ON sg.student_id = s.student_id
WHERE sg.gpa = (SELECT MAX(GPA) FROM StudentGPA);

######## 5. GPA Distribution by Department in Spring 2024

SELECT 
    s.department,
    ROUND(AVG(g.gpa), 2) AS avg_gpa,
    COUNT(*) AS student_count
FROM StudentGPA as g
JOIN student_info as s ON g.student_id = s.student_id
WHERE g.semester = 'Spring 2024'
GROUP BY s.department
ORDER BY avg_gpa DESC;

