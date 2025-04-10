
📘 Database Concepts, SQL, and Pandas for Data Science & Analyst Interviews
🌟 Introduction
In top tech interviews, your ability to query data, manipulate tables, and extract insights is as important as your ability to build machine learning models.

This document is a complete preparation guide covering:

Core database concepts.

Advanced SQL querying.

Practical Pandas usage.

How SQL and Pandas complement each other.

🛠️ 1. Core Database Concepts (with Examples)
📍 1.1 Relational Databases (RDBMS)
Definition:
A database where data is stored in tables. Tables can relate to each other through keys.

Key Elements:

Table: Collection of rows (records) and columns (fields).

Row: A single record.

Column: An attribute or feature.

Primary Key: Uniquely identifies each row (e.g., user_id).

Foreign Key: Refers to a primary key in another table (e.g., order.user_id → user.id).

✅ Practice Task:
Explain the relationship between a users table and an orders table in 2 sentences.

📍 1.2 Normalization and Denormalization
Normalization:

Organize data to reduce redundancy.

Achieve 1NF, 2NF, 3NF (normal forms).

Example: Splitting address fields into a separate table.

Denormalization:

Merging tables to speed up read performance.

Used in analytics or reporting systems.

✅ Practice Task:
Sketch a database design for a movie review site (users, movies, reviews). Normalize it.

📍 1.3 Joins
Types of Joins:

Join Type	Description
INNER JOIN	Return rows with matching values.
LEFT JOIN	Return all rows from the left table + matching ones from the right.
RIGHT JOIN	Return all rows from the right table.
FULL OUTER JOIN	Return rows when there is a match in either table.
Example:

sql
Copy
Edit
SELECT users.name, orders.amount
FROM users
LEFT JOIN orders
ON users.id = orders.user_id;
✅ Practice Task:
Write SQL to get all users and their total order amount (even if they made no orders).

📍 1.4 Indexes
Indexes = Data structures that make searching faster.

Without indexes, SQL does full table scans → Slow for large datasets.

Indexes are built on columns that are frequently searched or joined.

✅ Practice Task:
Why is it bad to index every column? (Hint: trade-off between read and write speeds.)

📍 1.5 Transactions and ACID
Transactions:

A unit of work executed completely or not at all.

ACID Properties:

Property	Meaning
Atomicity	All parts of a transaction succeed or none do.
Consistency	Database remains in valid state.
Isolation	Concurrent transactions don't interfere.
Durability	Once committed, changes are permanent.
✅ Practice Task:
Give an example where transactions are needed in a payment system.

📍 1.6 Views and CTEs
View: A virtual table based on a SQL query.

CTE: Temporary result set you can reference inside a query using WITH.

Example:

sql
Copy
Edit
WITH recent_orders AS (
  SELECT *
  FROM orders
  WHERE created_at >= '2024-01-01'
)
SELECT user_id, COUNT(*)
FROM recent_orders
GROUP BY user_id;
✅ Practice Task:
When would you prefer a CTE over a subquery?

📍 1.7 Window Functions
Functions that operate across a set of rows relative to the current row.

Example:

sql
Copy
Edit
SELECT user_id, order_id, 
       RANK() OVER(PARTITION BY user_id ORDER BY created_at DESC) as order_rank
FROM orders;
PARTITION BY = restart the window per user.

ORDER BY = sort within each partition.

✅ Practice Task:
Write a query to find each user's second most expensive order.

📍 1.8 Aggregations
GROUP BY groups data.

HAVING filters groups after aggregation.

Example:

sql
Copy
Edit
SELECT user_id, COUNT(*) as order_count
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 5;
✅ Practice Task:
Find customers who ordered more than 3 different products.

🛠️ 2. SQL Skills (Deep Dive)
Must-Master SQL Topics:
SELECT, WHERE, GROUP BY, ORDER BY

DISTINCT, LIMIT

CASE WHEN THEN ELSE

Nested Subqueries (in SELECT, FROM, WHERE)

Joins (Inner, Left, Right, Full)

CTEs and Views

Window Functions: ROW_NUMBER(), RANK(), SUM() OVER()

Aggregates: COUNT(), SUM(), AVG(), MIN(), MAX()

NULL handling: IS NULL, COALESCE(), CASE

Type casting: CAST(amount AS FLOAT)

✅ SQL Mini Challenge:
Write a query that shows, for each product category, the top 3 products by sales revenue.

🛠️ 3. Pandas Skills (for Data Analysis)
Pandas is Python’s answer to SQL.

Key Pandas Functions
Concept	SQL	Pandas
Select Columns	SELECT col1, col2 FROM table	df[['col1', 'col2']]
Filter Rows	WHERE condition	df[df['col'] > 5]
Sort Rows	ORDER BY col	df.sort_values('col')
Group and Aggregate	GROUP BY col	df.groupby('col').agg()
Join Tables	JOIN	pd.merge(df1, df2, on='key')
Create new Columns	SELECT CASE...	df['new_col'] = np.where(...)
Window Functions	OVER(PARTITION BY...)	df.groupby('col').rank()
Pivot Data	PIVOT	df.pivot_table()
Essential Pandas Patterns
python
Copy
Edit
import pandas as pd

# Load
df = pd.read_csv('data.csv')

# Filter
df[df['revenue'] > 1000]

# Group
df.groupby('category')['revenue'].sum()

# Merge
pd.merge(orders, users, on='user_id', how='left')

# Window
df['running_total'] = df['sales'].cumsum()

# Handle NULLs
df['discount'].fillna(0, inplace=True)
✅ Practice Task:
Download any sample dataset (like Kaggle's "Sales Data") and:

Filter top products

Find category-wise revenue

Fill missing prices

Rank products within each category

🛠️ 4. SQL + Pandas Workflow
Step	SQL	Pandas
1. Pull raw data from database	Use SELECT * FROM table	pd.read_sql(query, connection)
2. Preprocess basic filters and joins	Joins, Where, Subqueries	merge(), filtering
3. Feature engineering	CASE WHEN THEN	Create new columns
4. Aggregate & summarize	GROUP BY	groupby()
5. Model building or insights	No SQL	Scikit-learn, Matplotlib
