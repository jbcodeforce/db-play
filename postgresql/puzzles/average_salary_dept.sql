--- calculate the average salary of each department
with average_salary as (
    select department_id, round(avg(salary), 2) as average_salary 
    from employees group by department_id
)
select department_name, average_salary 
from average_salary
left join departments on average_salary.department_id = departments.department_id;