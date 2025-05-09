--Creation of the customers dataset

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
country VARCHAR(50),
registration_date DATE

);

--Creation of the orders dataset

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT REFERENCES customers(customer_id),
order_date DATE,
order_amount INT,
status VARCHAR(50),
product_category VARCHAR(100)
);

-- Filling up the customers dataset with data. You can find the full list in the 'customers_dataset_raw.csv file'

INSERT INTO customers (customer_id, customer_name, city, country, registration_date)
VALUES
  (1, 'Alice Smith', 'New York', 'USA', '2022-01-10'),
  (2, 'Ben Novak', 'Budapest', 'Hungary', '2022-03-15'),
  (3, 'Emma Brown', 'London', 'UK', '2022-05-20'),
  (4, 'Carlos Mendez', 'Madrid', 'Spain', '2022-06-30'),
  (....)
  (....)
  (....)
  (....)
  (30, 'Diana Zhang', 'Toronto', 'Canada', '2022-07-05');

-- Filling up the orders dataset with data. You can find the full list in the 'orders_dataset_raw file'

INSERT INTO orders (order_id, customer_id, order_date, order_amount, status, product_category)
VALUES
  (101, 1, '2022-01-12', 250.00, 'Completed', 'Electronics'),
  (102, 2, '2022-03-20', 75.00, 'Completed', 'Books'),
  (103, 2, '2022-04-15', 100.00, 'Completed', 'Home'),
  (104, 3, '2022-06-01', 500.00, 'Completed', 'Furniture'),
  (105, 3, '2022-07-01', 200.00, 'Cancelled', 'Toys'),
  (....)
  (....)
  (....)
  (....)
  (183, 3, '2022-07-15', 150.00, 'Completed', 'Toys');