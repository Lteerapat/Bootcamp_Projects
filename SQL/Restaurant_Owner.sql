CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE menu_items (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_name TEXT NOT NULL,
    item_description TEXT NOT NULL,
    item_price REAL NOT NULL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

CREATE TABLE delivery (
    delivery_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    delivery_status TEXT NOT NULL,
    delivery_date DATE,
    delivery_address TEXT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (first_name, last_name, email, phone, address) VALUES 
  ("John", "Smith", "johnsmith@gmail.com", "088-888-8888", "123 Main St"),
  ("Jane", "Doe", "janedoe@gmail.com", "089-999-9999", "456 Park St"),
  ("Bob", "Johnson", "bobjohnson@gmail.com", "085-555-5555", "789 Elm St"),
  ("Mike", "Williams", "mikewilliams@gmail.com", "555-555-5558", "321 Oak St"),
  ("Emily", "Johnson", "emilyjohnson@gmail.com", "555-555-5559", "654 Pine St"),
  ("Jacob", "Smith", "jacobsmith@gmail.com", "555-555-5560", "987 Cedar St");

INSERT INTO menu_items (item_name, item_description, item_price) VALUES
  ("Margherita Pizza", "Tomato sauce, mozzarella, and basil", 12.99),
  ("Pepperoni Pizza", "Tomato sauce, mozzarella, pepperoni and oregano", 14.99),
  ("Vegetarian Pizza", "Tomato sauce, mozzarella, mushrooms, bell peppers, onions, and olives", 16.99),
  ("BBQ Chicken Pizza", "BBQ sauce, mozzarella, chicken, onions and cilantro", 17.99),
  ("Hawaiian Pizza", "Tomato sauce, mozzarella, pineapple, ham", 14.99),
  ("Meat Lovers Pizza", "Tomato sauce, mozzarella, pepperoni, sausage, bacon, ground beef", 19.99),
  ("Seafood Pizza", "Tomato sauce, mozzarella, shrimp, crabmeat, scallops", 22.99),
  ("Buffalo Chicken Pizza", "Buffalo sauce, mozzarella, chicken, blue cheese crumbles", 18.99),
  ("Spinach and Feta Pizza", "Tomato sauce, mozzarella, spinach, feta cheese, black olives", 16.99);
  
INSERT INTO orders (customer_id, order_date) VALUES
  (1, date('now')),
  (2, date('now')),
  (3, date('now')),
  (4, date('now')),
  (5, date('now')),
  (6, date('now'));

INSERT INTO order_items (order_id, item_id, quantity) VALUES
  (1, 1, 1),
  (1, 2, 2),
  (2, 3, 3),
  (3, 2, 1),
  (3, 4, 2),
  (4, 5, 1),
  (5, 6, 2),
  (6, 7, 4);
  
INSERT INTO delivery (order_id, delivery_status, delivery_date, delivery_address) VALUES
  (1, "pending", date('now'), "123 Main St"),
  (2, "delivered", date('now'), "456 Park St"),
  (3, "in_progress", date('now'), "789 Elm St"),
  (4, "pending", date('now'), "321 Oak St"),
  (5, "delivered", date('now'), "654 Pine St"),
  (6, "in_progress", date('now'), "987 Cedar St");

.mode markdown
.header on

-- Find the total number of orders for each customer
SELECT first_name, last_name, COUNT(order_id) as total_orders
FROM customers 
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id;

-- Find the total revenue for each menu item
SELECT item_name, SUM(item_price * quantity) as total_revenue
FROM menu_items
JOIN order_items ON menu_items.item_id = order_items.item_id
GROUP BY menu_items.item_id;

-- Find the average delivery time for all orders
SELECT AVG(julianday(delivery_date) - julianday(order_date)) as avg_delivery_time
FROM delivery
JOIN orders ON delivery.order_id = orders.order_id;

-- Find the total number of orders for each menu item
SELECT item_name, SUM(quantity) as total_orders
FROM menu_items
JOIN order_items ON menu_items.item_id = order_items.item_id
GROUP BY menu_items.item_id;

-- Find the most popular menu item
WITH popular_item AS (
  SELECT item_id, SUM(quantity) as total_quantity
  FROM order_items
  GROUP BY item_id
  ORDER BY total_quantity DESC
  LIMIT 1
)
SELECT item_name FROM menu_items
WHERE item_id = (SELECT item_id FROM popular_item);
