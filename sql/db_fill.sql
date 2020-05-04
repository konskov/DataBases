use testdb;

insert into Store
(Operating_hours, Size, Street, Number, Postal_code, City)
values
('0800-2000', 400, 'Papadiamantopoulou', 7, 17345, 'Zografou'),
('0800-2000', 520, 'Mpiskini', 3, 17545, 'Attiki'),
('0830-2100', 650, 'Liosion', 7, 15325, 'Patisia'),
('0900-2100', 1000, 'Katsoni', '15B', 18020, 'Ilisia');

insert into Category
(Name)
values
('Fresh'),
('Fridge'),
('Spirits'),
('Personal Care'),
('Home'),
('Pets');

insert into Customer 
(Name, Date_of_birth, Points, Phone_number, Pet, Family_members, Street, Number, Postal_code, City)
values
('Marios Mariou', '1993-01-02', 0, '+306978453410', '', 'Mother', 'Mpiskini', 90, 17675, 'Athens'),
('Kon Skov', '1995-05-08', 10, '6975463423', 'Dog', 'Sister', 'Papagou', 45, 15236, 'Vyronas'),
('Gill Grant', '1908-02-04', 0, '2107721085', '', '', 'Xlois', 5, 17675, 'Athens'),
('Katerina Mai', '1998-06-11', 560, '6974816552', 'Cat', 'Brother', 'Papagou', 45, 15236, 'Vyronas');

insert into Product
(Barcode, Price, Name, Brand_name)
values
-- Fridge
('1234567890', 5.72, 'Milk 4%', False),
('1234567891', 5.2, 'Yogurt Own Brand 2%', True),
('1234567892', 6.92, 'Milk 2%', False),
('1234567893', 5.72, 'Yogurt Own Brand 10%', True),
('1234567894', 4.63, 'Cheese 1', False),
('1234567895', 3.63, 'Cheese 2', False),
('1234567896', 9.09, 'Cheese 3', False),
('1234567897', 2.13, 'Vitaline', False),
('1234567898', 0.34, 'Cheese Own Brand', True),
('1234567899', 2.6, 'Activia', False),
-- Spirits
('1234567900', 4.33, 'Beer Own Brand', True),
('1234567901', 9.33, 'Corona', False),
('1234567902', 6.73, 'Wine Rose', False),
('1234567903', 4.33, 'Wine Red Own', True),
('1234567904', 9.37, 'Wine White Own', True),
('1234567905', 6.52, 'Wine Blue', False),
('1234567906', 4.33, 'Cognac Own', True),
('1234567907', 40, 'Champagne', False),
('1234567908', 45.33, 'Vodka', False),
('1234567909', 4.33, 'Cider Own', True),
('1234567910', 4.33, 'Somersby', False),
-- Home
('1234567911', 5.33, 'Pillow Own', True),
('1234567912', 6.73, 'Pillow', False),
('1234567913', 3.40, 'Chlorine', False),
('1234567914', 7.33, 'Sheet Cotton Own', True),
('1234567915', 8.50, 'Blanket Wool', False),
('1234567916', 16.90, 'Sheet Cotton', False),
('1234567917', 28.90, 'Coffee Machine', False),
('1234567918', 4.50, 'Plate Blue', False),
('1234567919', 4.50, 'Plate Pink', False),
('1234567920', 4.50, 'Plate Silver', False),
-- Personal care
('1234567921', 9.34, 'Shampoo 1', True),
('1234567922', 4.1, 'Razors', False),
('1234567923', 4.33, 'Personal Care 1', False),
('1234567924', 7.33, 'Personal Care 2', False),
('1234567925', 8.33, 'PerCareProd 3', False),
('1234567926', 9.33, 'PerCareProd 4', False),
('1234567927', 4.53, 'Conditioner Own Brand', True),
('1234567928', 2.58, 'Body Wash', False),
('1234567929', 6.5, 'Hair Spray', False),
('1234567930', 4.33, 'Sanitiser Own Brand', True),
-- Fresh
('1234567931', 4.28, 'Oranges 3kg', False),
('1234567932', 4.69, 'Potatoes 4kg', False),
('1234567933', 9.62, 'Chicken', False),
('1234567934', 7.85, 'Fish', False),
('1234567935', 8.3, 'Meat Pork 1kg', False),
('1234567936', 4.28, 'Tomatoes 3kg', False),
('1234567937', 2.28, 'Lemons 1kg', False),
('1234567938', 2.45, 'Apples 1kg', False),
('1234567939', 14.65, 'Meat Beef 1kg', False),
('1234567940', 0.70, 'Lettuce 1pc', False),
-- Pets
('1234567941', 4.28, 'Cat Food Own', True),
('1234567942', 5.68, 'Whiskers 1pc', False),
('1234567943', 5.68, 'Dog Food Own', True),
('1234567944', 5.90, 'Dog Food 1', False),
('1234567945', 6.68, 'Dog Food 2', False),
('1234567946', 4.52, 'Toy Mouse', False),
('1234567947', 3.20, 'Fish Food 1', False),
('1234567948', 4.36, 'Fish Food 2', False),
('1234567949', 25.00, 'Dog Crate', False),
('1234567950', 15.68, 'Cat Crate', False),
('1234567951', 5, 'Cat Food 1', False);


































