# poio katasthma kanei tis perissoteres pwlhseis
# dhladh dexetai thn perissoterh kinhsh
SELECT COUNT(*) 
FROM Transaction as T
GROUP BY T.Store_id
ORDER BY COUNT(*) DESC;

# πώς μεταβάλλεται ο λόγος πωλήσεις μονάδων προϊόντος ανά συναλλαγή 
# πριν και μετά την αλλαγή της τιμής
SET @total_before = (SELECT COUNT(*)
FROM Transaction as T
WHERE
T.DateTime <= '2020-05-10 20:45:56');

SET @total_after = (SELECT COUNT(*)
FROM Transaction as T
WHERE
T.DateTime <= '2020-05-10 20:45:56');

SET @before = (SELECT SUM(Cn.Pieces)
FROM Transaction as T, Contains as Cn, Product as P
WHERE
T.Card_number = Cn.Card_number 
AND T.DateTime = Cn.DateTime
AND T.Store_id = Cn.Store_id 
AND Cn.Product_barcode = P.Barcode
AND P.Barcode = '1234567890'
AND T.DateTime <= '2020-05-10 20:45:56');

SET @after = (SELECT SUM(Cn.Pieces)
FROM Transaction as T, Contains as Cn, Product as P
WHERE
T.Card_number = Cn.Card_number 
AND T.DateTime = Cn.DateTime
AND T.Store_id = Cn.Store_id 
AND Cn.Product_barcode = P.Barcode
AND P.Barcode = '1234567890'
AND T.DateTime >= '2020-05-10 20:45:56');

select IF(@total_before,@before/@total_before,0) as "before", 
IF(@total_after,@after/@total_after,0) as "after";

