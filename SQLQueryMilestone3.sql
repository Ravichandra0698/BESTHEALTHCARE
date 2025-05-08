--------------------------------------------------------------------------------------------------------------
-- SQL QUERIES
---------------------------------------------------------------------------------------------------------------
-- 1 QUERY 

SELECT DISTINCT Patient_ID,First_Name,Street,City,[State],Phone_Number 
FROM Patients
ORDER BY [State];

/*[This query select the unique records from
 Patient table(Patient_ID,First_Name,Street,City,State,Phone_Number) 
 SORTED BY the State.]*/


--------------------------------------------------------------------------------------------------------------
-- 2 QUERY 

SELECT Orders.Order_ID,Medications.Medication_ID,SUM(Order_Medication.Quantity) AS [Total_Quantity] 
FROM Orders,Order_Medication,Medications
WHERE Orders.Order_ID = Order_Medication.Order_ID 
AND Order_Medication.Medication_ID = Medications.Medication_ID
GROUP BY Medications.Medication_ID,Order_Medication.Quantity,Orders.Order_ID
ORDER BY Order_Medication.Quantity;

/*[This query fetch information from three tables (Orders, Order_Medication, Medications) where
SUM of (Order_Medication.Quantity) stored as a Total_Quantity WHERE
Order_Medication.Medication_ID = Medications.Medication_ID and it is
GROUP BY Medications.Medication_ID,Order_Medication.Quantity,Orders.Order_ID and
ORDER BY Order_Medication.Quantity]
*/

------------------------------------------------------------------------------------------------
--3 QUERY 

SELECT Order_ID,Order_Time,Pharmacy.Pharmacy_ID,Pharmacy.[Name] 
FROM Orders,Pharmacy
WHERE Orders.Pharmacy_ID= Pharmacy.Pharmacy_ID
ORDER BY Order_Time;

/*[This query fetch information from two tables  
 Order Table(Order_Id,Order_Time) & 
 from Pharmacy Table(Pharmacy_Id,Pharmacy_Name)
 and matches whether Order.Pharmacy_ID = Pharmacy.Pharmacy_ID
 AND its Order by Order_Time].
*/
-------------------------------------------------------------------------------------------------
-- 4 QUERY 

SELECT Patients.Patient_ID,Patients.First_Name, Patient_Visit.Reason,Campuses.Campus_ID
FROM Patients,Patient_Visit,Campuses
WHERE Patients.Patient_ID=Patient_Visit.Patient_ID
AND Patient_Visit.Campus_ID= Campuses.Campus_ID;

/*[This query selects data from three Tables (Patients, Patient_Visit, Campuses) WHERE
Patients.Patient_ID=Patient_Visit.Patient_ID AND
 Patient_Visit.Campus_ID= Campuses.Campus_ID]
*/
--------------------------------------------------------------------------------------------
--5 QUERY 

SELECT Doctor.Staff_ID,Doctor.Specialization,Orders.Order_ID,Orders.Date_of_Order,Medications.[Name],Order_Medication.Quantity 
FROM Doctor,Orders,Order_Medication,Medications
WHERE Doctor.Staff_ID= Orders.Staff_ID
AND Orders.Order_ID= Order_Medication.Order_ID
AND Order_Medication.Medication_ID=Medications.Medication_ID
ORDER BY Orders.Order_ID;

/*[This query selects data from four Tables (Doctor, Orders, Order_Medication, Medications) WHERE
 Doctor.Staff_ID= Orders.Staff_ID AND
 Order_Medication.Medication_ID=Medications.Medication_ID AND
 ORDER BY Orders.Order_ID].
*/
-------------------------------------------------------------------------------------------
--6 QUERY 

SELECT Patients.First_Name AS [PATIENT NAME], Patient_Visit.Reason AS [Reason Of Visit],Campuses.Campus_ID,Services.Service_Type 
FROM Patients,Patient_Visit,Campuses,Campus_Services,Services
WHERE Patients.Patient_ID= Patient_Visit.Patient_ID
AND Patient_Visit.Campus_ID= Campuses.Campus_ID
AND Campuses.Campus_ID=Campus_Services.Campus_ID
AND Campus_Services.Service_ID=Services.Service_ID;

/*[This query selects data from five Tables (Patients, Patient_Visit, Campuses, Campus_Services, Services)  
 WHERE Patients.Patient_ID = Patient_Visit.Patient_ID AND 
 Campuses.Campus_ID=Campus_Services.Campus_ID AND
 Campus_Services.Service_ID=Services.Service_ID].
*/