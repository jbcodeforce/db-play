-- find duplicate names in the employee_trainings table
select employee_id, 
    count(*) as nb_trainings 
from employee_trainings 
group by employee_id having count(*) > 1;

-- find the lastest training for each employee
