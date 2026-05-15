# Food-Delivery-SQL-Project
This SQL project simulates a real-world food delivery platform like Zomato or Swiggy. The database manages:  Customers Restaurants Food Items Orders Delivery Partners Payments
# 🍕 Food Delivery SQL Project

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=amazon-dynamodb&logoColor=white)
![pgAdmin](https://img.shields.io/badge/pgAdmin-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)

> A real-world SQL project simulating a food delivery platform like **Zomato** or **Swiggy** — built with PostgreSQL, covering database design, data import, and business analytics queries.

---

## 📌 Project Overview

This project models the complete backend database of a food delivery application. It includes real-world datasets for customers, restaurants, food items, orders, and delivery partners — along with SQL queries to extract meaningful business insights.

---

## 🗂️ Project Structure

```
Food-Delivery-SQL-Project/
│
├── 📄 Food Delivery Sql Project.sql   # All SQL queries & schema
├── 📊 Customers.csv                   # Customer dataset
├── 📊 Restaurants.csv                 # Restaurant dataset
├── 📊 Food_Items.csv                  # Menu / food items dataset
├── 📊 Orders.csv                      # Orders dataset
├── 📊 Delivery_Partners.csv           # Delivery agents dataset
└── 📝 README.md                       # Project documentation
```

---

## 🗃️ Database Schema

### Tables & Description

| Table               | Description                                          |
|---------------------|------------------------------------------------------|
| `customers`         | Registered users who place food orders               |
| `restaurants`       | Partner restaurants listed on the platform           |
| `food_items`        | Menu items offered by each restaurant                |
| `orders`            | Orders placed by customers with status & amount      |
| `delivery_partners` | Delivery agents responsible for fulfilling orders    |

### Key Relationships

```
customers ──< orders >── restaurants
orders ──< food_items
orders ──── delivery_partners
```

---

## ⚙️ How to Run This Project

### Prerequisites
- [PostgreSQL](https://www.postgresql.org/download/) installed
- [pgAdmin](https://www.pgadmin.org/download/) or any SQL client

### Steps

**1. Create the database**
```sql
CREATE DATABASE food_delivery;
```

**2. Import CSV files**

In pgAdmin → right-click table → **Import/Export** → select the CSV file

Or use the COPY command:
```sql
COPY customers FROM 'C:/path/to/Customers.csv' DELIMITER ',' CSV HEADER;
COPY restaurants FROM 'C:/path/to/Restaurants.csv' DELIMITER ',' CSV HEADER;
COPY food_items FROM 'C:/path/to/Food_Items.csv' DELIMITER ',' CSV HEADER;
COPY orders FROM 'C:/path/to/Orders.csv' DELIMITER ',' CSV HEADER;
COPY delivery_partners FROM 'C:/path/to/Delivery_Partners.csv' DELIMITER ',' CSV HEADER;
```

**3. Run the SQL file**
```sql
-- Open Food Delivery Sql Project.sql in pgAdmin and execute
```

---

## 📊 Sample SQL Queries

### 🔹 Total Orders per Restaurant
```sql
SELECT r.restaurant_name, COUNT(o.order_id) AS total_orders
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_orders DESC;
```

### 🔹 Top 5 Customers by Spending
```sql
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
```

### 🔹 Average Delivery Time per Partner
```sql
SELECT dp.partner_name,
       ROUND(AVG(o.delivery_time_minutes), 2) AS avg_delivery_time
FROM delivery_partners dp
JOIN orders o ON dp.partner_id = o.partner_id
GROUP BY dp.partner_name
ORDER BY avg_delivery_time;
```

### 🔹 Most Ordered Food Items
```sql
SELECT f.item_name, COUNT(o.order_id) AS times_ordered
FROM food_items f
JOIN orders o ON f.item_id = o.item_id
GROUP BY f.item_name
ORDER BY times_ordered DESC
LIMIT 10;
```

### 🔹 Daily Revenue Report
```sql
SELECT DATE(order_date) AS date,
       SUM(total_amount) AS daily_revenue
FROM orders
GROUP BY DATE(order_date)
ORDER BY date;
```

---

## 💡 SQL Concepts Covered

- ✅ Database design & normalization
- ✅ Primary & Foreign Key constraints
- ✅ `JOIN` — INNER, LEFT, RIGHT
- ✅ Aggregate functions — `SUM`, `COUNT`, `AVG`, `MAX`, `MIN`
- ✅ `GROUP BY`, `HAVING`, `ORDER BY`
- ✅ Subqueries & CTEs (`WITH` clause)
- ✅ Window functions — `RANK()`, `ROW_NUMBER()`
- ✅ Date & time functions
- ✅ Data import from CSV

---

## 🛠️ Tools & Technologies

| Tool         | Purpose                        |
|--------------|-------------------------------|
| PostgreSQL   | Database engine                |
| pgAdmin      | GUI for running queries        |
| CSV Dataset  | Raw data for all tables        |
| GitHub       | Version control & sharing      |

---

## 👤 Author

**Amit Kumar**
- GitHub: [@amit8434](https://github.com/amit8434)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

⭐ **If you found this project helpful, please give it a star!**
