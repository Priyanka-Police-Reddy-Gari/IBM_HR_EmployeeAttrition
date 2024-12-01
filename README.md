# IBM_HR_EmployeeAttrition
SQL-Mongo Project – IBM HR Analytics Employee Attrition &amp; Performance
•	Created a relational data model using ER Diagram with a physical MYSQL database and wrote complex SQL queries to retrieve data. Also imported and performed data review in MongoDB using a compass and wrote complex Mongo queries in shell. 
•	Developed a relational data model using ER diagrams and MySQL, writing complex SQL queries to enhance data retrieval speed by 40%, and conducted data review in MongoDB with Compass, improving query efficiency by 30%.

Relational Data Model
Assumptions/Notes About Data Entities and Relationships

The database is divided into 13 tables. There are many partitioned tables, and a few index tables.
Notes on attributes of data:
We dropped three columns: Over18, EmployeeCount and Standard Hours because they had redundant data, with only one value for each column. So out of the 35 attributes mentioned in the Excel sheet, we have used 32.

Notes on entities:
1.	Employee – The entity holds the personal data of employee. 
2.	Education – Holds the Educational details about employee. 
3.	Experience – holds the work history about employee. 
4.	Satisfaction – holds the data of the employee’s satisfaction in the various segments. 
5.	Job details- holds the data about employee and the department, job role and job level they are working in.
6.	Salary – Says about the salary earned by employee. 
7.	Satisfaction_index – holds the various levels of satisfactions 
8.	Work_life_balance – holds various levels of balance in work life
9.	Performance_rating- holds various rating levels of performance.
10.	Education_index – holds various levels of education such as college, masters etc.
11.	Travel_index- has various options for travel.
12.	Job role- has various roles that a company holds.
13.	Department- has various departments of the company.

Notes on Relationships:
Employee table are one-to-one related with experience, education, salary, satisfaction, and job details tables. The relationship is made as identifying and mandatory.
The Performance rating index table has indexes for performance ratings, from Low to Outstanding. It has a one-to-many relationship with the experience table. The relationship is non-identifying and optional.
The Work life balance index table has indexes for work-life balance ratings, from Bad to Best. It has a one-to-many relationship with the satisfaction table. The relationship is non-identifying and optional.
The Education index table has indexes for Education names such as college, masters etc., and it has a one-to-many relationship with the Education table. The relationship is non-identifying and optional.
The satisfaction index table has indexes for satisfaction rating names, from Low to Very Bad. It has a one-to-many relationship with the satisfaction table. The satisfaction ID is used as a foreign key for four different attributes: Environment Satisfaction, Relationship Satisfaction, Job Satisfaction and Job Involvement. The relationship is non-identifying and optional.
The Travel index has indexes for Travel names, and it has a one-to-many relationship with the Employee details table. The relationship is non-identifying and optional.
The department table has indexes for department names, and it has a one-to-many relationship with the job details table. The relationship is non-identifying and optional.
The Job role table has indexes for job roles such as Sales Executive and Research Scientist. It has a one-to-many relationship with the job details table. The relationship is non-identifying and optional.
The data model is in 3NF:
1.	All the 13 tables have their primary key. 
2.	All the other columns in the respective table non-transitively depend on the primary key. 

Any column's value can be derived from the primary key. 
Entity-Relationship Diagram
![image](https://github.com/user-attachments/assets/b87397ac-fcbe-4b26-be30-2a2ec0519e1a)



 
Physical MySQL Database

Assumptions/Notes About Data Set
1.	All fields in the database are filled and do not contain any empty values (NULL values).
2.	The attributes 'over18', 'employeecount' and ‘StandardHours’ are not utilized in the model, and their purpose or relevance is unclear.
3.	The attributes 'Hourlyrate', 'Dailyrate', 'Monthlyrate', and 'Monthlyincome' are vaguely defined and have little logical connection with each other. They may be considered bad data or other factors affecting these attributes, not accounted for in the database.
4.	Attrition refers to the termination of an employee's employment with the company.
5.	If a person rehires into the company, they will be assigned a new Employee number and their details will be treated as those of a new employee.
6.	All employees receive a monthly income, which is the salary paid to them monthly.
7.	Each department has unique job roles that do not overlap with those of other departments.
8.	JobLevel and JobRole are not interdependent, meaning that an employee's JobLevel cannot be determined based on their JobRole or vice versa. Instead, both JobLevel and JobRole independently rely on the Employee_Number (primary key) in the database. However, it can be deduced that each JobRole is associated with 4 different Job Levels.
9.	Education and EducationField are not mutually dependent, meaning that an employee's Education cannot be determined based on their EducationField or vice versa (No Transitive dependence). Instead, both Education and EducationField independently rely on the Employee_Number (primary key) in the database. However, it can be inferred that each EducationField is associated with 5 different Education categories.
10.	Age and over 18: The over 18 age criteria can be easily obtained by a where clause and thus the attribute over18 is removed.



Screen shot of Physical Database objects
![image](https://github.com/user-attachments/assets/b44b8dc1-1c53-4f64-81a9-5dab5e37c4bb)

 

Data in the Database
![image](https://github.com/user-attachments/assets/7655cecd-37af-4163-b365-8c0e6430439e)
![image](https://github.com/user-attachments/assets/8ca93240-e3fe-4831-948e-8e9125ca18b7)

Data Review for MongoDB 
Assumptions/Notes About Data Collections, Attributes and Relationships between 
Collections 
Data is loaded into Mongo using Compass and visualized using Compass and Mongo Shell. 
The raw dataset is loaded into Mongo Server because it is capable of handling unstructured 
data too. This is now also used to compare result sets fetched from Mongo with SQL result sets. 
The collection for the raw dataset is named IBM. 
Four index tables are added as collections to the database, to provide indexes for values used in 
the raw data collection IBM. 
The satisfaction_id collection a common index for several columns in the IBM collection, such 
as EnvironmentSatisfaction, JobInvolvement, JobSatisfaction, PerformanceRating, and 
RelationshipSatisfaction. 
Execution of queries is done through the Mongo Shell.

Physical Mongo Database 
Assumptions/Notes About Data Set 
1. The dataset which is originally in csv format is loaded into the mongoDB with the 
database name as project and collection named as IBM.   
2. No normalization: This holds all the attributes , unlike SQL.   
3. The databse still has indexes for certain fields as four separate collections, which are 
there for reference reasons. This makes a total of 5 collections in the database. 
4. All the Collections are present as reference collections instead of embedded collections 
as there is no use of the collection other than IBM to solve the problems of this project.

Screen shot of Physical Database objects (Database, Collections and Attributes) 
 ![image](https://github.com/user-attachments/assets/abda170d-813f-43f8-b72f-0d4dba136259)

Data in the Database
![image](https://github.com/user-attachments/assets/3a7f47f0-50e3-46ab-aa2b-4c4854f08fd9)



