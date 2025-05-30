--create database and connect to it

CREATE DATABASE sales_olap;
\c sales_olap;


-- Create the sales_sample table
CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);

-- Inserting data
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(1, 'East', '2024-01-05', 500),
(2, 'West', '2024-01-10', 700),
(1, 'North', '2024-02-15', 450),
(3, 'East', '2024-03-20', 900),
(2, 'South', '2024-01-25', 300),
(3, 'West', '2024-04-01', 750),
(1, 'South', '2024-02-18', 620),
(2, 'East', '2024-03-12', 810),
(3, 'North', '2024-02-22', 670),
(1, 'West', '2024-04-10', 520);



-- drill down
SELECT 
    Region,
    Product_Id,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY
    Region,
    Product_Id
ORDER BY 
    Region,
    Product_Id;



-- roll-up
SELECT 
    Region, 
    Product_Id, 
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    ROLLUP (Region, Product_Id)
ORDER BY 
    Region NULLS LAST,
    Product_Id NULLS LAST;

-- cube
SELECT
    Region,
    Product_Id,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
  CUBE (Region, Product_Id)
ORDER BY 
  Region NULLS LAST, 
  Product_Id NULLS LAST;



-- slice for specific region
SELECT *
FROM sales_sample
WHERE Region = 'East';

-- dice for specific combinations of products, regions and dates
SELECT 
    Product_Id,
    Region,
    Date,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE 
    (Product_Id, Region, Date) IN (
        (1, 'East', '2024-01-05'),
        (2, 'West', '2024-01-10'),
        (3, 'North', '2024-02-22')
    )
GROUP BY Product_Id, Region, Date
ORDER BY Product_Id, Region, Date;

