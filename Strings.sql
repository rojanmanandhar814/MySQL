
select * 
from parks_and_recreation.employee_demographics as demp
inner join parks_and_recreation.employee_salary as sal
where demp.employee_id + 1 = sal.employee_id;

select emp1.employee_id, emp1.first_name, emp1.last_name, emp1.age, emp2.occupation, emp2.salary
from parks_and_recreation.employee_demographics as emp1
inner join parks_and_recreation.employee_salary as emp2
where age >= 34 and salary >= 50000;

Select emp1.employee_id as employee, emp1.first_name, emp1.lastname, emp2.employee_id as emp_santa, emp2.first_name as Secret_Santa
from parks_and_recreation.employee_demographics as emp1
inner join parks_and_recreation.employee_salary as emp2
where age > 23 and salary >= 30000;


-- String Function --

select length('skyfall');

select first_name, length('first_name')  -- This shows the length of a charater--
from parks_and_recreation.employee_demographics
order by 2;

select first_name, upper(first_name)  -- Upper case --
from parks_and_recreation.employee_demographics;

select first_name, lower(first_name)  -- Lower case --
from parks_and_recreation.employee_demographics;

select trim('           sky              ');  -- Trim gets rid of unwanted white spaces 

select rtrim('           sky              ');  -- RTrim gets rid of unwanted white spaces on the right 

select ltrim('           sky              ');  -- RTrim gets rid of unwanted white spaces on the left

-- sub string --
select first_name,
left(first_name, 4),  -- left takes the first 4 letters from left--
right(first_name, 4), -- right takes the first 4 letters from right--avg
substr(first_name, 3,2), -- substring takes first_name, 3,2 means it takes in the third letter and 2 means just 2 words from the third letter --
birth_date,
substr(birth_date, 6,2) as birth_month -- we only wanted the months hence we used sub strings-- 
from parks_and_recreation.employee_demographics;


-- Replace --  -- remember there is always two parameters to fill 1- what is being replace 2- who is being replaced with 
select first_name, replace(first_name, 'a' ,'z')
from parks_and_recreation.employee_demographics;

-- locate -- 
select first_name, locate('an', first_name)
from parks_and_recreation.employee_demographics;

-- Concat -- combining two words or coloumns into one or vice versa 
select first_name, last_name,
concat(first_name,' ',last_name) as Full_Name 
from parks_and_recreation.employee_demographics;









