-- Script name: tests.sql
-- Author: 		Amron Berhanu
-- Purpose: 	Tests the integrity of this database system 

-- The database used for the inserts
USE CollegeDB;


-- Testing AcademicLevel table 
DELETE FROM AcademicLevel WHERE name = 'FRESHMAN';
UPDATE AcademicLevel SET academic_level_id = 1 WHERE name = 'Sophomore';

-- Testing AcademicStanding table 
DELETE FROM AcademicStanding WHERE standing = 'Poor';
UPDATE AcademicStanding SET academic_standing_id = 1 WHERE standing = 'Sophomore';

-- Testing Student table
UPDATE Student SET standing = 3 WHERE first_name = 'Jane';
-- 1. Error in Student DELETE
-- Query - DELETE FROM Student WHERE first_name = 'John';
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`collegedb`.`transcripts`, CONSTRAINT `FK_STUDENT_TRANSCRIPT` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON UPDATE CASCADE)

-- Testing Staff table
UPDATE Student SET last_name = 'Costa' WHERE first_name = 'Jose';
-- 2. Error in Staff DELETE
-- DELETE FROM Staff WHERE first_name = 'Jose';
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`collegedb`.`courseevaluations`, CONSTRAINT `FK_FACULTY_COURSEEVALUATION` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`faculty_id`) ON UPDATE CASCADE)

-- Testing Department table
DELETE FROM Department WHERE name = 'History';
UPDATE Department SET department_id = 4 WHERE name = 'Biology';

-- Testing Location table
DELETE FROM Location WHERE latitude = -21.989;
UPDATE Location SET location_id = 4 WHERE longitude = 83.204;

-- Testing Building table
DELETE FROM Building WHERE name = 'Burk Hall';
UPDATE Building SET building_id = 4 WHERE name = 'Hensill Hall';

-- Testing Room table
DELETE FROM Room WHERE capacity = 50;
UPDATE Room SET room_id = 1 WHERE name = 'Classroom';

-- Testing Faculty table
DELETE FROM Faculty WHERE role = 'Chair';
-- 3. Error in Faculty UPDATE
-- UPDATE Faculty SET faculty = 3 WHERE name = 'Lecturer';
-- Error Code: 1054. Unknown column 'name' in 'where clause'

-- Testing Administration table
DELETE FROM Administration WHERE role = 'Provost';
UPDATE Administration SET administration_id = 2 WHERE role = 'Admissions';

-- Testing Finance table
DELETE FROM Finance WHERE staff_id = 9;
UPDATE Finance SET finance_id = 1 WHERE role = 'Financial Aid Officer';

-- Testing Address table
DELETE FROM Address WHERE zipcode = 96403;
UPDATE Address SET zipcode = 94605 WHERE zipcode = 94602;

-- Testing PaymentType table
DELETE FROM PaymentType WHERE description = 'descr3';
UPDATE PaymentType SET address_id = 4 WHERE address_id = NULL;

-- Testing PaymentType table
DELETE FROM PaymentType WHERE description = 'descr3';
UPDATE PaymentType SET address_id = 4 WHERE address_id = NULL;

-- Testing StudentPaymentInfo table
DELETE FROM StudentPaymentInfo WHERE student = 3;
UPDATE StudentPaymentInfo SET paymentType = 4 WHERE student = 2;

-- Testing StudentPaymentInfo table
DELETE FROM StudentPaymentInfo WHERE student = 3;
UPDATE StudentPaymentInfo SET paymentType = 4 WHERE student = 2;

-- Testing StaffPaymentInfo table
DELETE FROM StaffPaymentInfo WHERE staff = 3;
UPDATE StaffPaymentInfo SET paymentType = 4 WHERE staff = 2;

-- Testing BankAccount table
DELETE FROM BankAccount WHERE account_num = 3;
-- 4. Error in BankAccount UPDATE
-- UPDATE BankAccount SET paymentType = 3 WHERE routing = 9876453888;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`collegedb`.`bankaccount`, CONSTRAINT `FK_PAYMENTTYPE_BANKACCOUNT` FOREIGN KEY (`paymentType`) REFERENCES `paymenttype` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE)

-- Testing CreditCard table
DELETE FROM CreditCard WHERE ccv = 555;
UPDATE CreditCard SET paymentType = 5 WHERE card_num = 6;

-- Testing StudentAddress table
DELETE FROM StudentAddress WHERE student = 3;
UPDATE StudentAddress SET address = 3 WHERE student = 2;

-- Testing StaffAddress table
DELETE FROM StaffAddress WHERE staff = 3;
UPDATE StaffAddress SET address = 3 WHERE staff = 2;

-- Testing Major table
DELETE FROM Major WHERE type = 'Minor';
UPDATE Major SET major_id = 2 WHERE name = 'Mathematics';

-- Testing CoreRequirements table
DELETE FROM CoreRequirements WHERE area = 'Core Computer Science';
UPDATE CoreRequirements SET coreReq_id = 1 WHERE area = 'Mathematics and Physics';

-- Testing MajorRequirements table
DELETE FROM MajorRequirements WHERE major = 2;
UPDATE MajorRequirements SET major = 2 WHERE requirement = 3;

-- Testing StudentMajors table
DELETE FROM StudentMajors WHERE student = 1;
UPDATE StudentMajors SET student = 1 WHERE major = 3;

-- Testing DegreeLevel table
DELETE FROM DegreeLevel WHERE level = 'PhD';
UPDATE DegreeLevel SET level = 'PhD' WHERE level = 'Masters';

-- Testing Degree table
DELETE FROM Degree WHERE major = 3;
-- 5. Error in Degree UPDATE
-- UPDATE Degree SET major = 3 WHERE level = 2;
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`collegedb`.`degree`, CONSTRAINT `FK_MAJOR_DEGREE` FOREIGN KEY (`major`) REFERENCES `major` (`major_id`) ON DELETE CASCADE ON UPDATE CASCADE)

-- Testing Course table
DELETE FROM Course WHERE title = 'Bay Area History';
UPDATE Course SET department = 1 WHERE title = 'Applied Linear Algebra';

-- Testing GERequirements table
DELETE FROM GERequirements WHERE area = 'Arts and Humanities';
-- 6. Error in GERequirements UPDATE
-- UPDATE GERequirements SET geReq_id = 3 WHERE area = 'Social Sciences';
-- Error Code: 1062. Duplicate entry '3' for key 'gerequirements.PRIMARY'

-- Testing CollegeRequirements table
DELETE FROM CollegeRequirements WHERE description = 'Written English';
UPDATE CollegeRequirements SET collegeReq_id = 2 WHERE description = 'U.S History and Government';

-- Testing CourseAttributes table
DELETE FROM CourseAttributes WHERE course_id = 6;
UPDATE CourseAttributes SET course_id = 5 WHERE collegeReq = 1;

-- Testing DegreeRequirements table
 DELETE FROM DegreeRequirements WHERE degree_id = 4;
 UPDATE DegreeRequirements SET college_req = NULL WHERE college_req = 3;

-- Testing Semesters table
DELETE FROM Semesters WHERE semester_id = 3;
UPDATE Semesters SET semester = "Summer" WHERE semester_id = 2;

-- Testing Enrollment table
DELETE FROM Enrollment WHERE student = 2;
UPDATE Enrollment SET student = 2 WHERE course = 2;

-- Testing Sections table
DELETE FROM Sections WHERE instructor = 2;
UPDATE Sections SET room = 1 WHERE course_id = 1;

-- Testing Timeslot table
DELETE FROM Timeslot WHERE start = TIMESTAMP("2021-05-5",  "14:00:00");
UPDATE Timeslot SET timeslot_id = 2 WHERE start = TIMESTAMP("2021-05-6",  "19:00:00");

-- Testing WorkingDays table
DELETE FROM WorkingDays WHERE day = 'F';
-- 7. Error WorkinDays UPDATE
-- UPDATE WorkingDays SET description = 'Wednesday' WHERE day = 'T';
-- Error Code: 1406. Data too long for column 'description' at row 1

-- Testing ClassSchedule table
DELETE FROM ClassSchedule WHERE section = 3;
UPDATE ClassSchedule SET timeslot = 1 WHERE section = 2;

-- Testing Transcripts table
DELETE FROM Transcripts WHERE student_id = 3;
-- 8. Error Transcripts UPDATE
-- UPDATE Transcripts SET units_taken = 180 WHERE student_id = 1;
-- Error Code: 1264. Out of range value for column 'units_taken' at row 1

-- Testing Honors table
DELETE FROM Honors WHERE honor_id = 1;
UPDATE Honors SET title = 'Magna Cum Laude' WHERE honor_id = 3;

-- Testing HonorsStudents table
DELETE FROM HonorsStudents WHERE award_date = '2021-05-21';
UPDATE HonorsStudents SET honor_id = 3 WHERE student_id = 1;

-- Testing Grants table
DELETE FROM `Grants` WHERE name = 'Subsidized Loan';
UPDATE `Grants` SET amount = 3000 WHERE name = 'University Grant';

-- Testing GrantRecipients table
DELETE FROM GrantRecipients WHERE `grant` = 2;
UPDATE GrantRecipients SET `grant` = 1 WHERE student = 3;

-- Testing Fees table
DELETE FROM Fees WHERE amount = 350.00;
UPDATE Fees SET amount = 150.00 WHERE description = 'Gym memberhip';

-- Testing CourseFees table
DELETE FROM CourseFees WHERE course = 1;
UPDATE CourseFees SET course = 1 WHERE fee = 2;

-- Testing StudentFees table
DELETE FROM StudentFees WHERE student = 2;
UPDATE StudentFees SET student = 2 WHERE fee = 5;

-- Testing CourseBySemester table
DELETE FROM CourseBySemester WHERE course = 2;
UPDATE CourseBySemester SET course = 2 WHERE semester = 3;

-- Testing CourseEvaluations table
DELETE FROM CourseEvaluations WHERE course = 4;
UPDATE CourseEvaluations SET course = 4 WHERE filepath = 'eval2';

-- Testing Prerequisites table
DELETE FROM Prerequisites WHERE course_id = 8;
UPDATE Prerequisites SET `condition` = 'C+ or Better' WHERE course_id = 7;



-- Testing addCourse, updateStudentFee triggers
-- NOTE: addCourse - This query should not insert into the enrollment due to missing prerequisite
-- NOTE: updateStudentFee - 
-- 9. Error Enrollment INSERT
-- INSERT INTO Enrollment (student, course) VALUES (1, 4);
-- Error Code: 1242. Subquery returns more than 1 row

-- Testing numStudentsInCourse procedure
 INSERT INTO Enrollment (student, course) VALUES (1,8),(2, 8),(3,8);
 CALL numStudentsInCourse(8, @numStudent);
 SELECT @numStudent;


-- Testing studentBalance function
SELECT studentBalance(1);
