-- 1. Вывести информацию о заказах клиентов не из `Germany` и не из `China`

SELECT
   orders.*
FROM orders

JOIN customers ON orders.CustomerID=customers.CustomerID

WHERE customers.Country NOT IN ('Germany', 'China')

-- 2. Вывести два самых дорогих товара из категории `Beverages`

SELECT
   products.*
FROM products

JOIN categories ON products.CategoryID=categories.CategoryID

WHERE categories.CategoryName = 'Beverages'

ORDER BY products.Price DESC
LIMIT 2

-- 3. Удалить поставщиков из `China`\

DELETE FROM Suppliers
WHERE Country = 'China'

-- 4. Вывести все заказы клиента `10`, которые повезет `Federal Shipping`

SELECT
   orders.*
FROM orders

JOIN customers ON orders.CustomerID=customers.CustomerID
JOIN shippers ON orders.shipperID=shippers.shipperID

WHERE
   customers.CustomerID = 10
   AND
   shippers.ShipperName = 'Federal Shipping'

-- 5. Вывести два самых дорогих напитка из `UK`

SELECT
   products.*
FROM products

JOIN categories ON products.CategoryID=categories.CategoryID
JOIN suppliers ON products.SupplierID=suppliers.SupplierID

WHERE 
   categories.Description LIKE '%drink%'
   AND
   suppliers.Country = 'UK'
   
ORDER BY products.Price DESC
LIMIT 2

-- 6. Вывести страны-поставщики напитков

SELECT DISTINCT 
   suppliers.Country
FROM products

JOIN suppliers ON products.supplierID=suppliers.supplierID
JOIN categories ON products.CategoryID=categories.CategoryID

WHERE categories.Description LIKE '%drink%'
