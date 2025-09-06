-- Find the n-th highest salary in the employees table
SELECT DISTINCT salary 
FROM employees 
ORDER BY salary DESC limit 1 offset 5 - 1;