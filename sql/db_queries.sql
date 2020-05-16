# agores pou eginan me karta apo ton pelath me onoma...
SELECT *
FROM Transaction AS T, Customer as C
WHERE C.Card_number = 1 AND T.Card_number = C.Card_number
ORDER BY T.DateTime;

# agores pou eginan sto katasthma me kwdiko i
DROP TABLE IF EXISTS Agores_i;
CREATE TABLE Agores_i
SELECT * FROM Transaction AS T
WHERE T.Store_id = 1;

# view the contents of the most expensive transaction
SELECT P.Name, P.Price, Cat.Name
FROM Product as P, Contains as C, Agores_i as T, Category as Cat
WHERE  
T.DateTime = C.DateTime AND 
T.Card_number = C.Card_number AND 
P.Barcode = C.Product_barcode AND
P.Category_id = Cat.Category_id AND
T.Total_amount = (SELECT MAX(Total_amount) FROM Agores_i) 



