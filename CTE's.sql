-- CTE -- Better readability, makes complex repetative query easier and faster 

-- *NOTE* remeber to call cte as in the beginning and call the cte at the end of the query 
-- start : with CTE_Example
-- End : from CTE_Example

with cte_example as 
(
select gender, avg(salary) avg_sal, min(salary) min_salary, max(salary) max_sal, count(salary) count_salary
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
	on demp.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
from cte_example;


with cte_demo as (Gender, avg_sal, max_sal, min_sal) as
(
select gender, avg(salary) avg_sal, min(salary) min_salary, max(salary) max_sal, count(salary) count_salary
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
	on demp.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
from cte_demo;


with cte_example as
(
select employee_id, gender, birth_date
from parks_and_recreation.employee_demographics
where birth_date = '1985-01-01'
),
cte_example2 as 
(
select employee_id, salary
from parks_and_recreation.employee_salary
where salary > 50000
)
select *
from cte_example
join cte_example2 
	on cte_example.employee_id = cte_example2.employee_id;
    
    

with cta_first as 
(
select employee_id, birth_date
from parks_and_recreation.employee_demographics
where birth_date = '1984-01-01'

),
cta_second as
(
select employee_id, salary
from parks_and_recreation.employee_salary
where salary > 50000	
)

select *
from cta_first
join cta_second 
	on cta_first.employee_id = cta_second.employee_id;
    
    
    







