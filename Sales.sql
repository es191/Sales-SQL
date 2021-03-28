# Creating of table
CREATE TABLE sales (
	user_id number not null primary key, 
	buyer VARCHAR2 (30) not null,
	type_of_buyer VARCHAR2(30) ,
	country VARCHAR2(30) not null,
	city VARCHAR2 (30),
	contract integer,
	orders integer,
	duration_of_contract integer ,
	price_of_orders integer
)

# Inserting the data
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (1, 'Perekrestok', 'Network', 'Russia', 'St.Petergurg', 2314589, 5, 8, 1300);
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (2, 'Magnit', 'Network', 'Russia', 'Moscow', 2304785, 3, 4, 1950);
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (3, 'Perspektiva', 'IP', 'Belarus', 'Minsk', 2414590, 1, 2, 847);
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (4, 'Lavrentev', 'Wholesales', 'Poland', 'Warsaw', 2512563, 8, 2, 8172); 
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (5, 'Dorogy', 'IP', 'Belarus', 'Minsk', 2958172, 5, 2, 5849);
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (6, 'Nori', 'Wholesales', 'Poland', 'Warsaw', 2491028, 6, 1, 7403);
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (7, 'Dinamo', 'IP', 'Ukraine', 'Kiev', 2418279, 4, 5, 2582);
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (8, 'Nevsky', '', 'Belarus', '', 2391758, 2, 6, 4851);
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (9, 'Spartak', '', 'Ukraine', '', 2301928, 5, 7, 1759);
INSERT INTO sales 
(user_id, buyer, type_of_buyer, country, city, contract, orders, duration_of_contract, price_of_orders)
VALUES (10, 'Nardis', '', 'Japan', '', 2401947, 10, 3, 8192);

#Queries
SELECT * FROM sales
WHERE price_of_orders > 2000 AND contract LIKE '24%'; 

SELECT CONCAT(upper('this is our customer:'), buyer, lower('the number of contract is: '), TO_CHAR(contract)) 
FROM sales

SELECT CONCAT (CONCAT (initcap ('this is our customer:'), upper (buyer)),
            	CONCAT (lower(' the number of contract is: '), contract )) as information
FROM sales 

SELECT * FROm sales
WHERE MOD(price_of_orders, 2) =0 
OR price_of_orders < 3500

SELECT * FROM sales # ОШИБКА!!!
WHERE EXISTS (SELECT * FROM sales WHERE country='Russia')

SELECT contract, price_of_orders, 
CASE 
	WHEN (price_of_orders <1000) THEN 'Poor'
	WHEN (price_of_orders BETWEEN 1001 AND 2500) THEN 'Rich'
	ELSE 'Very Rich'
	END 
FROM sales
ORDER BY price_of_orders DESC

SELECT city FROM sales
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY

#Functions  
SELECT count (NULLIF(LENGTH(country),6)) as comparing_6
FROM sales

SELECT country ,MAX(price_of_orders) 
FROM sales
GROUP BY country 

SELECT country, ROUND (AVG (duration_of_contract), 2)
FROM sales
GROUP BY country;

SELECT country, count (*) 
FROM sales
GROUP BY country 
HAVING count(*) >=2;