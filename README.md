# Retail Sales Data Analysis with SQL

This repository contains SQL scripts used to analyze a retail sales dataset. The scripts perform various operations, including data cleaning, exploratory data analysis, and business intelligence reporting.

## Overview

The `retail.sql` file includes the following:

* **Table Creation:** A `CREATE TABLE` statement to define the schema of the `retail` table.
* **Basic Data Exploration:** Queries to select all data, limit the output, and count the total number of records.
* **Identifying Unique Values:** Queries to find the number of unique customers and distinct product categories.
* **Data Cleaning:** A query to identify rows with NULL values across all columns and a `DELETE` statement to remove these rows.
* **Exploratory Data Analysis (EDA):** A series of queries to:
    * Retrieve unique categories.
    * Filter sales by specific categories (e.g., 'Electronics').
    * Filter sales based on quantity.
    * Filter sales based on multiple conditions (gender and age, category).
* **Aggregate Queries:** Queries to calculate:
    * Total revenue.
    * Average price per unit.
    * Total number of transactions.
    * Total revenue per category.
* **Sorting Queries:** Queries to sort sales data by total sale (descending) and sale date (ascending).
* **Date-Based Filtering:** Queries to extract sales data for a specific year (2023) and month (January).
* **Ranking and Window Functions:** Queries to:
    * Find the top 5 customers with the highest total sales.
    * Calculate the running total of sales by date.
    * Rank customers based on their total sales.
* **Business Key Problem Solving:** A set of targeted queries to answer specific business questions, such as:
    * Retrieving sales on a specific date ('2022-11-05').
    * Finding clothing sales with quantity greater than 4 in October 2022.
    * Calculating total sales and order count per category.
    * Finding the average age of customers who purchased from the 'Beauty' category.
    * Identifying transactions with total sales greater than 1500.
    * Counting transactions by gender within each category.
    * Calculating average monthly sales and identifying the best-selling month for each year.
    * Finding the top 5 customers by total sales.
    * Counting unique customers per category.
    * Categorizing orders into time-based shifts (morning, afternoon, evening).
* **Advanced Analysis:** A query to calculate the Month-over-Month growth in total sales using window functions.

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    ```
    (Replace `<repository_url>` with the actual URL of your GitHub repository)

2.  **Obtain the dataset:**
    * The `CREATE TABLE` statement in `retail.sql` provides the schema for the `retail` table.
    * To run these queries, you will need to populate this table with your retail sales data. This data could be in a CSV file, another database, or you might have a process to insert data.

3.  **Execute the SQL scripts:**
    * You can use any SQL client or database management tool (e.g., PostgreSQL, MySQL, SQL Server, SQLite) to connect to your database and execute the queries in `retail.sql`.

## Usage

Feel free to use and adapt these SQL queries for your own retail data analysis projects. You can modify the queries to explore different aspects of your data and gain valuable insights into your sales trends and customer behavior.

## Contributions

Contributions to this repository are welcome! If you have suggestions for new queries, improvements to existing ones, or find any issues, please feel free to open a pull request or submit an issue.

