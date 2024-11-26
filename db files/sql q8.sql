select de.Department, sum(emp.`Distance From Home`) As "Miles Travelled by Department" from employee as emp 
inner join `job details` as jd on emp.Employee_Number = jd.Employee_Employee_Number
inner join department as de on de.Department_id = jd.Department_Department_id 
group by de.Department order by sum(emp.`Distance From Home`) desc; 

