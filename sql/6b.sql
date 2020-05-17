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

# 10 most popular products
# popularity : how many times this product appears 
# in a transaction (regardless of the number of pieces)
SELECT DISTINCT ST.Barcode, ST.Name, COUNT(*)
FROM STRATOS AS ST
WHERE ST.Card_number = 2 GROUP BY ST.Barcode ORDER BY COUNT(*) DESC
LIMIT 0,10;

# visited stores
SELECT T.Store_id, S.Street, COUNT(*)
FROM Transaction as T, Store as S
WHERE T.Card_number = 1
AND T.Store_id = S.Store_id
GROUP BY T.Store_id;

# visiting times for each store

# monthly average money spent
SELECT MONTH(T.DateTime), SUM(T.Total_amount), COUNT(*)
FROM Transaction as T
WHERE T.Card_number = 1
GROUP BY MONTH(T.DateTime) ; -- hour(T.DateTime);

SET @weeks = (SELECT COUNT(*) 
FROM 
(
SELECT DISTINCT WEEK(T.DateTime)
FROM Transaction as T
GROUP BY WEEK(DateTime)
) AS SMTH); 

SET @months = (SELECT COUNT(*) 
FROM 
(
SELECT DISTINCT MONTH(T.DateTime)
FROM Transaction as T
GROUP BY MONTH(DateTime)
) AS SMTH); 

SET @total_spent = (
SELECT SUM(Total_amount)
FROM Transaction
WHERE Card_number = 1);

# monthly average = total_spent/number of months
SET @monthly = @total_spent / @months;
SET @weekly = @total_spent / @weeks;

SELECT @monthly;
SELECT @weekly;

# weekly average money spent
-- SELECT TMP.WK, TMP.SUM_TOT, SUM(TMP.SUM_TOT)/@weeks FROM 
-- (
-- SELECT WEEK(T.DateTime) AS WK, SUM(T.Total_amount) AS SUM_TOT, COUNT(*)
-- FROM Transaction as T
-- WHERE T.Card_number = 1
-- GROUP BY WEEK(T.DateTime)
-- ) AS TMP
-- GROUP BY TMP.WK;







