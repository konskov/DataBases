SELECT DATE(Start_date), Older_prices.Price
FROM Product, Older_prices
WHERE Product.Barcode = Older_prices.Product_barcode
AND Product_barcode = 1234567890
ORDER BY Start_date;