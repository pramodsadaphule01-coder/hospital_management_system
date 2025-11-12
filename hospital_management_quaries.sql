# 1. Write a query in SQL to obtain the name of the physician in alphabetical order. 

SELECT NAME AS PHYSICIAN_NAME
FROM PHYSICIAN
ORDER BY NAME;
+----------------+
| PHYSICIAN_NAME |
+----------------+
| Dr.Aaliyah     |
| Dr.Alexis      |
| Dr.Ariya       |
| Dr.Berkley     |
| Dr.Bob         |
| Dr.Brynn       |
| Dr.Cali        |
| Dr.Cedric      |
| Dr.Dallas      |
| Dr.Elliot      |
| Dr.Estella     |
| Dr.Gavin       |
| Dr.Imani       |
| Dr.Jamison     |
| Dr.Jaxson      |
| Dr.Jesse       |
| Dr.John        |
| Dr.John        |
| Dr.Keith       |
| Dr.kiran       |
| Dr.Luca        |
| Dr.Mabel       |
| Dr.Molly       |
| Dr.Nancy       |
| Dr.Nico        |
| Dr.Odin        |
| Dr.Percival    |
| Dr.Remy        |
| Dr.Richard     |
| Dr.Robert      |
| Dr.Rosalie     |
| Dr.Saige       |
| Dr.Scott       |
| Dr.Todd        |
| Dr.Willow      |
+----------------+
35 rows in set (0.00 sec)


#2. Write a query in SQL to obtain the fullname of the patients whose gender is male.

SELECT CONCAT(NAME,' ',SURNAME) AS Patients_Fullname,GENDER
FROM PATIENT
WHERE GENDER = 'MALE';
+--------------------+--------+
| Patients_Fullname  | GENDER |
+--------------------+--------+
| John Smith         | Male   |
| Remo Xavier        | Male   |
| Dennis Doe         | Male   |
| John Smith         | Male   |
| Michael Williams   | Male   |
| David Jones        | Male   |
| Christopher Wilson | Male   |
| Matthew Martinez   | Male   |
| Daniel Garcia      | Male   |
| James Lopez        | Male   |
| Joshua Perez       | Male   |
| Ryan Flores        | Male   |
| Andrew Cruz        | Male   |
| Justin Morales     | Male   |
| Brandon Nguyen     | Male   |
| Austin Green       | Male   |
| Tyler Baker        | Male   |
| Dylan Ward         | Male   |
| Ethan Rivera       | Male   |
| Noah Diaz          | Male   |
| Mason Powell       | Male   |
+--------------------+--------+

#3 Write a query to obtain name and cost of the procedure whose cost is greater than 2000.

SELECT NAME as Procedure_Name,COST as Procedure_Cost 
FROM PROCEDURES
WHERE NOT COST < 2000;
+-------------------------------+----------------+
| Procedure_Name                | Procedure_Cost |
+-------------------------------+----------------+
| MRI-Brain                     |           5000 |
| MRI-Spine                     |           6000 |
| CT Scan-Abdomen               |           3000 |
| CT Scan-Pelvis                |           3500 |
| Ultrasound-Obstetric          |           2500 |
| PET-CT Scan                   |           5000 |
| Fluoroscopy - Upper GI Series |           7000 |
| Fluoroscopy - Barium Enema    |           4500 |
| MRI-Knee                      |           4000 |
+-------------------------------+----------------+
9 rows in set (0.00 sec)

#4. Write a query to update the name of the patient to Robert Fernandez having patientid as 5.

UPDATE PATIENT
SET NAME = 'Robert',SURNAME = 'Fernandez'
WHERE PATIENT_ID = 5;

Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

#5. Second maximum cost of medical procedure

SELECT NAME,MAX(COST) as Procedure_cost
FROM PROCEDURES 
GROUP BY name
ORDER BY Procedure_cost DESC
LIMIT 1,1;

+-----------+----------------+
| NAME      | Procedure_cost |
+-----------+----------------+
| MRI-Spine |           6000 |
+-----------+----------------+
1 row in set (0.00 sec)

#6.  Write a query in SQL to obtain the name of the physicians who are the head of each department

select p.name as Doctor_name,d.dept_name
from physician p
inner join department d
on p.employeeid = d.head;
+-------------+------------------+
| Doctor_name | dept_name        |
+-------------+------------------+
| Dr.Percival | General Medicine |
| Dr.John     | Surgery          |
| Dr.Molly    | Psychiatry       |
| Dr.Nancy    | Cardiology       |
| Dr.Imani    | Nephrology       |
| Dr.Robert   | Urology          |
| Dr.Ariya    | Neurology        |
| Dr.Nico     | Physiotherapy    |
| Dr.Mabel    | ENT              |
| Dr.Bob      | Pulmonology      |
| Dr.Remy     | Gastroenterology |
| Dr.Scott    | Gynecology       |
| Dr.Jesse    | Neonatal         |
| Dr.Alexis   | Critical care    |
| Dr.Cali     | Orthopedics      |
+-------------+------------------+
15 rows in set (0.01 sec)

#7. Write a query in SQL to obtain the name of the patients with their physicians by whom they got their preliminary treatement

select CONCAT(p.name,' ',p.SURNAME) as PATIENT_NAME,ph.NAME as PHY_WHO_DID_PRI_TREATMENT
FROM PATIENT p
LEFT JOIN PHYSICIAN ph
ON p.PRIMARY_CHECK = ph.EMPLOYEEID;
+--------------------+---------------------------+
| PATIENT_NAME       | PHY_WHO_DID_PRI_TREATMENT |
+--------------------+---------------------------+
| John Smith         | Dr.Elliot                 |
| Grace Ritchie      | Dr.Elliot                 |
| Remo Xavier        | Dr.Molly                  |
| Dennis Doe         | Dr.Rosalie                |
| Robert Fernandez   | Dr.Gavin                  |
| Emily Johnson      | Dr.John                   |
| Michael Williams   | Dr.Nancy                  |
| Sarah Brown        | Dr.Alexis                 |
| David Jones        | Dr.Dallas                 |
| Jessica Davis      | Dr.Aaliyah                |
| Christopher Wilson | Dr.Bob                    |
| Ashley Taylor      | Dr.Jamison                |
| Matthew Martinez   | Dr.kiran                  |
| Samantha Anderson  | Dr.Remy                   |
| Daniel Garcia      | Dr.Todd                   |
| Amanda Hernandez   | Dr.Aaliyah                |
| James Lopez        | Dr.Mabel                  |
| Jennifer Gonzalez  | Dr.Estella                |
| Joshua Perez       | Dr.Todd                   |
| Brittany Torres    | Dr.Odin                   |
| Ryan Flores        | Dr.Dallas                 |
| Lauren Ramirez     | Dr.Todd                   |
| Andrew Cruz        | Dr.Alexis                 |
| Nicole Scott       | Dr.Aaliyah                |
| Justin Morales     | Dr.Gavin                  |
| Stephanie Reed     | Dr.Dallas                 |
| Brandon Nguyen     | Dr.Nico                   |
| Megan Hill         | Dr.Todd                   |
| Austin Green       | Dr.Jamison                |
| Kayla Adams        | Dr.Imani                  |
| Tyler Baker        | Dr.Bob                    |
| Haley Campbell     | Dr.Remy                   |
| Dylan Ward         | Dr.Elliot                 |
| Victoria Cox       | Dr.Nancy                  |
| Ethan Rivera       | Dr.Odin                   |
| Hannah Long        | Dr.Cali                   |
| Noah Diaz          | Dr.Molly                  |
| Olivia King        | Dr.Ariya                  |
| Mason Powell       | Dr.Mabel                  |
+--------------------+---------------------------+
39 rows in set (0.00 sec)

#8. Write a query in SQL to obtain the maximum cost of the medical procedure.

SELECT NAME,COST FROM PROCEDURES
WHERE COST IN (SELECT MAX(COST) FROM PROCEDURES);
+-------------------------------+------+
| NAME                          | COST |
+-------------------------------+------+
| Fluoroscopy - Upper GI Series | 7000 |
+-------------------------------+------+
1 row in set (0.01 sec)

#9. Write a query in SQL to obtain the details of patient who has diagnosed with chronic pain.

SELECT * FROM Patient
WHERE patient_id IN (SELECT Patient_ID FROM PATIENT_DIAGNOSIS WHERE Diagnosis = 'Chronic Pain');

+------------+---------+----------+---------------+--------+--------------+---------------+
| patient_id | name    | surname  | address       | Gender | phone        | primary_check |
+------------+---------+----------+---------------+--------+--------------+---------------+
|          6 | Emily   | Johnson  | 56 Elm St     | Female | 555-234-5678 |             7 |
|         13 | Matthew | Martinez | 222 Cherry St | Male   | 555-901-2345 |             3 |
+------------+---------+----------+---------------+--------+--------------+---------------+
2 rows in set (0.00 sec)

#10. Write a query in SQL to find the name of the nurse who are the head of their department and are registered.

SELECT * FROM NURSE
WHERE POSITION ='Head Nurse' AND REGISTERED = "YES";
+----------+-------------------+------------+------------+
| nurse_id | name              | position   | registered |
+----------+-------------------+------------+------------+
|        1 | Carla Espinosa    | Head Nurse | Yes        |
|        7 | Rose Hughes       | Head Nurse | Yes        |
|       10 | Olive Peterson    | Head Nurse | Yes        |
|       21 | Jamiya Villarreal | Head Nurse | Yes        |
|       31 | Liliana Pace      | Head Nurse | Yes        |
+----------+-------------------+------------+------------+
5 rows in set (0.00 sec)