-- case statement-- 

select first_name, last_name, age,
case 
	when age<= 30 then 'Young' 
    when age between 31 and 50 then 'old'
    when age >= 50 then'Time_to_Retire' 
    
end as comments
from parks_and_recreation.employee_demographics;

-- Pay Increase-- for every employee by 5% 
-- conditions <50k = 5% increment, 
-- if >50K = 7% increment 
-- finance dept gets 10% bonus -- 

select first_name, last_name, salary,

case
	when salary < 50000 then salary + (salary * 0.05)	
	when salary > 50000 then salary + (salary * 0.07) 	
	when salary = 50000 then 'Salary Non-Increment'
end as new_salary,
case
	when dept_id = 6 then salary + (salary * 0.10)
end as bonus 
from parks_and_recreation.employee_salary;

select*
from parks_and_recreation.employee_salary;















	






