--  transaction_id, transaction_date, and amount

-- Create sales table
CREATE TABLE sales (
    transaction_id SERIAL PRIMARY KEY,
    transaction_date DATE,
    amount DECIMAL(10,2)
);

-- Insert 100 records with random dates and amounts
INSERT INTO sales (transaction_date, amount)
SELECT 
    CURRENT_DATE - (random() * 365)::INTEGER AS transaction_date,
    (random() * 1000 + 10)::DECIMAL(10,2) AS amount
FROM generate_series(1, 100);

-- Display the data
SELECT * FROM sales ORDER BY transaction_date;


-- Puzzle: calculate the running total of the sales amount ordered by transaction date. 
-- Include the transaction_id, transaction_date, amount, and the running total in the result.
SELECT transaction_id, transaction_date, amount, 
    sum(amount) over (order by transaction_date) as running_total 
FROM sales;

-- The SUM(amount) OVER (ORDER BY transaction_date) uses the window function SUM to calculate 
-- the running total of the amount column. The ORDER BY transaction_date ensures that the running 
-- total is calculated based on the order of transaction_date.