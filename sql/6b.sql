DROP TABLE IF EXISTS STRATOS;
CREATE TABLE STRATOS 
SELECT Transaction.Card_number, Transaction.DateTime, Transaction.Store_id,
Product.Name, Product.Price, Contains.Pieces, Transaction.Total_amount, 
Category.Category_id, Product.Barcode, Transaction.Payment_method
FROM Transaction
INNER JOIN Contains ON Transaction.Card_number = Contains.Card_Number AND Transaction.Datetime = Contains.Datetime
INNER JOIN Product ON Product.Barcode = Contains.Product_barcode
INNER JOIN Provides ON Product.Category_id = Provides.Category_id
INNER JOIN Category ON Category.Category_id = Provides.Category_id
GROUP BY Contains.Card_number, Contains.Datetime, Contains.Store_id, Product.Barcode;

SELECT DISTINCT ST.Barcode, ST.Name, COUNT(*)
FROM STRATOS AS ST
WHERE ST.Card_number = 2 GROUP BY ST.Barcode ORDER BY COUNT(*) DESC
LIMIT 0,10;

SELECT T.Store_id, S.Street, COUNT(*)
FROM Transaction as T, Store as S
WHERE T.Card_number = 1
AND T.Store_id = S.Store_id
GROUP BY T.Store_id;

SELECT Store_id, Street, Datetime
FROM STRATOS
WHERE Card_number = 3
GROUP BY Datetime 
ORDER BY DateTime;

SELECT MONTH(T.DateTime), SUM(T.Total_amount), COUNT(*)
FROM Transaction as T
WHERE T.Card_number = 1
GROUP BY MONTH(T.DateTime) ; -- hour(T.DateTime);

SET @min = 
(SELECT DateTime
FROM 
Transaction 
WHERE Card_number = 1
ORDER BY DateTime ASC
LIMIT 0,1); 

SET @max = 
(SELECT DateTime
FROM 
Transaction 
WHERE Card_number = 1
ORDER BY DateTime DESC
LIMIT 0,1); 

SET @months = abs(period_diff(extract(year_month from @min), extract(year_month from @max))) + 1;
SET @weeks = WEEK(@max) - WEEK(@min) + 1;

SET @total_spent = (
SELECT SUM(Total_amount)
FROM Transaction
WHERE Card_number = 1);

SET @monthly = @total_spent / @months;
SET @weekly = @total_spent / @weeks;
SELECT @min, @max, @weeks, @months, @weekly, @monthly;
