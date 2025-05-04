# 🎓 Student Management System - SQL Project

This project is a fully functional **Student Management System** developed using **MySQL**. It demonstrates core concepts of relational database design, normalization, and advanced SQL querying to extract and analyze academic data across students, faculty, courses, and grades.

## 📌 Project Objective

To design and implement a relational database that manages students, their course enrollments, faculty assignments, and GPA records. The project aims to simulate a real-world university database system.

## 🏗️ Database Schema

The system includes the following 6 main entities:

1. **student_info**: Contains student details like name, department, and enrollment year.
2. **Courses**: List of courses offered with credit and department info.
3. **Faculty**: Faculty members and their departments.
4. **CourseAssignments**: Mapping of courses to faculty.
5. **Enrollments**: Tracks which students are enrolled in which courses and their grades.
6. **StudentGPA**: Stores GPA per student per semester with performance remarks.

All tables are connected via **primary and foreign keys** to maintain **referential integrity**.

## 🔍 Key Features

- ✅ Table creation with proper constraints (PKs & FKs)
- ✅ Data population with realistic entries
- ✅ Complex SQL JOINs and subqueries
- ✅ GPA analytics and department-wise insights

## 📊 SQL Queries & Outputs

The project includes several key SQL queries:
- **Top 3 students** by GPA in *Fall 2023*
- **Students with highest GPA** across any semester
- **Average GPA per semester**
- **Department-wise GPA analysis**
- **GPA distribution** in *Spring 2024*
- **Full student-faculty-course mapping** using multiple JOINs

## 📁 Files Included

- `student_management_system.sql`: Contains all SQL commands for creating tables, inserting data, and executing queries
- `README.md`: Project documentation
- `ER_Diagram.png`: Visual ER diagram of the system (attached below)

## 📷 Entity-Relationship (ER) Diagram

![image](https://github.com/user-attachments/assets/abd45f6c-db40-4acd-810f-8b7988957516)

## 💡 Learnings

- Designing normalized relational schemas
- Applying SQL constraints like **FOREIGN KEY**, **JOIN**, and **GROUP BY**
- Understanding data relationships in educational environments


## 🙌 Connect With Me

If you have any suggestions, feedback, or similar projects to share, feel free to connect with me on [[LinkedIn](https://www.linkedin.com/in/saptarshi-gh/)

