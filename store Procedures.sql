-- STORE PROCEDURES --

SELECT*
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

-- How to store a query --

create procedure large_salaries()
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

Delimiter $$
create procedure large_salaries3()
begin
	SELECT *
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 50000;
	select *
	from parks_and_recreation.employee_salary
	where salary >= 10000;
end $$
Delimiter ;


call large_salaries3();

-- parameters--
-- If i want to find a particular salary from a particular employee id or name 

Delimiter $$
create procedure large_salaries4(employee_number int)
begin
	SELECT *
	FROM parks_and_recreation.employee_salary
	WHERE employee_id = employee_number
    ;
end $$
Delimiter ;

call large_salaries4(5)



