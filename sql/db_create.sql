drop database if exists testdb;

create database testdb;

use testdb;

CREATE TABLE Store (
	Store_id varchar(255) not null check (Store_id <> ''),
    Operating_hours varchar(255),
    Size int,
    Street varchar(255),
    Number int,
    Postal_code numeric(5,0) not null,
    City varchar(255),
    primary key (Store_id)
);

CREATE TABLE Customer (
	Card_number int not null auto_increment,
	Name varchar(255),
    Date_of_birth date,
    Points int,
    Phone_number varchar(255),
    Pet varchar(255),
    Family_members varchar(255),
    Street varchar(255),
    Number int,
    Postal_code numeric(5,0), 
    City varchar(255),
    primary key (Card_number)
);

CREATE TABLE Category (
	Category_id int,
    Name varchar(255),
    primary key (Category_id)
);

CREATE TABLE Product (
	Barcode varchar(13),
    Price real, 
	Name varchar(255),
    Brand_name bool,
    primary key (Barcode),
    foreign key (Category_id) references Category
);

CREATE TABLE Phone_number (
	Store_id varchar(255) not null check (Store_id <> ''),
    Phone numeric(10,0),
    primary key (Store_id, Phone),
    foreign key (Store_id) references Store on delete cascade
);   

CREATE TABLE Transaction (
	Customer_card_number int,
    DateTime timestamp,
    Total_amount real,
    Payment_method varchar(10), check (Payment_method in 
		('Cash', 'Card')),
    primary key (Customer_card_number, DateTime),
    foreign key (Customer_card_number) references Customer on delete cascade
); 

CREATE TABLE Contains (
	Customer_card_number int, 
    DateTime timestamp,
    Product_barcode varchar(13),
    Pieces int,
    primary key (Customer_card_number, DateTime, Product_barcode),
    foreign key (Customer_card_number, DateTime) references Transaction on delete cascade,
    foreign key (Product_barcode) references Product on delete cascade
);

CREATE TABLE Provides (
	Category_id int, 
    Store_id varchar(255),
    primary key (Category_id, Store_id),
    foreign key (Category_id) references Category,
    foreign key (Store_id) references Store
);

CREATE TABLE Offers (
	Store_id varchar(255),
	Product_barcode varchar(13),
    Alley_number int,
    Shelf_number int,
    primary key (Product_barcode, Store_id),
    foreign key (Product_barcode) references Product,
    foreign key (Store_id) references Store
);

CREATE TABLE Older_prices (
	Product_barcode varchar(13),
    Start_date date,
    Price real,
    End_date date,
    primary key (Product_barcode, Start_date),
    foreign key (Product_barcode) references Product,
    constraint check_date check (Start_date < End_date) 
);
