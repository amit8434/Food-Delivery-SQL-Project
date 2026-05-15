CREATE DATABASE Food_Delivery


-- Customers Table-

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15),
    signup_date DATE
);

-- Restaurants Table--

CREATE TABLE Restaurants (
    restaurant_id SERIAL PRIMARY KEY,
    restaurant_name VARCHAR(100),
    cuisine_type VARCHAR(50),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);

-- Food_Items Table--

CREATE TABLE Food_Items (
    item_id SERIAL PRIMARY KEY,
    restaurant_id INT REFERENCES Restaurants(restaurant_id),
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Delivery_Partners Table--

CREATE TABLE Delivery_Partners (
    partner_id SERIAL PRIMARY KEY,
    partner_name VARCHAR(100),
    vehicle_type VARCHAR(50),
    city VARCHAR(50)
);

-- Orders Table---

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    restaurant_id INT REFERENCES Restaurants(restaurant_id),
    partner_id INT REFERENCES Delivery_Partners(partner_id),
    order_date DATE,
    total_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    order_status VARCHAR(50)
);


SELECT * FROM Customers;
SELECT * FROM Restaurants;
SELECT * FROM Food_Items;
SELECT * FROM Delivery_Partners;
SELECT * FROM Orders;


-- Import Data into Customers Table--
Copy Customers(customer_id,customer_name,city,phone,signup_date)
from 'D:\Downloads\Food Delivery Sql Project\Customers.csv'
delimiter ','
CSV Header;

-- Import Data into Restaurants Table--
Copy Restaurants(restaurant_id,restaurant_name,cuisine_type,city,rating)
from 'D:\Downloads\Food Delivery Sql Project\Restaurants.csv'
delimiter ','
CSV Header;

-- Import Data into Food_Items Table--
Copy Food_Items(item_id,restaurant_id,item_name,category,price)
from 'D:\Downloads\Food Delivery Sql Project\Food_Items.csv'
delimiter ','
CSV Header;

-- Import Data into Delivery_Partners Table--
Copy Delivery_Partners(partner_id,partner_name,vehicle_type,city )
from 'D:\Downloads\Food Delivery Sql Project\Delivery_Partners.csv'
delimiter ','
CSV Header;

-- Import Data into Orders Table--
Copy Orders(order_id,customer_id,restaurant_id,partner_id,order_date,total_amount,payment_method,order_status )
from 'D:\Downloads\Food Delivery Sql Project\Orders.csv'
delimiter ','
CSV Header;

--Pending orders--
SELECT * FROM Orders
WHERE order_status = 'Pending';

-- Show Restaurants with Rating Above 4--
SELECT restaurant_name, rating
FROM Restaurants
WHERE rating > 4;

--Total orders placed by each customer--
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;

-- Show all menu items of a restaurant
SELECT r.restaurant_name, f.item_name, f.price
FROM Food_Items f
JOIN Restaurants r ON f.restaurant_id = r.restaurant_id
WHERE r.restaurant_name = 'Spice Hub';

-- Most ordered food item--
SELECT restaurant_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY restaurant_id
ORDER BY total_orders DESC
LIMIT 1;