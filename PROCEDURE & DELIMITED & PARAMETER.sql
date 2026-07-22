

DELIMITER $$

CREATE PROCEDURE parks_and_recreation.large_salary()
BEGIN
    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;

    SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END $$

DELIMITER ;

CALL large_salary();


-- USING PARAMETER 

CREATE PROCEDURE parks_and_recreation.large_salary2()

DELIMITER $$
create procedure large_salary2(employee_muffin INT)
begin 
	select salary
	from employee_salary 
    where employee_id = employee_muffin
    ;
    END $$
    delimiter ;
    
    call large_salary2(1)