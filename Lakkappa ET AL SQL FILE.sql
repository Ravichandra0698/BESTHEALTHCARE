
/* Batch-4 Database
Professor Virginia Ilie
2/15/2023
Use the Lakkappa et al database */

-- Creating a Database
CREATE DATABASE [Lakkappa et al];

-- Creating Patients Table

CREATE TABLE Patients (Patient_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50),
Date_of_Birth Date NOT NULL,
Street varchar(50),
City varchar(50),
[State] varchar(50),
ZipCode int,
Phone_Number int NOT NULL,
Mail_ID varchar(50),
Relation_to_Patient varchar(50),
ContactPerson_FirstName varchar(50),
ContactPerson_LastName varchar(50),
ContactPerson_Address varchar(100),
Insurance_Company_Name varchar(50),
Insurance_Number int,
Group_Number int,
Insurance_Contact_Number int
)

select * from Patients;
-----------------------------------------------------------------------

-- Creating Campuses Table

CREATE TABLE Campuses (Campus_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
[Name] varchar(50) NOT NULL,
Street varchar(50) NOT NULL,
City varchar(50) NOT NULL,
[State] varchar(50) NOT NULL,
ZipCode int NOT NULL,
Contact_Number int NOT NULL,
Mail_ID varchar(50) NOT NULL,
Website varchar(50)
)
select * from Campuses
---------------------------------------

-- Creating Services Table

CREATE TABLE Services (Service_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Service_Type varchar(50) NOT NULL,
Service_Description varchar(250) NOT NULL
)

select * from Services

---------------------------------------

-- Creating Staff Table

CREATE TABLE Staff (Staff_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50) NOT NULL,
Date_of_Birth Date NOT NULL,
Mail_ID varchar(50),
Phone_Number int NOT NULL,
Street varchar(50) NOT NULL,
City varchar(50) NOT NULL,
[State] varchar(50) NOT NULL,
Country varchar(50) NOT NULL,
ZipCode int NOT NULL,
Staff_Type Varchar(15) NOT NULL,
Campus_ID int,
FOREIGN KEY (Campus_ID) REFERENCES CAMPUSES(Campus_ID)
)
select * from Staff
-------------------------------------------------

-- Creating Nurses Table

CREATE TABLE Nurses (Staff_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Lincence_no varchar(25) NOT NULL,
National_Certificate varchar(50) NOT NULL,
Position varchar(50) NOT NULL,
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
)
select * from Nurses

-------------------------------------------------

-- Creating Doctor Table

CREATE TABLE Doctor (Staff_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Specialization varchar(50) NOT NULL,
Credentials varchar(50) NOT NULL,
Board_Certificate varchar(50) NOT NULL,
DEA_Number int NOT NULL,
Graduation varchar(50) NOT NULL,
Graduation_Year int NOT NULL,
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
)

select * from Doctor

------------------------------------

-- Creating Medications Table

CREATE TABLE Medications (Medication_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
[Name] varchar(50) NOT NULL,
Price decimal(10,2) NOT NULL,
Medication_Type varchar(50) NOT NULL,
Manufacturer varchar(50) NOT NULL,
[Description] varchar(250) NOT NULL
)

select * from Medications

--------------------------------------------------

-- Creating Diagnosis Table

CREATE TABLE Diagnosis (Diagnosis_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Diagnosis_Name varchar(50) NOT NULL,
Diagnosis_Code int NOT NULL,
Diagnosis_Description varchar(250) NOT NULL
)

-----------------------------------------------
	
-- Creating Pharmacy Table

CREATE TABLE Pharmacy (Pharmacy_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
[Name] varchar(50) NOT NULL,
Street varchar(50) NOT NULL,
City varchar(50) NOT NULL,
[State] varchar(50) NOT NULL,
Country varchar(50) NOT NULL,
ZipCode int NOT NULL,
Mail_ID varchar(50),
Phone_Number int NOT NULL,
Fax int
)

------------------------------------------------
	
-- Creating Orders Table

CREATE TABLE Orders (Order_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Order_Time Time NOT NULL,
Date_of_Order Date NOT NULL,
Order_Instructions varchar(250) NOT NULL,
Staff_ID int,
Pharmacy_ID int,
FOREIGN KEY (Staff_ID) REFERENCES Doctor(Staff_ID),
FOREIGN KEY (Pharmacy_ID) REFERENCES Pharmacy(Pharmacy_ID)
)

select * from Orders

--------------------------------------------------------------
	
-- Creating Diagnosis_Orders Table

CREATE TABLE Diagnosis_Orders (Diagnosis_Order_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Diagnosis_ID int,
Order_ID int,
FOREIGN KEY (Diagnosis_ID) REFERENCES Diagnosis(Diagnosis_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
)

select * from Diagnosis_Orders

-------------------------------------------------------

-- Creating Order_Medication Table

CREATE TABLE Order_Medication (Orders_Medication_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Medication_ID int,
Order_ID int,
Quantity Int  NOT NULL,
Dosage varchar(50) NOT NULL,
FOREIGN KEY (Medication_ID) REFERENCES Medications(Medication_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
)

-----------------------------------------------------

-- Creating Patient_Doctor Table

CREATE TABLE Patient_Doctor (Patient_Doctor_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Patient_ID int,
Staff_ID int,
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
FOREIGN KEY (Staff_ID) REFERENCES Doctor(Staff_ID)
)

--------------------------------------------------

-- Creating Room Table

CREATE TABLE Room (Room_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Room_Type varchar(50) NOT NULL,
Room_Size nvarchar(50) NOT NULL,
Campus_ID int,
FOREIGN KEY (Campus_ID) REFERENCES Campuses(Campus_ID)
)

Select * from Room

-------------------------

-- Creating Equipment Table

CREATE TABLE Equipment (Equipment_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Equipment_Type varchar(50) NOT NULL,
Serial_Number varchar(50) NOT NULL,
Room_ID int,
FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
)

Select * from Equipment

-------------------------------------------------------

-- Creating Nurse_Assessment Table

CREATE TABLE Nurse_Assessment (Nurse_Assessment_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Staff_ID int,
Patient_ID int,
Temperature varchar(50) NOT NULL,
[Weight] varchar(50) NOT NULL,
Blood_Pressure varchar(50) NOT NULL,
Pulse varchar(50) NOT NULL,
[Date] Date NOT NULL,
FOREIGN KEY (Staff_ID) REFERENCES Nurses(Staff_ID),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
)

Select * from Nurse_Assessment

----------------------------------------

-- Creating Patient_Visit Table

CREATE TABLE Patient_Visit (Patient_Visit_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Patient_ID int,
Campus_ID int,
Reason varchar(50) NOT NULL,
Comments varchar(50) NOT NULL,
[Date] Date,

FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
FOREIGN KEY (Campus_ID) REFERENCES Campuses(Campus_ID)
)

select * from Patient_Visit


-----------------------------------------------------------

-- Creating Patient_Doctor Table

CREATE TABLE Patient_Doctor (Patient_Doctor_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Patient_ID int,
Staff_ID int,

FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
FOREIGN KEY (Staff_ID) REFERENCES Doctor(Staff_ID)
)
select * from Patient_Doctor

---------------------------------------------------------------

-- Creating Campus_Services Table

CREATE TABLE Campus_Services (Campus_Services_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Service_ID int,
Campus_ID int,

FOREIGN KEY (Service_ID) REFERENCES Services(Service_ID),
FOREIGN KEY (Campus_ID) REFERENCES Campuses(Campus_ID)
)
select * from Campus_Services


----------------------------------------------------------------------
--iNSERTING DATA INTO TABLES
-----------------------------------------------------------------------

INSERT INTO Patients (First_Name, Last_Name, Date_of_Birth, Street, City, [State],
                      ZipCode, Phone_Number, Mail_ID, Relation_to_Patient, ContactPerson_FirstName, 
					  ContactPerson_LastName, ContactPerson_Address, Insurance_Company_Name, 
					  Insurance_Number, Group_Number, Insurance_Contact_Number)
VALUES ('John', 'Doe', '1990-01-01', '123 Main St', 'Anytown', 'CA', 12345, 555441234, 
        'johndoe@email.com', 'self', NULL, NULL, NULL, 'ABC Insurance', 98765, 12345, 555884321);
INSERT INTO Patients (First_Name, Last_Name, Date_of_Birth, Street, City, [State],
                      ZipCode, Phone_Number, Mail_ID, Relation_to_Patient, ContactPerson_FirstName, 
					  ContactPerson_LastName, ContactPerson_Address, Insurance_Company_Name, 
					  Insurance_Number, Group_Number, Insurance_Contact_Number)
VALUES ('Jane', 'Smith', '1985-03-15', '456 Elm St', 'Someville', 'NY', 23456, 555085678, 
		'janesmith@email.com', 'wife', 'John', 'Doe', '123 Main St', 'XYZ Insurance', 87654, 23456, 555078765);
INSERT INTO Patients (First_Name, Last_Name, Date_of_Birth, Street, City, [State],
                      ZipCode, Phone_Number, Mail_ID, Relation_to_Patient, ContactPerson_FirstName, 
					  ContactPerson_LastName, ContactPerson_Address, Insurance_Company_Name, 
					  Insurance_Number, Group_Number, Insurance_Contact_Number)        
VALUES ('William', 'Brown', '1972-11-30', '789 Oak St', 'Everyville', 'IL', 34567, 555122468, 
         'williambrown@email.com', 'brother', 'Jennifer', 'Smith', '456 Elm St', 'DEF Insurance', 76543, 34567, 555873456);
INSERT INTO Patients (First_Name, Last_Name, Date_of_Birth, Street, City, [State],
                      ZipCode, Phone_Number, Mail_ID, Relation_to_Patient, ContactPerson_FirstName, 
					  ContactPerson_LastName, ContactPerson_Address, Insurance_Company_Name, 
					  Insurance_Number, Group_Number, Insurance_Contact_Number)
VALUES  ('Sarah', 'Taylor', '1998-06-22', '321 Pine St', 'Nowhere', 'TX', 45678, 555953456, 
		'sarahtaylor@email.com', 'daughter', 'David', 'Taylor', '321 Pine St', 'GHI Insurance', 65432, 45678, 555986543);
INSERT INTO Patients (First_Name, Last_Name, Date_of_Birth, Street, City, [State],
                      ZipCode, Phone_Number, Mail_ID, Relation_to_Patient, ContactPerson_FirstName, 
					  ContactPerson_LastName, ContactPerson_Address, Insurance_Company_Name, 
					  Insurance_Number, Group_Number, Insurance_Contact_Number)
VALUES  ('Michael', 'Johnson', '1980-09-05', '654 Cedar St', 'Somewhere', 'FL', 56789, 555336789, 
		'michaeljohnson@email.com', 'self', NULL, NULL, NULL, 'JKL Insurance', 54321, 56789, 555637890);
INSERT INTO Patients (First_Name, Last_Name, Date_of_Birth, Street, City, [State],
                      ZipCode, Phone_Number, Mail_ID, Relation_to_Patient, ContactPerson_FirstName, 
					  ContactPerson_LastName, ContactPerson_Address, Insurance_Company_Name, 
					  Insurance_Number, Group_Number, Insurance_Contact_Number)
VALUES('Linda', 'Garcia', '1955-12-18', '987 Maple St', 'Anywhere', 'WA', 67890, 554237890, 
		'lindagarcia@email.com', 'mother', 'Jenny', 'Lee', '159 Laurel St', 'MNO Insurance', 43210, 67890, 555219876);
Select * from Patients;
----------------------------------------------------------------


INSERT INTO Campuses ([Name], Street, City, [State], ZipCode, Contact_Number, Mail_ID, Website)
VALUES
('Thousand Oaks Campus ', '123 Main St', 'Anytown', 'CA', 12345, 5551234, 'info@tocampus.com', 'www.campusa.com'),
('west Lake Campus', '456 Oak St', 'Otherville', 'CA', 67890, 5555678, 'info@Westlakecampus.com', 'www.campusb.com'),
('Santa Rosa Campus', '789 Elm St', 'Someplace', 'CA', 13579, 5559012, 'info@SantaRosacampus.com', 'www.campusc.com'),
('Lynn Ranch Campus', '321 Pine St', 'Nowhere', 'CA', 24680, 5552345, 'info@Lynncampus.com', 'www.campusd.com'),
('Moorpark Campus', '654 Maple St', 'Anytown', 'CA', 13579, 5555678, 'info@Moorparkcampus.com', 'www.campuse.com'),
('Simivalley Campus', '987 Cedar St', 'Otherville', 'CA', 24680, 5559012, 'info@Simivalleycampus.com', 'www.campusf.com'),
('Woodland Hills Campus', '1011 Mulberry St', 'Someplace', 'CA', 46810, 5552345, 'info@Woodlandhillscampus.com', 'www.campusg.com')
Select * from Campuses;
----------------------------------------------------------------


INSERT INTO Staff (First_Name, Last_Name, Date_of_Birth, Mail_ID, Phone_Number, Street, City, [State], Country, ZipCode, Staff_Type, Campus_ID)
VALUES ('John', 'Doe', '1985-05-11', 'john.doe@example.com', 123456789, '123 Main St', 'Los Angeles', 'California', 'USA', 12345, 'Doctor', 1),
('Jane', 'Doe', '1990-10-21', 'jane.doe@example.com', 234567891, '456 Elm St', 'New York', 'New York', 'USA', 23456, 'Nurse', 2),
('Bob', 'Smith', '1975-03-08', 'bob.smith@example.com', 345679012, '789 Oak St', 'Houston', 'Texas', 'USA', 34567, 'Doctor', 3),
('Sarah', 'Johnson', '1988-07-15', 'sarah.johnson@example.com', 567890123, '321 Pine St', 'San Francisco', 'California', 'USA', 45678, 'Nurse', 4),
('James', 'Davis', '1980-12-25', 'james.davis@example.com', 567901234, '654 Maple St', 'Chicago', 'Illinois', 'USA', 56789, 'Doctor', 5),
('Jessica', 'Garcia', '1995-01-31', 'jessica.garcia@example.com', 789012345, '987 Cedar St', 'Los Angeles', 'California', 'USA', 67890, 'Nurse', 6),
('Tom', 'Wilson', '1983-06-12', 'tom.wilson@example.com', 789012356, '852 Birch St', 'Los Angeles', 'California', 'USA', 78901, 'Doctor', 7);
Select * from Staff;
----------------------------------------------------------------

INSERT INTO Orders (Order_Time, Date_of_Order, Order_Instructions, Staff_ID, Pharmacy_ID)
VALUES ('13:30:00', '2023-02-16', 'Take two tablets twice daily', 2, 1),
       ('10:45:00', '2023-02-16', 'Take one tablet daily', 3, 2),
       ('08:15:00', '2023-02-15', 'Apply ointment to affected area twice daily', 4, 3),
       ('14:20:00', '2023-02-14', 'Take one capsule every four hours', 5, 4),
       ('12:00:00', '2023-02-13', 'Take two tablets three times daily', 6, 5),
       ('09:30:00', '2023-02-12', 'Apply cream to affected area as needed', 7, 6),
       ('11:00:00', '2023-02-11', 'Take one tablet before bedtime', 8, 7);
Select * from Orders;
----------------------------------------------------------------

SET  IDENTITY_INSERT Doctor ON

INSERT INTO Doctor (Staff_ID,Specialization, Credentials, Board_Certificate, DEA_Number, Graduation, Graduation_Year)
VALUES (2,'Cardiology', 'M.D.', 'ABIM', 12345, 'University of California', 2010),
       (3,'Pediatrics', 'M.D.', 'ABP', 67890, 'Johns Hopkins University', 2008),
       (4,'Oncology', 'M.D.', 'ABIM', 24680, 'Stanford University', 2015),
       (5,'Neurology', 'M.D.', 'ABPN', 13579, 'Harvard Medical School', 2005),
	   (6,'Obstetrics and Gynecology', 'M.D.', 'ABOG', 55555, 'Yale School of Medicine', 2011),
       (7,'Dermatology', 'M.D.', 'ABD', 99999, 'University of Pennsylvania', 2007),
       (8,'Radiology', 'M.D.', 'ABR', 77777, 'Duke University School of Medicine', 2013);
Select * from Doctor;

----------------------------------------------------------------

INSERT INTO Pharmacy ([Name], Street, City, [State], Country, ZipCode, Mail_ID, Phone_Number, Fax)
VALUES 
('Walgreen Pharmacy', '123 Main St', 'Anytown', 'CA', 'USA', 12345, 'Walgreenpharmacy@gmail.com', 555123433, 5555678),
('Walmart Pharmacy', '456 Oak St', 'Sometown', 'CA', 'USA', 67890, 'walmartpharmacy@yahoo.com', 555234522, 5556789),
('CVS Pharmacy', '789 Maple St', 'Othertown', 'CA', 'USA', 54321, 'cvspharmacy@CVS.com', 555345612, NULL),
('dollar Pharmacy', '321 Pine St', 'Anycity', 'CA', 'USA', 98765, NULL, 555456721, NULL),
('costco Pharmacy', '654 Cedar St', 'Othercity', 'CA', 'USA', 43210, NULL, 555567834, 5557890),
('CVS Pharmacy', '123 Elm St', 'Yourtown', 'CA', 'USA', 24680, 'CVS@CVS.com', 555678954, NULL),
('target Pharmacy', '456 Walnut St', 'Mytown', 'CA', 'USA', 13579, 'TargetPharmacy@target.com', 555789098, 5559012);
Select * from Pharmacy;
----------------------------------------------------------------

INSERT INTO Diagnosis (Diagnosis_Name, Diagnosis_Code, Diagnosis_Description)
VALUES 
('Flu', 12345, 'Viral infection of the respiratory system'),
('Migraine', 54321, 'Headache disorder characterized by recurrent headaches'),
('Pneumonia', 67890, 'Inflammatory condition of the lung affecting primarily the tiny air sacs'),
('Bronchitis', 24680, 'Inflammation of the lining of bronchial tubes'),
('Asthma', 13579, 'Chronic respiratory condition characterized by breathing difficulties'),
('Anemia', 97531, 'Condition in which there are not enough red blood cells or hemoglobin in the blood'),
('Arthritis', 86420, 'Joint inflammation causing pain and stiffness');
Select * from Diagnosis;
----------------------------------------------------------------

INSERT INTO Medications ([Name], Price, Medication_Type, Manufacturer, [Description])
VALUES ('Ibuprofen', 9.99, 'Pain Relief', 'Pfizer', 'Ibuprofen is used to reduce fever'),
       ('Acetaminophen', 7.99, 'Pain Relief', 'Johnson & Johnson', 'Acetaminophen is used to relieve 
	     mild to moderate pain from headaches, muscle aches'),
       ('Amoxicillin', 12.99, 'Antibiotic', 'GlaxoSmithKline', 'Amoxicillin is used to treat many different types 
	   of infections caused by bacteria, such as ear infections'),
      ('Lisinopril', 18.99, 'Blood Pressure', 'Pfizer', 'Lisinopril is used to treat high blood pressure'),
      ('Metformin', 14.99, 'Diabetes', 'Merck', 'Metformin is used with a proper diet and exercise'),
      ('Albuterol', 29.99, 'Respiratory', 'AstraZeneca', 'Albuterol is used to prevent and treat wheezing'),
     ('Simvastatin', 15.99, 'Cholesterol', 'Merck', 'Simvastatin is used along with a proper diet to help lower "bad" 
	 cholesterol')
Select * From Medications;
-------------------------------------------------------------------------------------------------

INSERT INTO Order_Medication (Medication_ID, Order_ID, Quantity, Dosage)
VALUES (1, 3, 15, '20mg'),
       (2, 5, 10, '5mg'),
       (3, 8, 5, '10mg'),
       (4, 7, 20, '15mg'),
       (5, 2, 8, '25mg'),
       (1, 4, 12, '10mg'),
       (6, 5, 7, '50mg'),
       (7, 6, 18, '5mg');
Select * From Order_Medication;

----------------------------------------------------------------------------------------

INSERT INTO Patient_Visit (Patient_ID, Campus_ID, Reason, Comments, Date)
VALUES
(1, 2, 'Routine check-up', 'No concerns', '2022-01-05'),
(3, 1, 'Sore throat', 'Prescribed antibiotics', '2022-01-08'),
(2, 3, 'Fever', 'Advised bed rest', '2022-01-10'),
(4, 4, 'Annual physical', 'All clear', '2022-01-15'),
(5, 5, 'Chest pain', 'Referred to cardiologist', '2022-01-18'),
(6, 6, 'Injury from fall', 'X-ray done, no fractures', '2022-01-20'),
(1, 7, 'Flu-like symptoms', 'Tested positive for flu', '2022-01-25');

SELECT * FROM Patient_Visit

-------------------------------------------------------------

INSERT INTO Services (Service_Type, Service_Description)
VALUES('General Medicine', 'Treatment of common illnesses and injuries'),
('Pediatrics', 'Medical care for infants, children, and adolescents'),
('Dermatology', 'Diagnosis and treatment of skin conditions'),
('Radiology', 'Medical imaging services, including X-rays and CT scans'),
('Cardiology', 'Diagnosis and treatment of heart conditions'),
('Ophthalmology', 'Diagnosis and treatment of eye conditions'),
('Gynecology', 'Medical care for female reproductive health');

SELECT * FROM Services
---------------------------------------------------------------

INSERT INTO Campus_Services (Service_ID, Campus_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(4, 5),
(5, 6),
(6, 2),
(1, 3);

SELECT * FROM Campus_Services







