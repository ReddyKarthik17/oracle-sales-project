# Oracle Sales Project

A simple SQL project to manage products and sales. This project demonstrates table creation, data insertion, and basic queries to calculate revenue, top-selling products, and monthly sales growth.

## Project Structure

oracle-sales-project/
├── sales_project.sql # Contains SQL code for creating tables, inserting data, and example queries
├── README.md # Project description


---

## Tables

### **Products Table**
Stores product information.

| Column       | Data Type       | Description                  |
|-------------|----------------|------------------------------|
| product_id  | INT (Primary)  | Unique product ID            |
| product_name| VARCHAR(50)    | Name of the product          |
| category    | VARCHAR(50)    | Product category             |
| price       | DECIMAL(10,2)  | Price of the product         |

### **Sales Table**
Stores sales records.

| Column    | Data Type      | Description                        |
|-----------|----------------|------------------------------------|
| sale_id   | INT (Primary)  | Unique sale ID                     |
| product_id| INT (Foreign)  | References `Products(product_id)`  |
| quantity  | INT            | Quantity sold                       |
| sale_date | DATE           | Date of sale                        |

---

## Sample Data

**Products Table:**

| product_id | product_name | category    | price  |
|------------|--------------|------------|--------|
| 1          | Laptop       | Electronics| 60000  |
| 2          | Mobile       | Electronics| 20000  |
| 3          | Shoes        | Fashion    | 3000   |
| 4          | Watch        | Accessories| 5000   |

**Sales Table:**

| sale_id | product_id | quantity | sale_date   |
|---------|------------|---------|------------|
| 1       | 1          | 5       | 2025-09-01 |
| 2       | 2          | 10      | 2025-09-05 |
| 3       | 3          | 20      | 2025-09-10 |
| 4       | 1          | 3       | 2025-09-15 |
| 5       | 4          | 7       | 2025-09-18 |

---

## Example Queries

### 1. Total Revenue by Product
```sql
SELECT p.product_name, SUM(s.quantity * p.price) AS revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;
SELECT TO_CHAR(s.sale_date, 'YYYY-MM') AS month,
       SUM(s.quantity * p.price) AS monthly_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY TO_CHAR(s.sale_date, 'YYYY-MM')
ORDER BY month;
How to Run

Open your Oracle SQL environment (SQL Developer, SQL*Plus, etc.).

Copy and execute the sales_project.sql file.

Run the example queries to view results.

Notes

Ensure foreign key constraints are maintained (product_id in Sales references Products).

The project can be extended with more products, sales, or advanced queries like average revenue per category.
