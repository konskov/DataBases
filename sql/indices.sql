CREATE UNIQUE INDEX transaction_pk ON Transaction(DateTime, Store_id, Card_number);
CREATE UNIQUE INDEX category_pk ON Product(Barcode);
CREATE UNIQUE INDEX contains_pk ON Contains(Product_barcode, Card_number, DateTime, Store_id);
