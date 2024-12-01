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
 

Data in the Database
Table Number	Table Name	Primary Key	Foreign Key	# of Rows in Table
1	Employee	Employee_Number	Travel_id	1470
2	Experience	Employee_Number	PerformanceRating	1470
3	Education	Employee_Number	Education	1470
4	Salary	Employee_Number	-	1470
5	Satisfaction	Employee_Number	Worklifebalance
RelationshipSatisfaction
JobSatisfaction
EnvironmentSatisfaction
JobInvolvement	1470
6	Job Details	Employee_Number	Department_id
JobRole_id	1470
7	PerformanceRating_index	PerformanceRating	-	4
8	Worklifebalance	Worklifebalance	-	4
9	Education_index	Education	-	5
10	Satisfaction_index  	Satisfaction_id	-	4
11	Travel_index	Travel_id	-	3
12	Department	Department_id	-	3
13	Job Role	JobRole_id	-	9

