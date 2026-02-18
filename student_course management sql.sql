create database institute
use institute

CREATE TABLE COURSES( Course_id INT IDENTITY(1,1) PRIMARY KEY,Course_name Varchar(100) not null, Course_fee Numeric(10,2)
not null);
Insert into Courses(Course_name, Course_fee) Values 
('Mathematics',500.00),
('Physics',600.00),
('Chemistry',700.00);

Create table Students (Student_id int identity (1,1) primary key, Student_name varchar(100) not null);
Insert into Students(student_name) values
('Raju'),('Sham'),('Baburao'),('Alex');

Create table Enrollment( enrollment_id Int Identity(1,1) primary key, student_id int not  null, course_id int not null,
enrollment_date date not null,
Foreign key (Student_id) references Students (student_id),
Foreign key(Course_id) references Courses (Course_id));

INSERT INTO Enrollment (Student_ID, Course_ID, Enrollment_Date)
VALUES
(1, 1, '2026-02-01'),
(1, 2, '2026-02-02'),
(2, 1, '2026-02-03'),
(3, 3, '2026-02-04'),
(4, 2, '2026-02-05');

SELECT * FROM STUDENTS;
SELECT * FROM COURSES;
SELECT * FROM ENROLLMENT;

SELECT * FROM ENROLLMENT e
INNER JOIN students s on e.student_id= s.student_id
INNER JOIN courses c on e.course_id= c.course_id;
--List all courses a particular student is enrolled in--
Select course_name from Courses c
join enrollment e on c.course_id= e.enrollment_id 
--Find all students in a particular course--
SELECT student_Name
FROM Students s
JOIN Enrollment e ON s.Student_id = e.Student_ID
WHERE e.Course_ID = 2;  
--Show student names with the courses they are enrolled in--
SELECT student_Name AS Student, Course_Name AS Course
FROM Students s
JOIN Enrollment e ON s. Student_ID = e.Student_ID
JOIN Courses c ON e.Course_ID = c.Course_ID
ORDER BY student_Name;
--Count the number of courses each student is enrolled in--
SELECT student_Name, COUNT(e.Course_ID) AS TotalCourses
FROM Students s
LEFT JOIN Enrollment e ON s.Student_ID = e.Student_ID
GROUP BY student_Name;
--Count the number of students in each course--
SELECT c.Course_Name, COUNT(e.Student_ID) AS TotalStudents
FROM Courses c
LEFT JOIN Enrollment e ON c.Course_ID = e.Course_ID
GROUP BY c.Course_Name;
--Find students enrolled in more than 1 course--
SELECT s.student_Name, COUNT(e.Course_ID) AS CourseCount
FROM Students s
JOIN Enrollment e ON s.Student_ID = e.Student_ID
GROUP BY s.student_Name
HAVING COUNT(e.Course_ID) > 1;
--List students with their latest enrollment date--
SELECT s.student_Name, MAX(e.Enrollment_Date) AS LastEnrollment
FROM Students s
JOIN Enrollment e ON s.Student_ID = e.Student_ID
GROUP BY s.student_Name;
