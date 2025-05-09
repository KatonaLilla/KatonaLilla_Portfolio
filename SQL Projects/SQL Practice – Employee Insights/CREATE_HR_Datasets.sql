CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    department TEXT,
    hire_date DATE,
    termination_date DATE,
    salary NUMERIC
);

CREATE TABLE performance_reviews (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(id),
    review_date DATE,
    score INTEGER
);

-- Employees table
INSERT INTO employees (first_name, last_name, department, hire_date, termination_date, salary) VALUES
('Alice', 'Smith', 'Marketing', '2020-02-15', NULL, 55000),
('Bob', 'Johnson', 'Sales', '2019-06-10', '2023-01-01', 62000),
('Charlie', 'Lee', 'IT', '2021-03-20', NULL, 70000),
('Diana', 'Wang', 'HR', '2018-11-01', NULL, 58000),
('Ethan', 'Brown', 'Sales', '2022-05-05', NULL, NULL);

-- Performance Reviews table
INSERT INTO performance_reviews (employee_id, review_date, score) VALUES
(1, '2022-01-10', 80),
(1, '2023-01-10', 85),
(2, '2022-01-10', 70),
(3, '2023-03-15', 90),
(4, '2023-04-01', 88);