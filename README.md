## NAMES: NIYOMWUNGERE Elyse
## ID: 28273
## DEPARTMENT: Sftware Engineering
## COURSE: DATABASE DEVELOPMENT WITH PL/SQL(INSY 8311)
## Instructor: Eric Maniraguha
## Date: 28/09/2025
## Project Topic : PL/SQL Window Functions Mastery Project


# SmartTech Electronics Ltd. Sales Analytics

## Step 1: Problem Definition
### Business Context
- Company: SmartTech Electronics Ltd – A growing electronics retail company with multiple customer bases in Rwanda
- Department: Sales & Marketing Analytics
- Industry: Electronics Retail

### Data Challenge
SmartTech needs to analyze sales across regions to identify top-selling products, customer purchase trends, and revenue growth patterns. The management wants to understand which products perform best in different regions, track monthly performance, and group customers into segments for targeted promotions.

### Expected Outcome
Build an analytics system that identifies top-selling products by region, tracks monthly sales performance, calculates growth rates, and segments customers into loyalty groups. This will support better decision-making in inventory, pricing, and marketing.

---

## Step 2: Success Criteria (5 Measurable Goals)

- Top 5 Products per Region → Using `RANK()`to find best-selling products by region.
- Running Monthly Sales → Using `SUM() OVER()`for cumulative sales tracking.
- Month-to-Month Growth → Using `LAG()` / `LEAD()`to calculate growth percentages.
- Customer Segments → Using `NTILE(4)`to create customer loyalty groups.
- 3-Month Moving Averages → Using `AVG() OVER()`for moving averages.

---

## Step 3: Database Schema & Table Creation

### Create Tables
sql
## Customers Tables
## Creating customers table with columns (customer_id, name, region)
![alt text](./Images/Create_Table_Customers.png)

## Products Table
## Creating products table with product details.
![alt text](./Images/Create_Table_Products.png)

## Transactions Table
## Creating transactions table with foreign keys to customers and products.
![alt text](./Images/Create_Table_Transactions.png)

## DESCRIBE customers Table
## Structure of customers table (columns, datatypes, constraints).
![alt text](./Images/Describe_customers.png)

## DESCRIBE Products Table
## Structure of products table (columns, datatypes, constraints)
![alt text](./Images/Describe_Product.png)

## DESCRIBE Transactions Table
## Structure of transactions table with foreign keys.
![alt text](./Images/Describe_Transactions.png)





### Insert Data
sql
## Insert Customers
## nserting 5 rows into customers table.
![alt text](./Images/Insert_Into_Customers.png)

## Insert Products
## Inserting 5 rows into products table.
![alt text](./Images/Insert_Into_Products.png)

## Insert Transactions
## Inserting 5 rows into transactions table.
![alt text](./Images/Insert_Into_Transactions.png)


## Select From Tables
sql
## Select from customers
## Displaying all customers with their ids, names, and regions.
![alt text](./Images/Select_From_Customer.png)


## Select from products
## Displaying all products with their ids, names, and categories
![alt text](./Images/Select_From_Products.png)


## Select from Transactions
## Displaying all transactions with ids, customers, and products.
![alt text](./Images/Select_From_Transactions.png)




## Step 4: Window Functions Implementation

### Ranking Functions – Top Products per Region
sql
## Find the top-selling products in each region
## Query to rank products by sales per region using RANK and ROW_NUMBER.
## Output: Result showing ranked products by region
![alt text](./Images/Find.png)



### Aggregate Functions – Running Totals & Averages
sql
## Calculate running totals and moving averages for product categories
## Query to calculate running totals and moving averages using SUM and AVG.
## Output:Result showing cumulative totals and moving averages.
![alt text](./Images/Calculate.png)


### Navigation Functions – Growth with LAG/LEAD
sql
## Analyze month-to-month sales growth per region
## Query to analyze month-to-month growth using LAG and LEAD.
## Output:Query to segment customers into quartiles using NTILE and CUME_DIST
![alt text](./Images/Analyze.png)


### Distribution Functions – Customer Segmentation
sql
## Segment customers into quartiles based on total purchases
## Query to segment customers into quartiles using NTILE and CUME_DIST.
## Output: Result showing customers classified into quartiles.
![alt text](./Images/Segment.png)




### Others Screenshot

## ER Diagram
## Entity Relationship Diagram showing customers, products, and transactions.
![alt text](./Images/ER_Diagram.png)


## Query error screenshot
## Example of query with error (wrong table name).
![alt text](./Images/Spelling_Error_Transaction.png)


## Fixed query screenshot
## Corrected query with successful output.
![alt text](./Images/Fixed_Error_Transactions.png)


## JOIN query
## Displaying customers with purchased products and regions using JOIN.
![alt text](./Images/Join_Query.png)


## COUNT customers
## Counting total number of customers (5).
![alt text](./Images/Count_From%20Customers.png)


## COUNT products
## Counting total number of products (5).
![alt text](./Images/Count_From_Products.png)


## COUNT transactions
## Counting total number of transactions (5).
![alt text](./Images/Count_From_Transactions.png)


## GROUP BY products
## Total sales grouped by product.
![alt text](./Images/Sales_Per_Product.png)


## GROUP BY regions
## Total sales grouped by region.
![alt text](./Images/Sales_Per_Region.png)



## Step 5: GitHub Repository
Repository will include:
- SQL scripts
- Screenshots of outputs
- README documentation


## Step 6: Results Analysis

### Descriptive – What Happened?
- Some products (iPhones, Laptops) generate higher revenue across regions.
- Customers from Kigali and Rubavu purchase more premium items.
- Accessories and headphones show lower but steady demand.

### Diagnostic – Why?
- Kigali region drives sales due to urban demand and higher income levels.
- Customers in rural areas (Kirehe, Rwamagana) purchase lower-cost products more often.
- Product performance aligns with technology adoption rates in each region.

### Prescriptive – What Next?
- Stock more laptops and iPhones in Kigali and Rubavu.
- Provide affordable accessories in Rwamagana and Kirehe to boost sales.
- Create promotions for premium customers in Kigali while running bundle offers for other regions.

---

## Step 7: References
1. [Oracle Documentation – Window Functions Concepts and Syntax] (https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/window-functions-usage.html)
Authoritative Oracle/MySQL documentation on using OVER(), PARTITION BY, and window function operations.

2. [Mode Analytics – SQL Window Functions Tutorial] (https://mode.com/sql-tutorial/sql-window-functions) 
Practical introduction with examples of ROW_NUMBER, RANK, NTILE, LAG, and LEAD.

3. [Oracletutorial.com – Oracle Analytic Functions] (https://www.oracletutorial.com/oracle-analytic-functions/) 
Detailed explanation of Oracle analytic (window) functions with syntax and examples.

4. [GeeksforGeeks – Window Functions in PL/SQL] (https://www.geeksforgeeks.org/plsql-window-functions-in-plsql/) 
Tutorial covering Oracle PL/SQL implementations with sample queries.

5. [DBVis – Beginner’s Guide to SQL Window Functions] (https://www.dbvis.com/thetable/a-beginners-guide-to-sql-window-functions/)
Introductory guide to how window functions differ from aggregate functions.

6. [Kaggle – SQL Window Functions Examples] (https://www.kaggle.com/code/prashant111/sql-window-functions-tutorial) 
Hands-on SQL examples demonstrating different window functions with datasets.

7. [W3Schools – SQL OVER() Clause] (https://www.w3schools.com/sql/sql_over.asp)
Beginner-friendly tutorial on using OVER() with ranking and aggregate functions.

8. [TutorialsPoint – SQL Window Functions] (https://www.tutorialspoint.com/sql/sql-window-functions.htm)
Covers usage of analytic functions including syntax and examples.

9. [Investopedia – Customer Segmentation in Business] (https://www.investopedia.com/terms/c/customer-segmentation.asp)
Business explanation of customer segmentation techniques and applications.

10. [ResearchGate – Data Analytics for Retail Decision Making] (https://www.researchgate.net/publication/332574698_Cette_beaute_qui_tue)
Academic paper on using analytics to support decision-making in retail businesses.

11. https://www.researchgate.net/publication/324504154_Analytic_Functions_in_SQL_for_Business_Intelligence

12. https://dl.acm.org/doi/10.1145/1807167.1807272