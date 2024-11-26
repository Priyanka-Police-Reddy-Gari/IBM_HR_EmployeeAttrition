drop view if exists jobsati;
drop view if exists envisatis; 
create view jobsati as 
select de.department, avg(sa.JobSatisfaction) as "Average Job Satisfaction" from department as de 
inner join `job details` as jd on jd.Department_Department_id = de.Department_id
inner join satisfaction as sa on sa.Employee_Employee_Number = jd.Employee_Employee_Number group by department 
order by avg(sa.JobSatisfaction) desc; 

create view envisatis as 
select de.department, avg(sa.EnvironmentSatisfaction) as "Average Environment Satisfaction" from department as de 
inner join `job details` as jd on jd.Department_Department_id = de.Department_id
inner join satisfaction as sa on sa.Employee_Employee_Number = jd.Employee_Employee_Number group by department 
order by avg(sa.EnvironmentSatisfaction) desc; 

select  case  
when (((select department from jobsati limit 1) = "Human Resource") and ((select department from envisatis limit 1) = "Research & Development")) then "Both were correct" 
 
when (not((select department from jobsati limit 1) = "Human Resource") and ((select department from envisatis limit 1) = "Research & Development")) then "Research & Development was Correct whereas Human Resource was Wrong" 
 
when (((select department from jobsati limit 1) = "Human Resource") and not((select department from envisatis limit 1) = "Research & Development")) then "Human Resource was Correct whereas Research & Development was Wrong" 
 
when (not((select department from jobsati limit 1) = "Human Resource") and not((select department from envisatis limit 1) = "Research & Development")) then "Human Resource was Correct whereas Research & Development was Wrong" 
 
end as verdict; 
