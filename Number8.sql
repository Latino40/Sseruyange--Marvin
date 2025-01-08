-- Create Patient_Data table
CREATE TABLE Patient_Data (
   Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
   First_Name VARCHAR(50) NOT NULL,
   Last_Name VARCHAR(50) NOT NULL,
   Date_of_Birth DATE NOT NULL,
   Gender ENUM('Male', 'Female', 'Other') NOT NULL,
   Contact_Info VARCHAR(100),
   Address VARCHAR(255)
);
 
-- Create Visit_Record table
CREATE TABLE Visit_Record (
   Visit_ID INT AUTO_INCREMENT PRIMARY KEY,
   Patient_ID INT NOT NULL,
   Visit_Date DATE NOT NULL,
   Reason VARCHAR(255),
   FOREIGN KEY (Patient_ID) REFERENCES Patient_Data(Patient_ID)
);
 
-- Create Treatment_Record table
CREATE TABLE Treatment_Record (
   Treatment_ID INT AUTO_INCREMENT PRIMARY KEY,
   Visit_ID INT NOT NULL,
   Treatment_Description VARCHAR(255),
   Dosage VARCHAR(50),
   FOREIGN KEY (Visit_ID) REFERENCES Visit_Record(Visit_ID)
);
 
-- Create Lab_Test table
CREATE TABLE Lab_Test (
   Test_ID INT AUTO_INCREMENT PRIMARY KEY,
   Visit_ID INT NOT NULL,
   Test_Type VARCHAR(100),
   Results VARCHAR(255),
   FOREIGN KEY (Visit_ID) REFERENCES Visit_Record(Visit_ID)
);
 
-- Create Resource table
CREATE TABLE Resource (
   Resource_ID INT AUTO_INCREMENT PRIMARY KEY,
   Resource_Name VARCHAR(100) NOT NULL,
   Quantity INT NOT NULL,
   Facility_ID INT
);
 
-- Create Supply_Chain table
CREATE TABLE Supply_Chain (
   Supplier_ID INT AUTO_INCREMENT PRIMARY KEY,
   Supplier_Name VARCHAR(100),
   Contact_Info VARCHAR(100),
   Resource_ID INT NOT NULL,
   FOREIGN KEY (Resource_ID) REFERENCES Resource(Resource_ID)
);
 
-- Create User_Role table
CREATE TABLE User_Role (
   Role_ID INT AUTO_INCREMENT PRIMARY KEY,
   Role_Name VARCHAR(50),
   Permissions TEXT
);
 
-- Create Facility_Operations table
CREATE TABLE Facility_Operations (
   Facility_ID INT AUTO_INCREMENT PRIMARY KEY,
   Facility_Name VARCHAR(100),
   Location VARCHAR(100)
);
 
-- Insert sample data into Patient_Data
INSERT INTO Patient_Data (First_Name, Last_Name, Date_of_Birth, Gender, Contact_Info, Address)
VALUES
('John', 'Doe', '1985-01-15', 'Male', 'john.doe@example.com', 'Kampala'),
('Jane', 'Smith', '1990-04-25', 'Female', 'jane.smith@example.com', 'Kampala');
 
-- Insert sample data into Visit_Record
INSERT INTO Visit_Record (Patient_ID, Visit_Date, Reason)
VALUES
(1, '2025-01-01', 'Malaria Check-up'),
(2, '2025-01-02', 'Fever and Headache');
 
-- Insert sample data into Treatment_Record
INSERT INTO Treatment_Record (Visit_ID, Treatment_Description, Dosage)
VALUES
(1, 'Antimalarial Tablets', '2 tablets per day'),
(2, 'Painkillers', '1 tablet per day');
 
-- Insert sample data into Lab_Test
INSERT INTO Lab_Test (Visit_ID, Test_Type, Results)
VALUES
(1, 'Malaria Test', 'Positive'),
(2, 'Blood Test', 'Normal');
 
-- Insert sample data into Resource
INSERT INTO Resource (Resource_Name, Quantity, Facility_ID)
VALUES
('Antimalarial Tablets', 100, 1),
('Gloves', 500, 1);
 
-- Insert sample data into Supply_Chain
INSERT INTO Supply_Chain (Supplier_Name, Contact_Info, Resource_ID)
VALUES
('Medical Supplier Ltd.', 'contact@medsuppliers.com', 1),
('Health Supplies Co.', 'info@healthsupplies.com', 2);
 
-- Insert sample data into User_Role
INSERT INTO User_Role (Role_Name, Permissions)
VALUES
('Admin', 'Full Access'),
('Doctor', 'Read and Write Access');
 
-- Insert sample data into Facility_Operations
INSERT INTO Facility_Operations (Facility_Name, Location)
VALUES
('Victoria University Clinic', 'Central Kampala');
 
-- Query the data to confirm table creation and relationships
-- Show all patients
SELECT * FROM Patient_Data;
 
-- Show all visits
SELECT * FROM Visit_Record;
 
-- Show all treatments
SELECT * FROM Treatment_Record;
 
-- Show all lab tests
SELECT * FROM Lab_Test;
 
-- Show all resources
SELECT * FROM Resource;
 
-- Show all supply chain records
SELECT * FROM Supply_Chain;
 
-- Show all user roles
SELECT * FROM User_Role;
 
-- Show all facility operations
SELECT * FROM Facility_Operations;