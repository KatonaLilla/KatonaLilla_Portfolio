--CONCAT: Full name with department
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    department
FROM employees;

--CAST: Format salary with currency
SELECT 
    first_name,
    last_name,
    CAST(salary AS TEXT) || ' USD' AS formatted_salary
FROM employees;

--COALESCE: Handle missing salaries
SELECT 
    first_name,
    last_name,
    COALESCE(salary, 0) AS effective_salary
FROM employees;

--LPAD: Show employee IDs as 5-digit numbers
SELECT 
    LPAD(id::TEXT, 5, '0') AS padded_id,
    first_name,
    last_name
FROM employees;

--DISTINCT: Count and list unique departments
SELECT
 COUNT(DISTINCT department) AS unique_departments
 FROM employees;

SELECT DISTINCT 
department 
FROM employees;