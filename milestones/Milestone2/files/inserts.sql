-- Script name: inserts.sql
-- Author: 		Amron Berhanu
-- Purpose: 	insert sample data to test the integrity of this database system

-- The database used for the inserts
USE CollegeDB;


-- AcademicLevel table inserts
INSERT INTO AcademicLevel (name) VALUES ("Freshman"),("Sophomore"),("Junior"),("Senior"),("Graduate");

-- AcademicStanding table inserts

 INSERT INTO AcademicStanding (academic_standing_id, standing,min_GPA) 
 VALUES 
 (1, "Poor", 1.0), (2,"Good", 2.0),(3,"Excellent", 3.0);
 
-- Student table inserts
INSERT INTO Student (first_name, last_name, email, phone, standing, acadLevel) 
VALUES 
("Amron", "Berhanu", "amron@mail.com", "+123456789",2, 4),
("John", "Doe", "john@mail.com", "+123456789", 2, 5),
("Jane", "Doe", "jane@mail.com", "+123456789", 3, 3);



-- Staff table inserts
INSERT INTO Staff (first_name, last_name, email, phone) 
VALUES 
("Jose", "Ortiz", "jose@mail.com", "+123456123"),
("Arsene", "Wenger", "arsene@mail.com", "+123489235"),
("Mikel", "Arteta", "mikel@mail.com", "+123789253"),
("Arno", "Puder", "arno@mail.com", "+123456245"),
("Thomas", "John", "thomas@mail.com", "+123456213"),
("Kevin", "Boateng", "kevin@mail.com", "+123456098"),
("Fisher", "Price", "fisher@mail.com", "+123456567"),
("Martha", "Stewart", "martha@mail.com", "+123456243"),
("Andrew", "Jackson", "andrew@mail.com", "+123456789");

-- Department table inserts
INSERT INTO Department (name, phone, chair) 
VALUES 
("Computer Science", "+4155151252", NULL),
("Biology", "+4155151242", NULL),
("Mathematics", "+4155151497", NULL),
("History", "+4165651498", NULL);

-- Location table inserts
INSERT INTO Location (latitude, longitude) VALUES (23.292, 78.011),(-25.334, 83.204),(-21.989, 125.020);

-- Building table inserts
INSERT INTO Building (name, location) 
VALUES 
("Thornton Hall", 1),("Hensill Hall", NULL),("Burk Hall", 2);

-- Room table inserts
 INSERT INTO Room (name,capacity,room_no,building) 
 VALUES 
("Classroom", 50, 123, 1),("Classroom", 100, 3, 2),("Office", NULL, 24, 3),("Lab", 25, 99, 2);

-- Faculty table inserts
INSERT INTO Faculty (staff_id, role, office_phone, department, office) 
VALUES 
(1, "Professor", "+9876547321", 1, NULL),
(3, "Lecturer", "+9876547747", 2, NULL),
(4, "Chair", "+9876547678", 1, 3);


-- Administration table inserts
INSERT INTO Administration (staff_id, role, office_phone) 
VALUES 
(2, "Dean", "+9876547453"),
(5, "Provost", "+9876547790"),
(6, "Admissions", "+9876547126");


-- Finance table inserts
INSERT INTO Finance (staff_id, role, office_phone) 
VALUES 
(7, "Budget Director", "+9876547453"),
(8, "Financial Aid Officer", "+9876547790"),
(9, "Officer", "+9876547126");


-- Address table inserts
INSERT INTO Address (street_address, city, state, zipcode) 
VALUES 
("1 address st", "San Francisco", "CA", 94110),
("2 address st", "San Francisco", "CA", 94111),
("3 address st", "San Francisco", "CA", 94112),
("4 address st", "Oakland", "CA", 94601),
("5 address st", "Oakland", "CA", 94602),
("6 address st", "Oakland", "CA", 94603);



-- PaymentType table inserts
INSERT INTO PaymentType (address_id, description) 
VALUES 
(NULL, "descr1"),
(2, "descr2"),
(3, "descr3"),
(1, "descr4"),
(5, "descr5"),
(6, "descr6");


-- StudentPaymentInfo table inserts
INSERT INTO StudentPaymentInfo (student, paymentType) 
VALUES 
(1, 1),
(2, 2),
(3, 3);


-- StaffPaymentInfo table inserts
INSERT INTO StaffPaymentInfo (staff, paymentType) 
VALUES 
(1, 4),
(2, 5),
(3, 6);


-- BankAccount table inserts
INSERT INTO BankAccount (account_num, bank, routing, paymentType) 
VALUES 
(1, "Bank of America", "9876547453", 1),
(2, "Bank of America", "9876453888", 2),
(3, "Chase Bank", "9876547555", 3);


-- CreditCard table inserts
INSERT INTO CreditCard (card_num, bank, ccv, exp_date, paymentType) 
VALUES 
(1, "Bank of America", "987", CURDATE(), 4),
(2, "Bank of America", "645", CURDATE(), 5),
(3, "Chase Bank", "555",CURDATE(), 6);


-- StudentAddress table inserts
INSERT INTO StudentAddress (student, address) 
VALUES 
(1, 1),
(2, 2),
(3, 3);

-- StaffAddress table inserts
INSERT INTO StaffAddress (staff, address) 
VALUES 
(1, 4),
(2, 5),
(3, 6);


-- Major table inserts
 INSERT INTO Major (name, type, department) 
 VALUES 
 ("Computer Science", "Major", 1),
 ("Computer Science", "Minor", 1),
 ("Mathematics", "Major", 3);

 
-- CoreRequirements table inserts
 INSERT INTO CoreRequirements (area, division, units_required) 
 VALUES 
 ("Core Computer Science", "Lower", 22),
 ("Advanced Computer Science", "Upper", 12),
 ("Mathematics and Physics", "Lower", 22);

 
-- MajorRequirements table inserts
 INSERT INTO MajorRequirements (major, requirement) 
 VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3);
 
 
-- StudentMajors table inserts
INSERT INTO StudentMajors (student, major) 
VALUES 
(1, 1),
(2, 3),
(2, 2);


-- DegreeLevels table inserts
INSERT INTO DegreeLevel (level) 
VALUES 
("Bachelors"),("Masters"),("PhD");


-- Degree table inserts
INSERT INTO Degree (major, level) 
VALUES 
(1, 1),
(1, 2),
(3, 1);

-- Course table inserts
 INSERT INTO Course (title, units, department) 
 VALUES 
 ("Database Systems", 3, 1),
 ("Applied Linear Algebra", 3, 3),
 ("Calculus 3", 3, 3),
 ("Biology 100", 3, 2),
 ("Calculus  1", 3, 3),
 ("Bay Area History", 3, 4),
 ("Calculus 2", 3, 3),
 ("Intro to Programming", 3, 1);
 
 
-- GERequirements table inserts
 INSERT INTO GERequirements (area, division, units_required) 
 VALUES 
 ("Communication and Critical Thinking", "Lower", 9),
 ("Scientific Inquiry and Quantitative Reasoning", "Lower", 9),
 ("Arts and Humanities", "Lower", 9),
 ("Social Sciences", "Lower", 9),
 ("Arts and Humanities", "Lower", 9),
 ("Physical/Life Science", "Upper", 3),
 ("Arts and Humanities", "Upper", 3),
 ("Social Sciences", "Upper", 3);
 
 
 
-- CollegeRequirements table inserts
-- GERequirements table inserts
 INSERT INTO CollegeRequirements (description, units_required) 
 VALUES 
 ("SF State Studies", 12),
 ("Written English",9),
 ("U.S History and Government", 9);
 
 

-- CourseAttributes table inserts
 INSERT INTO CourseAttributes (course_id, GEReq, coreReq, collegeReq) 
 VALUES 
 (1,NULL,2,NULL),
 (5,2,3,NULL),
 (6,8,NULL,1);


-- DegreeRequirements table inserts
 INSERT INTO DegreeRequirements (degreeReq_id, degree_id, GE_id, core_req, college_req) 
 VALUES 
 (1,1,1,1,1),
 (2,1,2,2,2),
 (3,1,3,3,3),
 (4,1,4,NULL,NULL);

-- Semesters table inserts
INSERT INTO Semesters (semester_id, semester, year) 
 VALUES 
 (1,"Fall", 2020),
 (2,"Spring", 2021),
 (3,"Summer", 2021);

 
-- Enrollment table inserts	
-- [NEEDS PREREQUISITE DATA BEFOREHAND FOR TRIGGER TO WORK] 
INSERT INTO Enrollment (student, course) 
VALUES 
(1, 1),
(1, 2),
(2, 3);


-- Sections table inserts
 INSERT INTO Sections (course_id, title, type, instructor, room) 
 VALUES 
 (1, "Section 01", "Lecture", 1, NULL),
 (4, "Section 03", "Lecture", 2, NULL),
 (4, "Section 03", "Lab", 2, 4);


-- Timeslot table inserts
INSERT INTO Timeslot (start, end) 
VALUES 
(TIMESTAMP("2021-05-4",  "12:30:00"), TIMESTAMP("2021-05-4",  "13:45:00")),
(TIMESTAMP("2021-05-5",  "14:00:00"), TIMESTAMP("2021-05-5",  "15:15:00")),
(TIMESTAMP("2021-05-6",  "19:00:00"), TIMESTAMP("2021-05-6",  "21:45:00"));


-- WorkingDays itable nserts
INSERT INTO WorkingDays (day, description)
VALUES
('M', 'Monday'),
('T', 'Tuesday'),
('F', 'Friday');

-- ClassSchedule table inserts
INSERT INTO ClassSchedule (section, timeslot, day) 
VALUES
(1,1,'M'), (2,2,'T'),(3,3,'F');

-- Transcripts table inserts
INSERT INTO Transcripts (units_taken, student_id, filepath)
VALUES
(30, 1, 'file1'),
(50, 2, 'file2'),
(10, 3, 'file3');

-- Honors table inserts
INSERT INTO Honors (honor_id, title, description) 
VALUES
(1,"Deans List", NULL),
(2,"Cum Laude", "With distinction"),
(3,"Summa Cum Laude", "With the highest distinction");

-- HonorsStudents table inserts
INSERT INTO HonorsStudents (honor_id, student_id, award_date)
VALUES
(3,2,'2021-05-21'),
(1,1,'2021-05-30'),
(1,2,'2021-05-30');

-- Grants table inserts
INSERT INTO Grants (name,amount,provider)
VALUES
('Pell Grant', 5000, 'FAFSA'),
('University Grant', 1500, 'SFSU'),
('Subsidized Loan', 2000, 'FAFSA');

-- GrantRecipients table inserts
-- INSERT INTO GrantRecipients (student, grant, award_date)
INSERT INTO GrantRecipients (student,`grant`,award_date) 
VALUES 
(1,1,TIMESTAMP("2021-01-19",  "12:30:00")),
(1,2,TIMESTAMP("2021-01-19",  "12:30:00")),
(3,3,TIMESTAMP("2021-01-15",  "12:30:00"));

-- Fees table inserts
INSERT INTO Fees (amount, description)
VALUES 
(350.00, "Course Registration"),
(35.23, "Lab Materials"),
(250.50, "Access Code"),
(500.00, "Course enrollment"),
(100.00, "Gym membership");

-- CourseFees table inserts
INSERT INTO CourseFees (course, fee) 
VALUES (4, 1), (4,2), (1,1);

-- StudentFees table inserts
INSERT INTO StudentFees (student, fee, date) 
VALUES 
(1, 4, TIMESTAMP("2020-12-03",  "17:38:46")), 
(1, 5, TIMESTAMP("2021-12-03",  "17:38:48")),
(2, 4, TIMESTAMP("2021-12-19",  "09:31:24"));

-- CourseBySemester table inserts
INSERT INTO CourseBySemester (course,semester)
VALUES
(1,1),(1,2),(1,3),
(2,2),
(4,1),(4,2),(4,3);

-- CourseEvaluations table inserts
INSERT INTO CourseEvaluations (course, faculty, filepath)
VALUES
(1,1,'eval1'),
(1,1,'eval2'),
(4,2,'eval1');


-- Prerequisites table inserts
INSERT INTO Prerequisites (course_id, prereqOf,`condition`)
VALUES
(5,7,'C or Better'),
(7,3,'C or Better'),
(8,1,'C or Better');
