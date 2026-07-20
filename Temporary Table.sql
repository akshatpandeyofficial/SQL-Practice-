-- Copying from Permanent table 
create TEMPORARY TABLE Temp_table 

select * 
from employee_salary
where salary >50000;

select * from Temp_table;


-- Manual Method 

create temporary table main_table
( first_name  varchar(50),
last_name varchar(20),
job varchar(50) );

insert into main_table
values('Akshat','Pandey','Data Analyst');

select * from main_table;