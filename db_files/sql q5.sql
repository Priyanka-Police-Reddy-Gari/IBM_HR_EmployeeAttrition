SELECT de.department, emp.gender, avg (sal.MonthlyIncome)
FROM department as de
inner join `job details` as jd on jd.Department_Department_id = de.Department_id
inner join employee as emp on emp.Employee_Number = jd.Employee_Employee_Number
inner join salary as sal on sal.Employee_Employee_Number = emp.Employee_Number
group by de.department, emp. Gender
order by de.department, emp. Gender

