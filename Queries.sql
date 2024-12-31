/* OBJECTIVE 1 - EXPLORE THE ITEMS TABLE */

-- Q.1. Get total number of items on menu
SELECT APPROX_COUNT_DISTINCT(menu_item_id) as item_count FROM master.dbo.menu_items 
--OR--
SELECT COUNT(*) as item_count from master.dbo.menu_items

--Q.2. What is the least expensive item on menu
SELECT TOP (1) [menu_item_id], [item_name], [category], [price] FROM [master].[dbo].[menu_items]
ORDER BY price ASC;

-- Q.3. What is the most exepensive item on menu
SELECT TOP (1) [menu_item_id], [item_name], [category], [price] FROM [master].[dbo].[menu_items]
ORDER BY price DESC;

--- Q.4. Get all the items where category is Italian and choose least and most expensive italian items on menu
SELECT COUNT(*) FROM master.dbo.menu_items
where category like 'Italian'

SELECT TOP (1) [menu_item_id], [item_name], [category], [price] FROM [master].[dbo].[menu_items]
where category like 'Italian'
ORDER BY price ASC;

SELECT TOP (1) [menu_item_id], [item_name], [category], [price] FROM [master].[dbo].[menu_items]
where category like 'Italian'
ORDER BY price DESC;

SELECT COUNT(menu_item_id) as item_count, category, AVG(price) as avg_price FROM [master].[dbo].[menu_items]
GROUP BY category

/* OBJECTIVE 2 - EXPLORE THE ORDERS TABLE */
-- Q.1. View the order details table
Select * FROM dbo.order_details

-- Q.2. Find the date range of the table 
Select min(order_date) as earliest_date, MAX(order_date) as latest_date from dbo.order_details

-- Q.3. How many orders were made within this date range
Select COUNT(Distinct(order_id)) as number_of_orders from dbo.order_details

-- Q.4. How many items were ordered within this date range
Select COUNT(*) from dbo.order_details

-- Q.5. Get the orders that had the most number of items
Select order_id, COUNT(order_details_id) as number_of_items from dbo.order_details
group by order_id
order by number_of_items desc

-- Q.6. How many orders had items more than 12
select count(*) from

(Select order_id, COUNT(order_details_id) as num_items from dbo.order_details
group by order_id
having COUNT(order_details_id) > 12) as num_orders

/* OBJECTIVE 3 - ANALYSE CUSTOMER BEHAVIOUR */

-- Q.1. Combine the menu items and order details in a single table
SELECT * FROM order_details as o
LEFT JOIN menu_items as m ON m.menu_item_id = o.item_id

-- Q.2. What were the least and most ordered items. State the categories as well
-- LEAST ORDERED ITEM
SELECT m.item_name, m.category, COUNT(o.order_details_id) as num_purchases FROM order_details as o
LEFT JOIN menu_items as m ON m.menu_item_id = o.item_id
GROUP BY m.item_name, m.category
ORDER BY num_purchases asc

-- MOST ORDERED ITEM
SELECT m.item_name, m.category, COUNT(o.order_details_id) as num_purchases FROM order_details as o
LEFT JOIN menu_items as m ON m.menu_item_id = o.item_id
GROUP BY m.item_name, m.category
ORDER BY num_purchases desc

-- Q.3. What were the top 5 orders that spent the most money
SELECT TOP (5) o.order_id, SUM(m.price) as total_order_price FROM order_details as o
LEFT JOIN menu_items as m ON m.menu_item_id = o.item_id
Group by o.order_id
Order by total_order_price desc

-- Q.4. View the details of the highest spent order. What insights can you get from this?
SELECT COUNT(o.item_id) as num_items, m.category FROM order_details as o
LEFT JOIN menu_items as m ON m.menu_item_id = o.item_id
WHERE o.order_id = '440'
group by m.category 

-- insights: American and Mexican food is comparatively cheaper than italian and asian food. Maximum items ordered from the menu were italian.

-- Q.5. View details of top 5 highest spent order. What insights can you get from this?
SELECT COUNT(o.item_id) as num_items, o.order_id, m.category FROM order_details as o
LEFT JOIN menu_items as m ON m.menu_item_id = o.item_id
WHERE o.order_id IN (440, 2075, 1957, 330, 2675)
group by m.category, o.order_id

-- insights: italian is the most ordered category and hence it should be kept in the menu.

-- Q.6. (BONUS QUESTION) What is the price of the highest spent order
SELECT SUM(m.price) as total_price FROM order_details as o
LEFT JOIN menu_items as m ON m.menu_item_id = o.item_id
WHERE o.order_id = '440'
order by total_price