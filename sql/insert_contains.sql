DELIMITER $$
DROP PROCEDURE IF EXISTS insert_contains $$  
CREATE PROCEDURE insert_contains() 

-- 	   Card_number int, 
--     DateTime timestamp,
--     Product_barcode varchar(13),
--     Pieces int,
BEGIN
	DECLARE n_customers INT DEFAULT 0;
	DECLARE n INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
    DECLARE k INT DEFAULT 0;
    DECLARE brc varchar(13);
    DECLARE prc numeric(10,2);
    DECLARE C INT;
    DECLARE DT timestamp;
    SET @AMOUNT = 0;
    
    SELECT COUNT(*) FROM Transaction INTO n;
    SELECT COUNT(*) FROM Customer INTO n_customers;
    
    WHILE k < n_customers DO 
		WHILE i < n DO 
		
			SELECT T.Card_number, T.DateTime INTO C, DT
			FROM Transaction AS T        
			LIMIT i, 1;
			
			SET @ITEMS = FLOOR(RAND()*5 + 1);
			WHILE j < @ITEMS DO
				SET @PCS = FLOOR(RAND()*3 + 1);
				SELECT P.Barcode, P.Price INTO brc, prc 
				FROM Product AS P -- ORDER BY P.Barcode
				LIMIT j, 1;
				INSERT INTO Contains (Card_number, DateTime, Product_barcode, Pieces) VALUES (C, DT, brc, @PCS);
				-- UPDATE Contains SET Product_barcode = brc, Pieces = @PCS 
	--             WHERE Card_number = C AND DateTime = DT;
				SET @AMOUNT = @AMOUNT + prc;
				SET j = j + 1;
			END WHILE;
			SET j = 0;
			UPDATE Transaction SET Total_amount = @AMOUNT 
			WHERE Card_number = C AND DateTime = DT;
			SET @AMOUNT = 0;
			SET i = i + 1;
		END WHILE;    
	END WHILE;	
    
    
END $$
DELIMITER ;
CALL insert_contains();  

