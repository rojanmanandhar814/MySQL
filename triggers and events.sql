-- Triggers & Events

-- A block of code that automatically takes place when an event takes place repeatedly via not have to be doing repeatdly -- 

-- Example: When a new user joins in or logins to an account the user name and other credential will automatically get added to the tables with other users in the same table 
-- *Note* In order for any tigger to take place we need to to specify what event needs to take place and how in order the trigger to be implemented
select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation;


select * 
from parks_and_recreation.employee_salary;

delimiter $$  
create trigger employee_insert
	after insert on parks_and_recreation.employee_salary -- here after the data is updated in the employee_salary table the trigger must be implemented
    for each row 										 -- this means the trigger will get activate for each row
														 -- Now we will write the code afte this event takes palce 
Begin 
	insert into parks_and_recreation.employee_demographics (employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name); -- new is the new values it will take in
end $$
delimiter ; 

insert into parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values (13,'Rojan', 'Manandhar', 'Data-Analyst', 30000, NULL);

insert into parks_and_recreation.employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
values (13,'Rojan', 'Manandhar', 27, 'Male', 1997-05-04);


delimiter $$
create trigger employee_insert2
	after insert on parks_and_recreation.employee_salary
    for each row
begin
	insert into parks_and_recreation.employee_demographics (employee_id, first_name, last_name)
	values (new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values (14,'Dee', 'Dangol', 'UN', 40000, NULL);


-- Events -- 

select *
from parks_and_recreation.employee_demographics;


delimiter $$
create event delete_retirees
on schedule every 1 Year 
do
begin
	delete 
	from parks_and_recreation.employee_demographics
    where age >= 60;

end $$
delimiter ;

show variables like 'event%';  -- if you do not have the permission to edit or the change is not been showed 	
							   -- Go to edit> preference > sql editor> Scroll below> uncheck the "SAFE UPDATES"
                               

delimiter $$
create event delete_interns
on schedule every 3 month,
begin
	delete
    from parks_and_recreation.employee_demographics
    where occupation = 'interns' 
    
end $$
delimiter ;



