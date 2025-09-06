-- find the second-highest salary from the employees table
select name, salary 
  from employees
  where salary = (select max(salary) 
    from employees 
    where salary < (select max(salary) from employees))