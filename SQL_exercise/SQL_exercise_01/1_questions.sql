-- LINK: The_computer_store
-- 1.1 Select the names of all the products in the store.
\c db11;
Select name from products;
-- 1.2 Select the names and the prices of all the products in the store.
SELECT name,price from products;
-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT name from products WHERE price<=200
-- 1.4 Select all the products with a price between $60 and $120.
SELECT * from products WHERE price BETWEEN 60 AND 120;
-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by
-- 100).
SELECT name,price*100 price_cent FROM products;
-- 1.6 Compute the average price of all the products.
SELECT avg(price) FROM products;
-- 1.7 Compute the average price of all products with manufacturer code equal to
-- 2.
SELECT avg(price) from products WHERE manufacturer=2;
-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT count(*) FROM products WHERE price >= 180;
-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT name,price from products WHERE price >= 180
ORDER by price DESC,name ASC;
-- 1.10 Select all the data from the products, including all the data for each
-- product's manufacturer.

SELECT * FROM products a INNER join manufacturers b ON a.manufacturer=b.code;

-- 1.11 Select the product name, price, and manufacturer name of all the
-- products.
SELECT a.name pro_name, a.price ,b.name manu_name FROM products a INNER join manufacturers b ON a.manufacturer=b.code;
-- 1.12 Select the average price of each manufacturer's products, showing only
-- the manufacturer's code.
SELECT ROUND(AVG(price),2),manufacturer FROM products
GROUP BY manufacturer;
-- 1.13 Select the average price of each manufacturer's products, showing the
-- manufacturer's name.
SELECT ROUND(AVG(a.price),2) avg_price,b.name manu_name FROM products a INNER join manufacturers b ON a.manufacturer=b.code
GROUP BY b.name;
-- 1.14 Select the names of manufacturer whose products have an average price
-- larger than or equal to $150.
SELECT b.name manu_name FROM products a INNER join manufacturers b ON a.manufacturer=b.code
GROUP BY b.name,a.price
HAVING avg(a.price)>=150;
-- 1.15 Select the name and price of the cheapest product.
SELECT name, price cheapest FROM products
WHERE price=(SELECT min(price) FROM products);
-- 1.16 Select the name of each manufacturer along with the name and price of
-- its most expensive product.
SELECT a.price,b.name FROM products a INNER JOIN manufacturers b on a.manufacturer=b.code
GROUP by a.price,b.name
HAVING price=(SELECT max(price) FROM products);
-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO products(Code,Name,Price,Manufacturer) VALUES(11,'Loudspeakers',70,2);
SELECT * FROM products;
-- 1.18 Update the name of product 8 to "Laser Printer".
UPDATE products SET name='Laser Printer'
WHERE name='Printer';
-- 1.19 Apply a 10% discount to all products.
SELECT name,price*0.9 cheaper from products;
-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
SELECT name,price*0.9 cheaper from products
WHERE price >=120;