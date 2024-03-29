drop database if exists testdb;

create database testdb;

use testdb;

CREATE TABLE Store (
    -- maybe an int auto_increment
	Store_id int not null auto_increment,
    -- maybe this should be a complex attribute 
    -- (opening time, closing time)
    -- so that it can be of type time
    Operating_hours varchar(255),
    Size int not null,
    Street varchar(255) not null check (Street <> ''),
    -- could be 55-57A
    Number varchar(20) not null,
    Postal_code numeric(5,0) not null,
    City varchar(255) not null check (City <> ''),
    primary key (Store_id)
);

CREATE TABLE Customer (
	Card_number int not null auto_increment,
	Name varchar(255) not null check (Name <> ''),
    Date_of_birth date,
    Points int default 0 not null,
    Phone_number varchar(14),
    Pet varchar(255),
    Family_members int default 0,
    Street varchar(255) not null check (Street <> ''),
    Number int not null,
    Postal_code numeric(5,0) not null, 
    City varchar(255) not null check (City <> ''),
    primary key (Card_number)
);

CREATE TABLE Category (
	Category_id int not null auto_increment,
    -- maybe remove the check?
    Name varchar(255) unique, check (Name in 
		('Fresh', 'Fridge', 'Spirits', 'Personal Care', 'Home', 'Pets')),
    primary key (Category_id)
);

CREATE TABLE Product (
    Category_id int,
	Barcode varchar(13) not null check (Barcode <> ''),
    Price numeric(10,2) not null, 
	Name varchar(255) not null check (Name <> ''),
    Brand_name bool,
    primary key (Barcode),
    foreign key (Category_id) references Category(Category_id) on delete cascade
);

CREATE TABLE Phone_number (
	Store_id int,
    Phone varchar(14),
    primary key (Store_id, Phone),
    foreign key (Store_id) references Store(Store_id) on delete cascade
);   

CREATE TABLE Transaction (
-- TODO add Store_id
-- so we can see which store 
-- the customer visited
	Store_id int,
	Card_number int,
    DateTime timestamp,
    Total_amount numeric(15,2),
    Total_pieces int,
    Payment_method varchar(10), check (Payment_method in 
		('Cash', 'Card', 'Points')),
    primary key (Card_number, DateTime, Store_id),
    foreign key (Card_number) references Customer(Card_number) on delete cascade on update cascade,
    foreign key (Store_id) references Store(Store_id) on delete cascade on update cascade
); 

CREATE TABLE Contains (
	Card_number int, 
    DateTime timestamp,
    Product_barcode varchar(13) default '',
    Store_id int,
    Pieces int,
    primary key (Card_number, DateTime, Store_id, Product_barcode),
    foreign key (Card_number, DateTime, Store_id) references Transaction(Card_number, DateTime, Store_id) on delete cascade on update cascade,
    foreign key (Product_barcode) references Product(Barcode) on delete cascade on update cascade
);

CREATE TABLE Provides (
	Category_id int, 
    Store_id int,
    primary key (Category_id, Store_id),
    foreign key (Category_id) references Category(Category_id) on delete cascade,
    foreign key (Store_id) references Store(Store_id) on delete cascade
);

CREATE TABLE Offers (
	Store_id int,
	Product_barcode varchar(13),
    Alley_number int,
    Shelf_number int,
    primary key (Product_barcode, Store_id),
    foreign key (Product_barcode) references Product(Barcode) on delete cascade,
    foreign key (Store_id) references Store(Store_id) on delete cascade
);

CREATE TABLE Older_prices (
	Product_barcode varchar(13),
    Start_date timestamp,
    Price real,
    End_date timestamp,
    primary key (Product_barcode, Start_date),
    foreign key (Product_barcode) references Product(Barcode) on delete cascade,
    constraint check_date check ((Start_date <= End_date) or End_date = NULL) 
);

CREATE UNIQUE INDEX transaction_pk ON Transaction(DateTime, Store_id, Card_number);
CREATE UNIQUE INDEX category_pk ON Product(Barcode);
CREATE UNIQUE INDEX contains_pk ON Contains(Product_barcode, Card_number, DateTime, Store_id);
