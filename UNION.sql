 -- Unions
 select age , gender 
     from employee_demographics
     UNION distinct
     select first_name , last_name 
     from employee_salary;
     
     
     Select first_name , last_name , 'old' AS PF
     from employee_demographics
     Where age > 50
     UNION 
     select first_name, last_name , 'High Paid Salary' As Label
     from employee_salary
     where salary > 60000
     ;