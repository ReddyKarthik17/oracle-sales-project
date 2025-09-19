-- =========================
-- Products Table
-- =========================
DROP TABLE Products CASCADE CONSTRAINTS;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR2(50),
    category VARCHAR2(50),
    price NUMBER(10,2)
);

-- Insert sample products
INSERT ALL
  INTO Products VALUES (1, 'Laptop', 'Electronics', 60000)
  INTO Products VALUES (2, 'Mobile', 'Electronics', 20000)
  INTO Products VALUES (3, 'Shoes', 'Fashion', 3000)
  INTO Products VALUES (4, 'Watch', 'Accessories', 5000)
SELECT * FROM dual;

-- =========================
-- Sales Table
-- =========================
DROP TABLE Sales CASCADE CONSTRAINTS;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert sample sales
INSERT ALL
  INTO Sales VALUES (1, 1, 5, DATE '2025-09-01')
  INTO Sales VALUES (2, 2, 10, DATE '2025-09-05')
  INTO Sales VALUES (3, 3, 20, DATE '2025-09-10')
  INTO Sales VALUES (4, 1, 3, DATE '2025-09-15')
  INTO Sales VALUES (5, 4, 7, DATE '2025-09-18')
SELECT * FROM dual;

-- =========================
-- Example Queries
-- =========================

-- 1. Total Revenue by Product
SELECT p.product_name, SUM(s.quantity * p.price) AS revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 2. Top Selling Product
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
FETCH FIRST 1 ROW ONLY;

-- 3. Monthly Sales Growth
SELECT TO_CHAR(s.sale_date,'YYYY-MM') AS month,
       SUM(s.quantity * p.price) AS monthly_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY TO_CHAR(s.sale_date,'YYYY-MM')
ORDER BY month;
