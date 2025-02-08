select * 
FROM parks_and_recreation.employee_demographics;

select first_name, 
last_name, 
birth_date,
age,
age + 20
FROM parks_and_recreation.employee_demographics;


select distinct first_name, last_name, gender
FROM parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_demographics;

select first_name, last_name,
age,
age + 10
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_salary;

select *
from parks_and_recreation.employee_salary
where salary < 50000;

select *
from employee_demographics
where gender != "Female";

select *
from parks_and_recreation.employee_demographics
where birth_date > "1985-01-01"
or not gender = "Male";

-- logical operator -- AND OR NOT -- 
select *
from parks_and_recreation.employee_demographics
where first_name =' Leslie' and age >= '44'



Select * 
from parks_and_recreation.employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 55
;


-- LIKE STATEMENT -- 
-- % or _ -- 
-- Note -- % finds similarity or patterns Example: %r (This starts with the letter r) OR %er% This demostrates anything with before or after the letter er. 

SELECT distinct first_name,
last_name,
age,
gender
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'E%' AND gender = 'Male' OR age >= 34;



SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a_%';


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989' or gender = 'Male';

select *
from parks_and_recreation.employee_demographics
where gender = 'Male' and
first_name = 'a_%';

-- Group By --

select gender, avg(age)	
from parks_and_recreation.employee_demographics
group by gender;

select gender, avg(age), max(age), min(age), count(age)
from parks_and_recreation.employee_demographics
group by gender;

-- ORDER BY--
select*
from parks_and_recreation.employee_demographics
order by gender, age;

-- HAVING & WHERE-- 

SELECT occupation, avg(salary)
from parks_and_recreation.employee_salary 
where occupation like '%s%'
group by occupation; 

SELECT occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) >= '75000';


-- Limit & Aliasing 

select * 
from parks_and_recreation.employee_demographics
order by age desc
limit 3;

select * 
from parks_and_recreation.employee_demographics
order by age desc
limit 2, 1;   -- This means it takes the position below it, example it will take postion below 2 --

-- Aliasing-- 

select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender;

-- Inner JOINTS-- 
select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_demographics as dem  -- we can name demographics as dem & salary as sal as short form-- 
inner join parks_and_recreation.employee_salary as sal 
on dem.employee_id = sal.employee_id;


select dem.employee_id, age, occupation   -- when using inner joins we must clearly define which table we want since there are two tables -- 
from parks_and_recreation.employee_demographics as dem  
inner join parks_and_recreation.employee_salary as sal 
on dem.employee_id = sal.employee_id;


-- Outer Joints -- 
select *  --  -- 
from parks_and_recreation.employee_demographics as dem  
right join parks_and_recreation.employee_salary as sal 
on dem.employee_id = sal.employee_id;

-- Self Join-- 
select *
from parks_and_recreation.employee_salary emp1
join parks_and_recreation.employee_salary emp2 
on emp1.employee_id + 1  = emp2.employee_id;

select emp1.employee_id as emp_santa,  -- here we are specific on which coloum we want to check here we check employee id, firstname, lastname where emp1 is first table, emp3 is second table--
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp1.occupation as occupation_santa,
emp2.employee_id as emp_employee,
emp2.first_name as first_name_employee,
emp2.last_name as last_name_employee,
emp2.occupation as occupation_employee
from parks_and_recreation.employee_salary emp1
join parks_and_recreation.employee_salary emp2 
on emp1.employee_id + 1  = emp2.employee_id;

-- Multiple Joints --

select *  -- joining three different tables -- 
from parks_and_recreation.employee_demographics as dem  
inner join parks_and_recreation.employee_salary as sal 
on dem.employee_id = sal.employee_id
inner join parks_and_recreation.parks_departments as pd
on sal.dept_id =  pd.department_id;

select *
from parks_and_recreation.parks_departments;

select *
from parks_and_recreation.employee_salary;

-- Unios -- Allows rows to join together 
select age, gender 
from parks_and_recreation.employee_demographics
union
select first_name, last_name
from parks_and_recreation.employee_salary;

-- if they want to identify people older than 50 under the label old from a specific department from all tables -- 

select first_name, last_name, 'old man' as label 
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'Male'
union
select first_name, last_name, 'old lady' as label 
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'female'
union
select first_name, last_name, 'Highly paid employees' as label 
from parks_and_recreation.employee_salary
where salary > 70000
order by first_name, last_name;











