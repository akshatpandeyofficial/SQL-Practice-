-- subquery

select * 
from employee_demographics
where employee_id IN
(
						select employee_id
                        from employee_salary
                        where dept_id = 1)
;

select first_name , salary,
(select avg(salary)
from employee_salary) as Average_Salary
from employee_salary;

select gender, avg(max_age)
from
(select gender , avg(age)as avg_age, max(age) as max_age, min(age) as min_age, count(age) as count_age
from employee_demographics
group by gender) as aggregate_table
group by gender ;