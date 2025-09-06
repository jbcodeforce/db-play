-- https://www.postgresql.org/docs/9.4/functions-aggregate.html
-- continuous percentile: returns a value corresponding to the specified fraction in the ordering, 
-- interpolating between adjacent input items if needed

SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY salary) AS median_salary
FROM employees;