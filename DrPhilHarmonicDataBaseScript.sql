# Creating DrPhilHarmonic Database
CREATE DATABASE DrPhilHarmonic;

# DrPhilHarmonic is the DataBase that must be used
USE DrPhilHarmonic;


# Creating a table named Instructor
CREATE OR REPLACE TABLE Instructor
(
    Employee_ID int AUTO_INCREMENT PRIMARY KEY,
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL ,
    Office varchar(10),
    Phone varchar(20) unique
);

# Creating Student table
CREATE OR REPLACE TABLE Student
(
    Student_ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL ,
    Dorm varchar(10),
    Phone varchar(20) UNIQUE
);

# Creating Course Table
CREATE OR REPLACE TABLE Course
(
    Course_Number char(9) PRIMARY KEY ,
    Title varchar(15) NOT NULL ,
    Hours INTEGER NOT NULL
);

# Creating Section Table
CREATE OR REPLACE TABLE Section
(
    Call_No char(5) NOT NULL,
    CONSTRAINT PRIMARY KEY (Call_No),
    Employee_id int,
    CONSTRAINT FOREIGN KEY (Employee_ID) REFERENCES Instructor(Employee_ID),
    Course_Number char(9),
    CONSTRAINT FOREIGN KEY (Course_Number) REFERENCES Course(Course_Number)
);

# Creating Enrollment Table
CREATE OR REPLACE TABLE Enrollment
(
    Call_No char(5) NOT NULL ,
    Student_ID int NOT NULL ,
    CONSTRAINT FOREIGN KEY (Call_No) REFERENCES Section(Call_No),
    CONSTRAINT  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    CONSTRAINT PRIMARY KEY (Call_No, Student_ID),
    FinalGrade double CHECK ( FinalGrade >= 0 AND FinalGrade <= 100)
);