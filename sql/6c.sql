# dhmofilestera zeugh proiontwn 
explain SELECT T.DateTime, T.Card_number, T.Store_id, P1.Barcode, P2.Barcode, COUNT(*)
FROM Product AS P1, Product AS P2, Transaction as T, Contains as C1, Contains as C2
WHERE
# T.Card_number = 1 AND
T.Card_number = C1.Card_number 
AND T.DateTime = C1.DateTime
AND T.Store_id = C1.Store_id 
AND T.Card_number = C2.Card_number 
AND T.DateTime = C2.DateTime
AND T.Store_id = C2.Store_id 
AND P1.Barcode < P2.Barcode 
AND P1.Barcode = C1.Product_barcode 
AND P2.Barcode = C2.Product_barcode
GROUP BY P1.Barcode, P2.Barcode -- T.Card_number, T.DateTime, T.Store_id
ORDER BY COUNT(*) DESC;

# pososto ana kathgoria proiontwn pou empisteuetai o kosmos 
# label tou katasthmatos
# asxhmo query alla douleuei
SET @bn = (SELECT COUNT(*)  
FROM Transaction as T, Contains as Cn, Category as Ctg, Product as P 
WHERE Ctg.Category_id = 6
AND P.Category_id = 6
AND T.DateTime = Cn.DateTime
AND T.Card_number = Cn.Card_number 
AND T.Store_id = Cn.Store_id 
AND Cn.Product_barcode = P.Barcode
AND P.Brand_name = True
ORDER BY T.DateTime);

SET @total = (SELECT COUNT(*)  
FROM Transaction as T, Contains as Cn, Category as Ctg, Product as P 
WHERE Ctg.Category_id = 6
AND P.Category_id = 6
AND T.DateTime = Cn.DateTime
AND T.Card_number = Cn.Card_number 
AND T.Store_id = Cn.Store_id 
AND Cn.Product_barcode = P.Barcode
# AND P.Brand_name = True
ORDER BY T.DateTime);

SELECT cast((1.0*@bn / @total *100) as decimal(10,2)) as percentage;

# dhmofileis theseis tou katasthmatos
# alley_number opou ginontai oi perissoteres pwlhseis
# douleuei to query alla kalo tha htan na prosthesw merika proionta
explain SELECT O.Alley_number,O.Shelf_number, COUNT(*)  
FROM Transaction as T, Contains as C, Product as P, Offers as O
WHERE 
T.DateTime = C.DateTime
AND T.Card_number = C.Card_number 
AND T.Store_id = C.Store_id 
AND C.Product_barcode = P.Barcode
AND O.Product_barcode = P.Barcode
AND T.Store_id = O.Store_id
AND T.Store_id = 3
GROUP BY O.Alley_number, O.Shelf_number
ORDER BY COUNT(*) DESC;

# wres pou ksodeuontai ta perissotera lefta
SELECT HOUR(T.DateTime), SUM(T.Total_amount), COUNT(*)
FROM Transaction as T
GROUP BY HOUR(DateTime)
ORDER BY SUM(T.Total_amount) DESC;

# pososto twn synallagwn pou ginontai kathe wra sto katasthma apo 
# atoma pou anikoun sto kathe age group
SELECT hour(DateTime) AS Hour, Age_group, count(*) AS Count
FROM  (
SELECT *
FROM Transaction as T
natural join Customer as C
NATURAL JOIN
(
SELECT Card_number,
(
	CASE
		WHEN Age < 30 THEN "18 - 30"
        WHEN Age BETWEEN 30 AND 50 THEN "30 - 50"
        WHEN Age > 50 THEN "50+"
    END) as Age_group
FROM 
(SELECT Card_number, TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age FROM Customer) as sk
) as sk
) as sk
where Store_id = 1
group by hour(DateTime), Age_group
order by hour(DateTime);





