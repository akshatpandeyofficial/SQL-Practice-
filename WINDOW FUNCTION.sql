-- WINDOW FUNCTIONS
   select gender , avg(salary) as avg_salary
  from employee_demographics dem
  JOIN employee_salary	sal
		ON dem.employee_id = sal.employee_id
group by gender; -- normal function of group by 


select dem.first_name , dem.last_name , gender, sum(salary) over (partition by gender order by dem.employee_id)
from employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id= sal.employee_id;