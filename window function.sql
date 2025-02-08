-- Window Funtions -- 
-- Here we group by gender in terms of avgerage salary joining two tables -- 
select gender, avg(salary) as average_salary
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
	on demp.employee_id = sal.employee_id
group by gender;

-- using window funtion --
-- group by funtion rolls up into one row--
-- Now we use the partition where it take out all the average salary of all --
-- over(partition by gender) this is a window funtion. 	
select demp.first_name, demp.last_name, demp.age, gender, avg(salary) over(partition by gender)
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
	on demp.employee_id = sal.employee_id;
    
    -- sum of salary -- 
select demp.first_name, demp.last_name, demp.age, gender, 
sum(salary) over(partition by gender)
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
on demp.employee_id = sal.employee_id;

-- Rolling out function -- 
select demp.first_name, demp.last_name, demp.age, gender, 
sum(salary) over(partition by gender order by demp.employee_id) as rolling_total
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
on demp.employee_id = sal.employee_id;

-- Row Number -- RANK -- DENS_RANK 

-- *NOTE* Particition by is used to define how we want it to get segmented here we have used gender as partitioned upon salary -- 
select demp.employee_id, demp.first_name, demp.last_name, demp.age, gender, salary, 
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as Rank_num, -- rank is similar to row however depening upon the salary table if the salary is repeated th rwo number will repeat too-
																  -- following the number will started from the skipped number as you can see 5 is shown twice however it starts from 7 not 6--
dense_rank() over(partition by gender order by salary desc) as dens_rank_num
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
on demp.employee_id = sal.employee_id;


select gender, avg(salary)
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
	on demp.employee_id = sal.employee_id
group by gender; 

select demp.first_name, demp.last_name, demp.employee_id, demp.first_name, demp.last_name, demp.age, gender, avg(salary) over(partition by gender)
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
	on demp.employee_id = sal.employee_id;
    


select demp.first_name, demp.last_name, demp.employee_id, demp.first_name, demp.last_name, demp.age, gender, 
sum(salary) over(partition by gender) as sum_salary 
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
on demp.employee_id = sal.employee_id;

select demp.first_name, demp.last_name, demp.employee_id, demp.first_name, demp.last_name, demp.age, gender, 
sum(salary) over(partition by gender order by demp.employee_id desc) as sum_salary
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
on demp.employee_id = sal.employee_id;

select demp.first_name, demp.last_name, demp.employee_id, demp.first_name, demp.last_name, demp.age, gender, 
row_number() over(partition by gender order by demp.employee_id desc) as row_num,
dense_rank() over(partition by gender order by demp.employee_id desc) as rank_number
from parks_and_recreation.employee_demographics as demp
join parks_and_recreation.employee_salary as sal
on demp.employee_id = sal.employee_id;


