-- Temporary Tables -- 

create temporary table temp_table 
(first_name varchar(50),
last_name varchar(50),
age int(20)
);

select *
from temp_table;

insert into temp_table
values('alex', 'jacksman', 'lod'); 	

select *
from temp_table;


-- Better way of creating temp tables 

select*
from parks_and_recreation.employee_salary;

create temporary table salary_under_50K
select *
from parks_and_recreation.employee_salary
where salary >= 50000;

select *
from salary_under_50k;


select *
from parks_and_recreation.employee_salary;

create temporary table salary_under_50K
select * 
from parks_and_recreation.employee_salary
where salary >= 50000;

select *
from salary_under_50k;









