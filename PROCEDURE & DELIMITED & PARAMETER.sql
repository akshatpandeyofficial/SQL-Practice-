DELIMITER $$
create procedure large_salary()
BEGIN
select * from 
employeee_salary 
where salary >=50000;
select * from employeee_salary 
where salary >=10000;
END $$
DELIMITER ;

CALL large_salary();