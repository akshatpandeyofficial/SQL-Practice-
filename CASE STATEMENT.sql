-- CASE STATEMENTS 
     
     select first_name ,
     gender,
     age,
     Case 
		when age >50 then 'OLD'
        when age between 31 and 50 then 'mid Age'
        when age < 30 then 'Younger'
	END as AGE_Bracket
    from employee_demographics
    ;
    
    select first_name, last_name 
    occupation,
    salary,
    case
		when salary >50000 then 'High Paid employee'
        when salary<50000 then 'low Paid Employee'
	end as Employee_payout
    from employee_salary
    ;
     
     
     select 
     first_name , last_name
     salary,
     case
     when salary > 50000 then salary*1.05
     when salary < 50000 then salary*1.07
     when salary = 50000 then salary*1.05
     end as Bonus_included_Salary,
     case 
     when dept_id = 6 then salary*.10
     end as Bonus_Finance
     
     from employee_salary;