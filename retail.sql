CREATE TABLE retail(
transactions_id	INT PRIMARY KEY,
sale_date DATE,	
sale_time TIME,	
customer_id INT,	
gender 	VARCHAR(15),
age	INT,
category VARCHAR(30),	
quantiy	INT,
price_per_unit	FLOAT,
cogs	FLOAT,
total_sale FLOAT
);

SELECT * FROM RETAIL
SELECT * FROM RETAIL LIMIT 10

SELECT  COUNT(*) FROM RETAIL ;

--How many sales we have
SELECT COUNT(*) AS total_sale from retail

--How many uniqe customer  we have
SELECT COUNT(DISTINCT customer_id) AS total_sale from retail

--How many catogory we have
SELECT DISTINCT category from retail


--Data_cleaning & manupulation
SELECT * FROM RETAIL WHERE
     transactions_id is NULL 
	           OR
     sale_date is NULL
	           OR
	 sale_time is NULL	
               OR
	 customer_id is NULL
	           OR
	 gender is NULL	
	           OR
     age is NULL
	           OR
	 category is NULL
	            OR
	 quantiy is NULL
	            OR
     price_per_unit is NULL
	            OR
	 cogs is NULL
	            OR
	 total_sale is NULL			
--delete null value
	DELETE  FROM RETAIL WHERE
     transactions_id is NULL 
	           OR
     sale_date is NULL
	           OR
	 sale_time is NULL	
               OR
	 customer_id is NULL
	           OR
	 gender is NULL	
	           OR
     age is NULL
	           OR
	 category is NULL
	            OR
	 quantiy is NULL
	            OR
     price_per_unit is NULL
	            OR
	 cogs is NULL
	            OR
	 total_sale is NULL			
	 		   

--Data explopring

--Query: Show the unique categories in the table.
SELECT DISTINCT category
FROM retail;

--Query: Show sales where the category is 'Electronics'.
SELECT *
FROM retail
WHERE category = 'Electronics';

--Query: Show sales where the quantity is greater than 5.
SELECT *
FROM retail
WHERE quantiy > 3;

--Query: Show sales where the gender is 'Female' and the age is less than 30.
SELECT *
FROM retail
WHERE gender = 'Female' AND age < 30;

--Query: Show sales where the category is either 'Clothing' or 'Home Goods'.
SELECT *
FROM retail
WHERE category IN ('Clothing', 'Home Goods');

--Aggregate Queries
--Query: Calculate the total revenue (sum of total_sale).
SELECT SUM(total_sale) AS total_revenue
FROM retail;

--Query: Calculate the average price_per_unit.
SELECT AVG(price_per_unit) AS average_price
FROM retail;

--Query: Count the number of sales transactions.
SELECT COUNT(*) AS number_of_transactions
FROM retail;

--Query: Calculate the total revenue for each category.
SELECT category, SUM(total_sale) AS category_revenue
FROM retail
GROUP BY category;

--Sorting Queries
--Query: Show sales sorted by total_sale in descending order.
SELECT *
FROM retail
ORDER BY total_sale dESC;

--Query: Show sales sorted by sale_date in ascending order.
SELECT *
FROM retail
ORDER BY sale_date ASC;

--Query: Show sales from the year 2023. (Assuming sale_date is a DATE type)
SELECT *
FROM retail
WHERE EXTRACT(YEAR FROM sale_date) = 2023;

--Query: Show sales from the month of January. (Assuming sale_date is a DATE type)
SELECT *
FROM retail
WHERE EXTRACT(MONTH FROM sale_date) = 1;

--Query: Find the customer who made the highest total sale top 5.
SELECT customer_id, MAX(total_sale) AS highest_sale
FROM retail
GROUP BY customer_id
ORDER BY highest_sale DESC
LIMIT 5;

--Query: Calculate the running total of sales by date.
SELECT
    sale_date,
    SUM(total_sale) AS daily_sales,
    SUM(SUM(total_sale)) OVER (ORDER BY sale_date) AS running_total
FROM retail
GROUP BY sale_date
ORDER BY sale_date;

--Query: Rank customers based on their total sales.
SELECT
    customer_id,
    SUM(total_sale) AS total_customer_sale,
    RANK() OVER (ORDER BY SUM(total_sale) DESC) AS sales_rank
FROM retail
GROUP BY customer_id;

--Buissness key problems

--Write a sql query to retrive all columns for sales made on '2022-11-05'
SELECT * FROM retail where sale_date='2022-11-05';

--Write a sql query to retrive all transactions where the category is 'clothing' and the quantity sold is more than 4 in the month of nov-2022

SELECT * FROM retail
where category='Clothing'
AND 
TO_CHAR(sale_date,'YYYY-MM')='2022-10'
AND
quantiy >=3


--Write a sql query to calculate the total_sales for each category
Select category,
sum(total_sale) as hole_sale,
Count(*) as total_order 
from retail
 group by 1


--Write a sql query to find the average age of customers who purchesd items from the 'Beauty' category
Select 
ROUND(Avg(age),3) As avg_age
From retail
Where category='Beauty'

--Write sql query to find all transactions where the total_sales is greater than 1500.
select * from retail where total_sale >=1500

--write a sql query to find the total number of transaction made by each gender in each category
select category,
       gender,
	   count(*) as total_transactions
	   from retail
	   group by 
	    category,
       gender
	   order by 1

--Write sql query to calculate the average sales of each month.find out best seling month in each year
select year,month,avg_sale from
(
select 
 EXTRACT(YEAR FROM sale_date) as year,
 EXTRACT(MONTH FROM sale_date) as month,
 avg(total_sale) as avg_sale,
 RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) order by avg(total_sale)desc) as rank
from retail
group by 1,2 
)as table1
where rank=1

--Write sql query to find the top 5  customer based on highest total sale
select 
customer_id,
sum(total_sale)as total_sale
from retail
group by 1
order by 2 desc
limit 5

--write sql query to find the number of uniqe customers who purches item from each category
select
category,
count (distinct customer_id) as uniqe_customer
from retail
group by 1

--write a sql query to create each shift and number of orders (like morning<12,afternoon btttween 12&17 eving>17)
with sale_shiftng
as
(
select sale_time,
 case
  when extract(hour from sale_time)<12 then 'morning'
  when extract(hour from sale_time) between 12 and 17 then 'afternoon'
  else 'evening'
 end as shift  
from retail
)
select 
shift,
count(*) as total_orders
from sale_shiftng
group by shift


--Query: Calculate the Month-over-Month growth in total sales.
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS sale_month,
        SUM(total_sale) AS monthly_revenue
    FROM retail
    GROUP BY 1
),
lagged_sales AS (
    SELECT
        sale_month,
        monthly_revenue,
        LAG(monthly_revenue, 1, 0) OVER (ORDER BY sale_month) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    sale_month,
    monthly_revenue,
    (monthly_revenue - previous_month_revenue) * 100.0 / previous_month_revenue AS growth_percentage
FROM lagged_sales
ORDER BY sale_month;

	   