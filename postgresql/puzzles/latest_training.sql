-- find last training for each employee. Joins with employees and trainings tables to get the employee name and training name.
with last_training as (
select 
	employee_id, 
	training_id, 
	completion_date as last_training 
from (
	select employee_id,
	       training_id,
	       completion_date,
		   Row_number() 
		      OVER (partition by employee_id order by completion_date desc ) as row_num
	from employee_trainings) as ordered_trainings where row_num = 1
)
-- the inner query is used to get the last training for each employee. 
-- it used the Row_number() function to assign a number to each training for each employee.
-- The PARTITION BY employee_id ensures that the numbering restarts for each employee
-- The ORDER BY completion_date DESC sorts the rows within each partition by completion date, 
-- the outer query select the data expected
-- The WHERE row_num = 1 condition filters the result set to include only the rows with the latest training for each employee 
select
   e.name,
   t.training_name,
   lt.last_training
from last_training lt
left join employees e on e.employee_id = lt.employee_id
left join trainings t on t.training_id = lt.training_id

