# updatable
DROP VIEW IF EXISTS customer_info;
create view customer_info as
	select * from customer;
 
DROP VIEW IF EXISTS sales_per_product_category; 
create view sales_per_product_category as 
	select T.DateTime, T.Card_number, T.Store_id, P.Barcode, Ctg.Name
    FROM Transaction as T, Contains as Cn, Category as Ctg, Product as P
    WHERE 
    T.Card_number = Cn.Card_number
    AND T.DateTime = Cn.DateTime
	AND T.Store_id = Cn.Store_id
    AND Cn.Product_barcode = P.Barcode
    # AND Ctg.Category_id = 1
    ORDER BY T.DateTime, T.Card_number, T.Store_id, Ctg.Name
    
    
    
    