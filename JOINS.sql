-- Right JOIN
select *
from employee_demographics as dem
RIGHT JOIN employee_salary AS sal
	on dem.employee_id= sal.employee_id;
    
-- Left Join 
select *
from employee_demographics as dem
Left JOIN employee_salary AS sal
	on dem.employee_id= sal.employee_id;
    
-- Joining Multiple tables together
select *
from employee_demographics as dem
INNER JOIN employee_salary AS sal
	on dem.employee_id= sal.employee_id
    INNER JOIN parks_departments
		ON sal.dept_id = parks_departments.department_id
     ;
     