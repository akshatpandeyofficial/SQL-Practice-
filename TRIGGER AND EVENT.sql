-- TRRIGER

delimiter $$
create trigger employee_insert
	after insert on employee_salary -- after/before
    for each row 
    begin
    insert into employee_demographics (employee_id, first_name, last_name)
    values(new.employee_id,new.first_name, new.last_name); -- new/old
    end $$
    DELIMITER ;
    
    
    insert into employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id)
    values (13,'Akshat','Pandey','IT',100000,1);
    
    
    -- event
   
   delimiter $$
   create event retired_employee
   on schedule every 30 second 
   do 
   begin
   delete 
   from employee_demographics
   where age >60;
   end $$
   delimiter ;
    
    
    
    
    
    
    
    
    
    
    
select* from employee_demographics;
select* from employee_salary;