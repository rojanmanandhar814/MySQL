-- Subquries -- 

select *  -- selecting everything from the demographic table where employee_id in demographic table matches or is in employee_id from the salary table where dept_id =1 -- 
from parks_and_recreation.employee_demographics
where employee_id in
				(select employee_id   -- this is another query inside a query-- 
					from parks_and_recreation.employee_salary
                    where dept_id = 1); 
                    
select *  -- from table emplyee demo empoyee_id matces the employee_if of salary table with the same department id 1 
from parks_and_recreation.employee_demographics
where employee_id in 
					(select employee_id
						from parks_and_recreation.employee_salary
                        where dept_id = 1
                    );
                    
                    
                    
                    
select *
from parks_and_recreation.employee_demographics
where employee_id in
				(select employee_id
					from parks_and_recreation.employee_salary
                    where dept_id = 1
                );
                
                
select first_name, last_name, salary, 
(select avg(salary) as Average_Salary
from parks_and_recreation.employee_salary)
from parks_and_recreation.employee_salary;

select *
from
(select gender, avg(age), max(age), min(age), count(age)
from parks_and_recreation.employee_demographics
group by gender) as agg_table;
                
                