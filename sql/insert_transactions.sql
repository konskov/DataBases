DELIMITER $$
DROP PROCEDURE IF EXISTS insert_transactions $$  
CREATE PROCEDURE insert_transactions() 
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
	SET @MIN = '2020-05-13 09:00:00';
    SET @MAX = '2020-05-13 21:00:00';
    
    WHILE i < 5 DO 
		WHILE j < 10 DO
			SET @TS = (SELECT TIMESTAMPADD(SECOND, FLOOR(RAND() 
			* TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN));
            SET @R = RAND();
            IF (@R < 0.5) THEN SET @METHOD = 'Cash';
            ELSE SET @METHOD = 'Card';
            END IF;
                        
			INSERT INTO Transaction (Card_number, DateTime, Total_amount, Payment_method) 
            VALUES(i, @TS, NULL, @METHOD);
            
			SET j = j + 1;
        END WHILE;   
        SET j = 1;
        SET i = i + 1;
    END WHILE;    
END $$
DELIMITER ;
CALL insert_transactions();  

