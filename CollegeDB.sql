SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CollegeDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `AcademicLevel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AcademicLevel` ;

CREATE TABLE IF NOT EXISTS `AcademicLevel` (
  `academic_level_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`academic_level_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AcademicStanding`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AcademicStanding` ;

CREATE TABLE IF NOT EXISTS `AcademicStanding` (
  `academic_standing_id` TINYINT NOT NULL AUTO_INCREMENT,
  `standing` VARCHAR(45) NOT NULL,
  `min_GPA` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`academic_standing_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student` ;

CREATE TABLE IF NOT EXISTS `Student` (
  `student_id` TINYINT(9) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `standing` TINYINT NULL,
  `acadLevel` TINYINT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `FK_ACADEMICLEVEL_STUDENT_idx` (`acadLevel` ASC) VISIBLE,
  INDEX `FK_ACADEMICSTANDING_STUDENT_idx` (`standing` ASC) VISIBLE,
  CONSTRAINT `FK_ACADEMICLEVEL_STUDENT`
    FOREIGN KEY (`acadLevel`)
    REFERENCES `AcademicLevel` (`academic_level_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ACADEMICSTANDING_STUDENT`
    FOREIGN KEY (`standing`)
    REFERENCES `AcademicStanding` (`academic_standing_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Staff` ;

CREATE TABLE IF NOT EXISTS `Staff` (
  `staff_id` TINYINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Department` ;

CREATE TABLE IF NOT EXISTS `Department` (
  `department_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Location` ;

CREATE TABLE IF NOT EXISTS `Location` (
  `location_id` TINYINT NOT NULL AUTO_INCREMENT,
  `latitude` DECIMAL(6,3) NOT NULL,
  `longitude` DECIMAL(6,3) NOT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Building`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Building` ;

CREATE TABLE IF NOT EXISTS `Building` (
  `building_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `location` TINYINT NULL,
  PRIMARY KEY (`building_id`),
  INDEX `FK_LOCATION_BUILDING_idx` (`location` ASC) VISIBLE,
  CONSTRAINT `FK_LOCATION_BUILDING`
    FOREIGN KEY (`location`)
    REFERENCES `Location` (`location_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Room` ;

CREATE TABLE IF NOT EXISTS `Room` (
  `room_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `capacity` TINYINT NULL,
  `room_no` INT NOT NULL,
  `building` TINYINT NOT NULL,
  PRIMARY KEY (`room_id`),
  INDEX `FK_BUILDING_ROOM_idx` (`building` ASC) VISIBLE,
  CONSTRAINT `FK_BUILDING_ROOM`
    FOREIGN KEY (`building`)
    REFERENCES `Building` (`building_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculty` ;

CREATE TABLE IF NOT EXISTS `Faculty` (
  `faculty_id` TINYINT NOT NULL AUTO_INCREMENT,
  `staff_id` TINYINT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `office_phone` VARCHAR(45) NULL,
  `department` TINYINT NULL,
  `office` TINYINT NULL,
  PRIMARY KEY (`faculty_id`, `staff_id`),
  INDEX `staff_id` (`staff_id` ASC) VISIBLE,
  INDEX `FK_DEPARTMENT_FACULTY_idx` (`department` ASC) VISIBLE,
  INDEX `FK_ROOM_FACULTY_idx` (`office` ASC) VISIBLE,
  CONSTRAINT `FK_STAFF_FACULTY`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_DEPARTMENT_FACULTY`
    FOREIGN KEY (`department`)
    REFERENCES `Department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ROOM_FACULTY`
    FOREIGN KEY (`office`)
    REFERENCES `Room` (`room_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Administration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Administration` ;

CREATE TABLE IF NOT EXISTS `Administration` (
  `administration_id` TINYINT NOT NULL AUTO_INCREMENT,
  `staff_id` TINYINT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `office_phone` VARCHAR(45) NULL,
  PRIMARY KEY (`administration_id`, `staff_id`),
  INDEX `FK_STAFF_ADMINISTRATION_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `FK_STAFF_ADMINISTRATION`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Finance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Finance` ;

CREATE TABLE IF NOT EXISTS `Finance` (
  `finance_id` TINYINT NOT NULL AUTO_INCREMENT,
  `staff_id` TINYINT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `office_phone` VARCHAR(45) NULL,
  PRIMARY KEY (`finance_id`, `staff_id`),
  INDEX `FK_STAFF_FINANCE_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `FK_STAFF_FINANCE`
    FOREIGN KEY (`staff_id`)
    REFERENCES `Staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address` ;

CREATE TABLE IF NOT EXISTS `Address` (
  `address_id` TINYINT NOT NULL AUTO_INCREMENT,
  `street_address` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zipcode` CHAR(5) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PaymentType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PaymentType` ;

CREATE TABLE IF NOT EXISTS `PaymentType` (
  `type_id` TINYINT NOT NULL AUTO_INCREMENT,
  `address_id` TINYINT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`),
  INDEX `FK_ADDRESS_PAYMENTTYPE_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `FK_ADDRESS_PAYMENTTYPE`
    FOREIGN KEY (`address_id`)
    REFERENCES `Address` (`address_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentPaymentInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentPaymentInfo` ;

CREATE TABLE IF NOT EXISTS `StudentPaymentInfo` (
  `studentPaymentInfo_id` TINYINT NOT NULL AUTO_INCREMENT,
  `student` TINYINT(9) NOT NULL,
  `paymentType` TINYINT NOT NULL,
  PRIMARY KEY (`studentPaymentInfo_id`),
  INDEX `FK_STUDENT_STUDENTPAYMENTINFO_idx` (`student` ASC) VISIBLE,
  INDEX `FK_PAYMENTTYPE_STUDENTPAYMENTTYPE_idx` (`paymentType` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_STUDENTPAYMENTINFO`
    FOREIGN KEY (`student`)
    REFERENCES `Student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PAYMENTTYPE_STUDENTPAYMENTTYPE`
    FOREIGN KEY (`paymentType`)
    REFERENCES `PaymentType` (`type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StaffPaymentInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StaffPaymentInfo` ;

CREATE TABLE IF NOT EXISTS `StaffPaymentInfo` (
  `staffPaymentInfo_id` TINYINT NOT NULL AUTO_INCREMENT,
  `staff` TINYINT NOT NULL,
  `paymentType` TINYINT NOT NULL,
  PRIMARY KEY (`staffPaymentInfo_id`),
  INDEX `FK_STAFF_STAFFPAYMENTTYPE_idx` (`staff` ASC) VISIBLE,
  INDEX `FH_PAYMENTTYPE_STAFFPAYMENTTYPE_idx` (`paymentType` ASC) VISIBLE,
  CONSTRAINT `FK_STAFF_STAFFPAYMENTTYPE`
    FOREIGN KEY (`staff`)
    REFERENCES `Staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FH_PAYMENTTYPE_STAFFPAYMENTTYPE`
    FOREIGN KEY (`paymentType`)
    REFERENCES `PaymentType` (`type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BankAccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BankAccount` ;

CREATE TABLE IF NOT EXISTS `BankAccount` (
  `account_num` TINYINT NOT NULL,
  `bank` VARCHAR(45) NOT NULL,
  `routing` VARCHAR(45) NOT NULL,
  `paymentType` TINYINT NOT NULL,
  PRIMARY KEY (`account_num`),
  UNIQUE INDEX `routing_UNIQUE` (`routing` ASC) VISIBLE,
  INDEX `FK_PAYMENTTYPE_BANKACCOUNT_idx` (`paymentType` ASC) VISIBLE,
  CONSTRAINT `FK_PAYMENTTYPE_BANKACCOUNT`
    FOREIGN KEY (`paymentType`)
    REFERENCES `PaymentType` (`type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CreditCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CreditCard` ;

CREATE TABLE IF NOT EXISTS `CreditCard` (
  `card_num` TINYINT NOT NULL,
  `bank` VARCHAR(45) NOT NULL,
  `ccv` VARCHAR(45) NOT NULL,
  `exp_date` DATE NOT NULL,
  `paymentType` TINYINT NOT NULL,
  PRIMARY KEY (`card_num`),
  INDEX `FK_PAYMENTTYPE_CREDITCARD_idx` (`paymentType` ASC) VISIBLE,
  CONSTRAINT `FK_PAYMENTTYPE_CREDITCARD`
    FOREIGN KEY (`paymentType`)
    REFERENCES `PaymentType` (`type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentAddress` ;

CREATE TABLE IF NOT EXISTS `StudentAddress` (
  `student_address_id` TINYINT NOT NULL AUTO_INCREMENT,
  `student` TINYINT(9) NOT NULL,
  `address` TINYINT NOT NULL,
  PRIMARY KEY (`student_address_id`),
  INDEX `FK_STUDENT_STUDENTADDRESS_idx` (`student` ASC) VISIBLE,
  INDEX `FK_ADDRESS_STUDENTADDRESS_idx` (`address` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_STUDENTADDRESS`
    FOREIGN KEY (`student`)
    REFERENCES `Student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ADDRESS_STUDENTADDRESS`
    FOREIGN KEY (`address`)
    REFERENCES `Address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StaffAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StaffAddress` ;

CREATE TABLE IF NOT EXISTS `StaffAddress` (
  `staff_address_id` TINYINT NOT NULL AUTO_INCREMENT,
  `staff` TINYINT NOT NULL,
  `address` TINYINT NOT NULL,
  PRIMARY KEY (`staff_address_id`),
  INDEX `FK_STAFF_STAFFADDRESS_idx` (`staff` ASC) VISIBLE,
  INDEX `FK_ADDRESS_STAFFADDRESS_idx` (`address` ASC) VISIBLE,
  CONSTRAINT `FK_STAFF_STAFFADDRESS`
    FOREIGN KEY (`staff`)
    REFERENCES `Staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ADDRESS_STAFFADDRESS`
    FOREIGN KEY (`address`)
    REFERENCES `Address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Major` ;

CREATE TABLE IF NOT EXISTS `Major` (
  `major_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `department` TINYINT NULL,
  PRIMARY KEY (`major_id`),
  INDEX `FK_DEPARTMENT_MAJOR_idx` (`department` ASC) VISIBLE,
  CONSTRAINT `FK_DEPARTMENT_MAJOR`
    FOREIGN KEY (`department`)
    REFERENCES `Department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CoreRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CoreRequirements` ;

CREATE TABLE IF NOT EXISTS `CoreRequirements` (
  `coreReq_id` TINYINT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(45) NOT NULL,
  `division` VARCHAR(45) NOT NULL,
  `units_required` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`coreReq_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MajorRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MajorRequirements` ;

CREATE TABLE IF NOT EXISTS `MajorRequirements` (
  `majorRequirement_id` TINYINT NOT NULL AUTO_INCREMENT,
  `major` TINYINT NOT NULL,
  `requirement` TINYINT NOT NULL,
  PRIMARY KEY (`majorRequirement_id`, `major`),
  INDEX `FK_MAJOR_MAJORREQUIREMENT_idx` (`major` ASC) VISIBLE,
  INDEX `FK_COREREQUIREMENT_MAJORREQUIREMENT_idx` (`requirement` ASC) VISIBLE,
  CONSTRAINT `FK_COREREQUIREMENT_MAJORREQUIREMENT`
    FOREIGN KEY (`requirement`)
    REFERENCES `CoreRequirements` (`coreReq_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MAJOR_MAJORREQUIREMENT`
    FOREIGN KEY (`major`)
    REFERENCES `Major` (`major_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentMajors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentMajors` ;

CREATE TABLE IF NOT EXISTS `StudentMajors` (
  `majorByStudent_id` TINYINT NOT NULL AUTO_INCREMENT,
  `student` TINYINT(9) NOT NULL,
  `major` TINYINT NOT NULL,
  PRIMARY KEY (`majorByStudent_id`),
  INDEX `FK_MAJOR_MAJORBYSTUDENT_idx` (`major` ASC) VISIBLE,
  INDEX `FK_STUDENT_STUDENTMAJORS_idx` (`student` ASC) VISIBLE,
  CONSTRAINT `FK_MAJOR_STUDENTMAJORS`
    FOREIGN KEY (`major`)
    REFERENCES `Major` (`major_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_STUDENT_STUDENTMAJORS`
    FOREIGN KEY (`student`)
    REFERENCES `Student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DegreeLevel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DegreeLevel` ;

CREATE TABLE IF NOT EXISTS `DegreeLevel` (
  `degreeLevel_id` TINYINT NOT NULL AUTO_INCREMENT,
  `level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`degreeLevel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Degree`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Degree` ;

CREATE TABLE IF NOT EXISTS `Degree` (
  `degree_id` TINYINT NOT NULL AUTO_INCREMENT,
  `major` TINYINT NOT NULL,
  `level` TINYINT NOT NULL,
  PRIMARY KEY (`degree_id`, `major`),
  INDEX `FK_MAJOR_DEGREE_idx` (`major` ASC) VISIBLE,
  INDEX `FK_DEGREELEVEL_DEGREE_idx` (`level` ASC) VISIBLE,
  CONSTRAINT `FK_MAJOR_DEGREE`
    FOREIGN KEY (`major`)
    REFERENCES `Major` (`major_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_DEGREELEVEL_DEGREE`
    FOREIGN KEY (`level`)
    REFERENCES `DegreeLevel` (`degreeLevel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Course` ;

CREATE TABLE IF NOT EXISTS `Course` (
  `course_id` TINYINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `units` TINYINT NOT NULL,
  `department` TINYINT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `FK_PK_DEPARTMENT_COURSE_idx` (`department` ASC) VISIBLE,
  CONSTRAINT `FK_PK_DEPARTMENT_COURSE`
    FOREIGN KEY (`department`)
    REFERENCES `Department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GERequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GERequirements` ;

CREATE TABLE IF NOT EXISTS `GERequirements` (
  `geReq_id` TINYINT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(45) NOT NULL,
  `division` VARCHAR(45) NOT NULL,
  `units_required` TINYINT NOT NULL,
  PRIMARY KEY (`geReq_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CollegeRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CollegeRequirements` ;

CREATE TABLE IF NOT EXISTS `CollegeRequirements` (
  `collegeReq_id` TINYINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  `units_required` TINYINT NOT NULL,
  PRIMARY KEY (`collegeReq_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseAttributes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CourseAttributes` ;

CREATE TABLE IF NOT EXISTS `CourseAttributes` (
  `attribute_id` TINYINT NOT NULL AUTO_INCREMENT,
  `course_id` TINYINT NOT NULL,
  `GEReq` TINYINT NULL,
  `coreReq` TINYINT NULL,
  `collegeReq` TINYINT NULL,
  PRIMARY KEY (`attribute_id`, `course_id`),
  INDEX `FK_COLLEGEREQUIREMENT_COURSEATTRIBUTE_idx` (`collegeReq` ASC) VISIBLE,
  INDEX `FK_GEREQUIREMENT_COURSEATTRIBUTES_idx` (`GEReq` ASC) VISIBLE,
  INDEX `FK_COREREQUIREMENT_COURSEATTRIBUTES_idx` (`coreReq` ASC) VISIBLE,
  INDEX `FK_COURSE_COURSEATTRIBUTE_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `FK_GEREQUIREMENT_COURSEATTRIBUTES`
    FOREIGN KEY (`GEReq`)
    REFERENCES `GERequirements` (`geReq_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_COREREQUIREMENT_COURSEATTRIBUTES`
    FOREIGN KEY (`coreReq`)
    REFERENCES `CoreRequirements` (`coreReq_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_COLLEGEREQUIREMENT_COURSEATTRIBUTE`
    FOREIGN KEY (`collegeReq`)
    REFERENCES `CollegeRequirements` (`collegeReq_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_COURSE_COURSEATTRIBUTE`
    FOREIGN KEY (`course_id`)
    REFERENCES `Course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DegreeRequirements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DegreeRequirements` ;

CREATE TABLE IF NOT EXISTS `DegreeRequirements` (
  `degreeReq_id` TINYINT NOT NULL,
  `degree_id` TINYINT NOT NULL,
  `GE_id` TINYINT NULL,
  `core_req` TINYINT NULL,
  `college_req` TINYINT NULL,
  PRIMARY KEY (`degreeReq_id`, `degree_id`),
  INDEX `FK_DEGREE_DEGREEREQUIREMENT_idx` (`degree_id` ASC) VISIBLE,
  INDEX `FK_GEREQUIREMENT_DEGREEREQUIREMENT_idx` (`GE_id` ASC) VISIBLE,
  INDEX `FK_COREREQUIREMENT_DEGREEREQUIREMENT_idx` (`core_req` ASC) VISIBLE,
  INDEX `FK_COLLEGEREQUIREMENT_DEGREEREQUIREMENT_idx` (`college_req` ASC) VISIBLE,
  CONSTRAINT `FK_DEGREE_DEGREEREQUIREMENT`
    FOREIGN KEY (`degree_id`)
    REFERENCES `Degree` (`degree_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_GEREQUIREMENT_DEGREEREQUIREMENT`
    FOREIGN KEY (`GE_id`)
    REFERENCES `GERequirements` (`geReq_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_COREREQUIREMENT_DEGREEREQUIREMENT`
    FOREIGN KEY (`core_req`)
    REFERENCES `CoreRequirements` (`coreReq_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_COLLEGEREQUIREMENT_DEGREEREQUIREMENT`
    FOREIGN KEY (`college_req`)
    REFERENCES `CollegeRequirements` (`collegeReq_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Semesters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Semesters` ;

CREATE TABLE IF NOT EXISTS `Semesters` (
  `semester_id` TINYINT NOT NULL,
  `semester` VARCHAR(20) NOT NULL,
  `year` YEAR NOT NULL,
  PRIMARY KEY (`semester_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Enrollment` ;

CREATE TABLE IF NOT EXISTS `Enrollment` (
  `student` TINYINT(9) NOT NULL,
  `course` TINYINT NOT NULL,
  `semester` TINYINT NOT NULL,
  INDEX `FK_STUDENT_ENROLLMENT_idx` (`student` ASC) VISIBLE,
  INDEX `FK_COURSE_ENROLLMENT_idx` (`course` ASC) VISIBLE,
  PRIMARY KEY (`course`, `student`, `semester`),
  INDEX `FK_SEMESTER_ENROLLMENT_idx` (`semester` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_ENROLLMENT`
    FOREIGN KEY (`student`)
    REFERENCES `Student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_COURSE_ENROLLMENT`
    FOREIGN KEY (`course`)
    REFERENCES `Course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_SEMESTER_ENROLLMENT`
    FOREIGN KEY (`semester`)
    REFERENCES `Semesters` (`semester_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sections`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sections` ;

CREATE TABLE IF NOT EXISTS `Sections` (
  `section_id` TINYINT NOT NULL AUTO_INCREMENT,
  `course_id` TINYINT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `instructor` TINYINT NULL,
  `room` TINYINT NULL,
  PRIMARY KEY (`section_id`, `course_id`),
  INDEX `FK_FACULTY_SECTION_idx` (`instructor` ASC) VISIBLE,
  INDEX `FK_COURSE_SECTION_idx` (`course_id` ASC) VISIBLE,
  INDEX `FK_ROOM_SECTION_idx` (`room` ASC) VISIBLE,
  CONSTRAINT `FK_COURSE_SECTION`
    FOREIGN KEY (`course_id`)
    REFERENCES `Course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_FACULTY_SECTION`
    FOREIGN KEY (`instructor`)
    REFERENCES `Faculty` (`faculty_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ROOM_SECTION`
    FOREIGN KEY (`room`)
    REFERENCES `Room` (`room_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timeslot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timeslot` ;

CREATE TABLE IF NOT EXISTS `Timeslot` (
  `timeslot_id` TINYINT NOT NULL AUTO_INCREMENT,
  `start` TIMESTAMP NOT NULL,
  `end` TIMESTAMP NOT NULL,
  PRIMARY KEY (`timeslot_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WorkingDays`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WorkingDays` ;

CREATE TABLE IF NOT EXISTS `WorkingDays` (
  `day` CHAR(2) NOT NULL,
  `description` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`day`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClassSchedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ClassSchedule` ;

CREATE TABLE IF NOT EXISTS `ClassSchedule` (
  `schedule_id` TINYINT NOT NULL AUTO_INCREMENT,
  `section` TINYINT NOT NULL,
  `timeslot` TINYINT NULL,
  `day` CHAR(2) NULL,
  PRIMARY KEY (`schedule_id`, `section`),
  INDEX `FK_SECTION_CLASSSCHEDULE_idx` (`section` ASC) VISIBLE,
  INDEX `FK_TIMESLOT_CLASSSCHEDULE_idx` (`timeslot` ASC) VISIBLE,
  INDEX `FK_WORKINGDAY_CLASSSCHEDULE_idx` (`day` ASC) VISIBLE,
  CONSTRAINT `FK_TIMESLOT_CLASSSCHEDULE`
    FOREIGN KEY (`timeslot`)
    REFERENCES `Timeslot` (`timeslot_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_WORKINGDAY_CLASSSCHEDULE`
    FOREIGN KEY (`day`)
    REFERENCES `WorkingDays` (`day`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `FK_SECTION_CLASSSCHEDULE`
    FOREIGN KEY (`section`)
    REFERENCES `Sections` (`section_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Transcripts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Transcripts` ;

CREATE TABLE IF NOT EXISTS `Transcripts` (
  `transcript_id` TINYINT NOT NULL AUTO_INCREMENT,
  `units_taken` TINYINT NOT NULL,
  `student_id` TINYINT(9) NOT NULL,
  `filepath` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transcript_id`),
  INDEX `FK_STUDENT_TRANSCRIPT_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_TRANSCRIPT`
    FOREIGN KEY (`student_id`)
    REFERENCES `Student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Honors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Honors` ;

CREATE TABLE IF NOT EXISTS `Honors` (
  `honor_id` TINYINT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`honor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HonorsStudents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HonorsStudents` ;

CREATE TABLE IF NOT EXISTS `HonorsStudents` (
  `honorStudent_id` TINYINT NOT NULL AUTO_INCREMENT,
  `honor_id` TINYINT NOT NULL,
  `student_id` TINYINT(9) NOT NULL,
  `award_date` DATE NOT NULL,
  PRIMARY KEY (`honorStudent_id`),
  INDEX `FK_HONOR_HONORSTUDENTS_idx` (`honor_id` ASC) VISIBLE,
  INDEX `FK_STUDENT_HONORSTUDENTS_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_HONORSTUDENTS`
    FOREIGN KEY (`student_id`)
    REFERENCES `Student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_HONOR_HONORSTUDENTS`
    FOREIGN KEY (`honor_id`)
    REFERENCES `Honors` (`honor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Grants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grants` ;

CREATE TABLE IF NOT EXISTS `Grants` (
  `grant_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `amount` DECIMAL(7,2) NOT NULL,
  `provider` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`grant_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GrantRecipients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GrantRecipients` ;

CREATE TABLE IF NOT EXISTS `GrantRecipients` (
  `receipent_id` TINYINT NOT NULL AUTO_INCREMENT,
  `student` TINYINT(9) NOT NULL,
  `grant` TINYINT NOT NULL,
  `award_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`receipent_id`),
  INDEX `FK_STUDENT_GRANTRECIPIENT_idx` (`student` ASC) VISIBLE,
  INDEX `FK_GRANTS_GRANTRECIPIENT_idx` (`grant` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_GRANTRECIPIENT`
    FOREIGN KEY (`student`)
    REFERENCES `Student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_GRANTS_GRANTRECIPIENT`
    FOREIGN KEY (`grant`)
    REFERENCES `Grants` (`grant_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fees` ;

CREATE TABLE IF NOT EXISTS `Fees` (
  `fee_id` TINYINT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(7,2) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseFees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CourseFees` ;

CREATE TABLE IF NOT EXISTS `CourseFees` (
  `course_fee_id` TINYINT NOT NULL AUTO_INCREMENT,
  `course` TINYINT NOT NULL,
  `fee` TINYINT NOT NULL,
  PRIMARY KEY (`course_fee_id`),
  INDEX `FK_COURSE_COURSEFEES_idx` (`course` ASC) VISIBLE,
  INDEX `FK_FEE_COURSEFEES_idx` (`fee` ASC) VISIBLE,
  CONSTRAINT `FK_COURSE_COURSEFEES`
    FOREIGN KEY (`course`)
    REFERENCES `Course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_FEE_COURSEFEES`
    FOREIGN KEY (`fee`)
    REFERENCES `Fees` (`fee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentFees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `StudentFees` ;

CREATE TABLE IF NOT EXISTS `StudentFees` (
  `student_fee_id` TINYINT NOT NULL AUTO_INCREMENT,
  `student` TINYINT(9) NOT NULL,
  `fee` TINYINT NOT NULL,
  `date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`student_fee_id`),
  INDEX `FK_STUDENT_STUDENTFEES_idx` (`student` ASC) VISIBLE,
  INDEX `FK_FEE_STUDENTFEES_idx` (`fee` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_STUDENTFEES`
    FOREIGN KEY (`student`)
    REFERENCES `Student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_FEE_STUDENTFEES`
    FOREIGN KEY (`fee`)
    REFERENCES `Fees` (`fee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseBySemester`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CourseBySemester` ;

CREATE TABLE IF NOT EXISTS `CourseBySemester` (
  `course_by_sem_id` TINYINT NOT NULL AUTO_INCREMENT,
  `course` TINYINT NOT NULL,
  `semester` TINYINT NOT NULL,
  PRIMARY KEY (`course_by_sem_id`),
  INDEX `FK_COURSE_COURSEBYSEMESTER_idx` (`course` ASC) VISIBLE,
  INDEX `FK_SEMESTERS_COURSEBYSEMESTER_idx` (`semester` ASC) VISIBLE,
  CONSTRAINT `FK_COURSE_COURSEBYSEMESTER`
    FOREIGN KEY (`course`)
    REFERENCES `Course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_SEMESTERS_COURSEBYSEMESTER`
    FOREIGN KEY (`semester`)
    REFERENCES `Semesters` (`semester_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CourseEvaluations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CourseEvaluations` ;

CREATE TABLE IF NOT EXISTS `CourseEvaluations` (
  `evaluation_id` TINYINT NOT NULL AUTO_INCREMENT,
  `course` TINYINT NOT NULL,
  `faculty` TINYINT NOT NULL,
  `filepath` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`evaluation_id`),
  INDEX `FK_COURSE_COURSEEVALUATION_idx` (`course` ASC) VISIBLE,
  INDEX `FK_FACULTY_COURSEEVALUATION_idx` (`faculty` ASC) VISIBLE,
  CONSTRAINT `FK_COURSE_COURSEEVALUATION`
    FOREIGN KEY (`course`)
    REFERENCES `Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `FK_FACULTY_COURSEEVALUATION`
    FOREIGN KEY (`faculty`)
    REFERENCES `Faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Prerequisites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Prerequisites` ;

CREATE TABLE IF NOT EXISTS `Prerequisites` (
  `course_id` TINYINT NOT NULL,
  `prereq` TINYINT NOT NULL,
  `condition` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `FK_PREREQUISITECOURSE_PREREQUISITE_idx` (`prereq` ASC) VISIBLE,
  CONSTRAINT `FK_COURSE_PREREQUISITE`
    FOREIGN KEY (`course_id`)
    REFERENCES `Course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PREREQUISITECOURSE_PREREQUISITE`
    FOREIGN KEY (`prereq`)
    REFERENCES `Course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DepartmentChair`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DepartmentChair` ;

CREATE TABLE IF NOT EXISTS `DepartmentChair` (
  `deptChair_id` TINYINT NOT NULL,
  `department_id` TINYINT NOT NULL,
  `faculty_id` TINYINT NOT NULL,
  PRIMARY KEY (`deptChair_id`),
  INDEX `FK_DEPARTMENT_DEPARTMENTCHAIR_idx` (`department_id` ASC) VISIBLE,
  INDEX `FK_FACULTY_DEPARTMENTCHAIR_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `FK_DEPARTMENT_DEPARTMENTCHAIR`
    FOREIGN KEY (`department_id`)
    REFERENCES `Department` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_FACULTY_DEPARTMENTCHAIR`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `Faculty` (`faculty_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DELIMITER $$
-- Triggers:
-- 		1 - Check if student has met prerequisite before enrolling (Use Case #1)
 CREATE TRIGGER addCourse BEFORE INSERT ON Enrollment
 FOR EACH ROW
 	BEGIN
 		DECLARE prerequisite_exist INT; -- flag for whether course has prereq
        DECLARE prerequisite_taken INT; -- flag for whether prereq was taken
 		DECLARE prerequisite TINYINT; -- prerequisite for course to be enrolled in
        -- Check if course has a prequisite
        SET prerequisite_exist = (SELECT COUNT(*) FROM Prerequisites WHERE course_id = new.course);
        IF (prerequisite_exist > 0) THEN
			-- Find the prerequisite of course
 			SET prerequisite = (SELECT prereqOf FROM Prerequisites WHERE course_id = new.course);
            -- Check if student has taken the course
 			SET prerequisite_taken = (SELECT COUNT(*) FROM Enrollment WHERE course = prerequisite);
            IF (prerequisite_taken > 0) THEN
				-- Procced with enrollment
                INSERT INTO Enrollment (student, course) VALUES (new.student, new.course);
            END IF;
        END IF;
    END $$

-- 		2 - Update student fees when they enroll in a class
 CREATE TRIGGER updateStudentFee AFTER INSERT ON Enrollment
 FOR EACH ROW
 	BEGIN
 			DECLARE courseFee_exist INT; -- flag for whether course has fee
            DECLARE courseFee TINYINT; -- The course fee

            -- Check if course has fees
            SET courseFee_exist = (SELECT COUNT(*) FROM CourseFees WHERE course = new.course);
            IF(courseFee_exist > 0) THEN
				-- Find course fee
                SET courseFee = (SELECT fee FROM CourseFees WHERE course = new.course);
                -- Charge student the course fee
                INSERT INTO StudentFees (student, fee, date) VALUES (new.student, courseFee, current_timestamp());
 			END IF;
     END $$


-- Procedures
-- 		1 - Find the number of students enrolled in a course for a given semester
 CREATE PROCEDURE numStudentsInCourse(IN courseid TINYINT, OUT numStudents INT)
 BEGIN
	 DECLARE num INT; -- number of students
     SET numStudents = (SELECT COUNT(*) FROM Enrollment WHERE course = courseid);
 END $$



-- Functions
-- 		1 - Return the student balance for a student
 CREATE FUNCTION studentBalance (stud TINYINT)
 RETURNS DECIMAL(7,2)
 DETERMINISTIC
 BEGIN
 	DECLARE totalFees DECIMAL(7,2); -- total fees charged to student
     DECLARE totalGrants DECIMAL(7,2); -- total grants awarded to student
     DECLARE balance DECIMAL(7,2); -- student balance
     -- Step 1 - Calculate total fees
     SET totalFees = (SELECT SUM(fee.amount) FROM Fees fee JOIN StudentFees studentFee ON studentFee.fee = fee.fee_id WHERE studentFee.student = stud);
     -- Step 2 - Calculate total grants
	 SET totalGrants = (SELECT SUM(`grant`.amount) FROM Grants `grant` JOIN GrantRecipients grantRecipient ON grantRecipient.`grant` = `grant`.grant_id WHERE grantRecipient.student = stud);
     -- Step 3 - Calculate remaining balance
     -- SET totalGrants = 0.0;
 	 SET balance = totalGrants - totalFees;
     RETURN balance;
 END $$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
