# STUDENT NAME: Dawan Savage Bell
# STUDENT ID: w0465319
# COURSE: DATABASE 1007
# DBAS ASSIGNMENT1- DDL
# SCRIPT NAME: DDL_CreateProductsDB
# DESCRIPTION: a SQL script to create a small database for a mock clothing store needing to store product related-data.

CREATE DATABASE A1_Products_DDL;

USE A1_Products_DDL;

                                                          # PART ONE (COMPLETE)
                                                        # CREATING BASIC TABLES

CREATE OR REPLACE TABLE Product
(
    ProductID int AUTO_INCREMENT PRIMARY KEY,
    ProductCode char(8) NOT NULL,
    ProductName varchar(50) NOT NULL,
    Description varchar(100),
    RetailPrice double NOT NULL, # using double in place of currency
    SalePrice double, # using double in place of currency
    ProductRating int NOT NULL,
    NumberInStock int NOT NULL,
    IsActive bit NOT NULL,
    IsDiscontinued bit NOT NULL,
    SupplierID int
);

CREATE OR REPLACE TABLE Supplier
(
    SupplierID int AUTO_INCREMENT PRIMARY KEY,
    SupplierName varchar(100) NOT NULL,
    Address varchar(255) NOT NULL,
    ContactFirstName varchar(100),
    ContactLastName varchar(100),
    ContactPhone varchar(20),
    ContactEmail varchar(50),
    IsActive bit NOT NULL
);

CREATE OR REPLACE TABLE ClothingCategory
(
    CategoryID int AUTO_INCREMENT PRIMARY KEY,
    CategoryName varchar(50) NOT NULL,
    IsActive bit NOT NULL
);

CREATE OR REPLACE TABLE ClothingSize
(
    SizeID int AUTO_INCREMENT PRIMARY KEY,
    SizeName varchar(50) NOT NULL,
    SizeAbbreviation varchar(3) NOT NULL,
    IsActive bit NOT NULL
);

CREATE OR REPLACE TABLE Colour
(
    ColourID int AUTO_INCREMENT PRIMARY KEY,
    ColourName varchar(50) NOT NULL,
    ColourCode char(3) NOT NULL,
    IsActive bit NOT NULL
);
                                                             # PART TWO (COMPLETE)
                                                         # ALTERING FOR PRODUCT TABLE

ALTER TABLE Product MODIFY COLUMN ProductCode char(8) NOT NULL UNIQUE ; # Altering Product Table so that column ProductCode will be unique

ALTER TABLE Product MODIFY COLUMN RetailPrice double NOT NULL CHECK ( RetailPrice > 0 ); # ALTERING SO VALUE IS GREATER THAN 0
ALTER TABLE Product MODIFY COLUMN SalePrice double CHECK ( SalePrice > 0 ); # ALTERING SO VALUE IS GREATER THAN 0
ALTER TABLE Product MODIFY COLUMN ProductRating int NOT NULL CHECK ( ProductRating IN ('1','2','3','4','5')); # ALTERING SO RATING VALUE IS BETWEEN 1-5
ALTER TABLE Product MODIFY COLUMN NumberInStock int NOT NULL DEFAULT '0'; # ALTERING SO DEFAULT(INITIAL) VALUE IS SET TO 0
ALTER TABLE Product MODIFY COLUMN IsActive bit NOT NULL DEFAULT TRUE; # ALTERING SO DEFAULT IS SET TO ACTIVE
ALTER TABLE Product MODIFY IsDiscontinued bit NOT NULL DEFAULT FALSE; # ALTERING SO DEFAULT IS SET TO DISCONTINUED



                                                    # ALTERING FOR Supplier TABLE
ALTER TABLE Supplier MODIFY IsActive bit NOT NULL DEFAULT TRUE; # ALTERING SO ACTIVE IS AUTOMATICALLY SET


                                                    # ALTERING FOR ClothingCategory TABLE
ALTER TABLE ClothingCategory MODIFY IsActive bit NOT NULL DEFAULT TRUE; # ALTERING SO DEFAULT IS SET TO ACTIVE


                                                    # ALTERING FOR ClothingSize TABLE
ALTER TABLE ClothingSize MODIFY SizeAbbreviation varchar(3) NOT NULL CHECK ( SizeAbbreviation IN ('XS' , 'S' , 'M' , 'L' , 'XL' , 'XXL')); # Alter so values can only be XS, S, M, L, XL, XXL
ALTER TABLE ClothingSize MODIFY IsActive bit NOT NULL DEFAULT TRUE;  # ALTERING SO DEFAULT IS SET TO ACTIVE



                                                    # ALTERING FOR Colour TABLE
ALTER TABLE Colour MODIFY ColourCode CHAR(3) NOT NULL UNIQUE; # ALTERING SO VALUE IS UNIQUE
ALTER TABLE Colour MODIFY IsActive bit NOT NULL DEFAULT TRUE; # ALTERING SO DEFAULT IS SET TO ACTIVE



                                                        # PART THREE (COMPLETE)
                                              # ADDING FOREIGN KEYS AND JUNCTION TABLES

            # CREATING JUNCTION TABLE BETWEEN Product AND ClothingCategory TABLE

CREATE TABLE ProductCategory
(
    ProductID int NOT NULL REFERENCES Product (ProductID), # SETTING ProductID AS FOREIGN KEY
    CategoryID int NOT NULL REFERENCES ClothingCategory(CategoryID) # SETTING CategoryID AS FOREIGN KEY
);

                                    # ALTERING ProductCategory TABLE

ALTER TABLE ProductCategory ADD CONSTRAINT PRIMARY KEY (ProductID, CategoryID); # SETTING ProductID and CategoryID as compound pk




                # CREATING JUNCTION TABLE BETWEEN Product AND ClothingSize TABLE

CREATE TABLE ProductSize
(
    ProductID int NOT NULL REFERENCES Product (ProductID), # SETTING ProductID AS FOREIGN KEY
    SizeID int NOT NULL REFERENCES ClothingSize(SizeID) # SETTING SizeID AS FOREIGN KEY
);
                                # ALTERING ProductSize TABLE

ALTER TABLE ProductSize ADD CONSTRAINT PRIMARY KEY (ProductID, SizeID); # SETTING ProductID and SizeID as compound pk




                # CREATING JUNCTION TABLE BETWEEN Product AND Colour TABLE

CREATE TABLE ProductColour
(
    ProductID int NOT NULL, # DECLARING ProductID IN TABLE
    ColourID int NOT NULL # DECLARING ColourID IN TABLE
);
                                                # ALTERING ProductColour TABLE

ALTER TABLE ProductColour ADD CONSTRAINT FOREIGN KEY (ProductID) REFERENCES Product(ProductID); # SETTING ProductID AS FOREIGN KEY
ALTER TABLE ProductColour ADD CONSTRAINT FOREIGN KEY (ColourID) REFERENCES Colour(ColourID); # SETTING ColourID AS FOREIGN KEY
ALTER TABLE ProductColour ADD CONSTRAINT PRIMARY KEY (ProductID, ColourID); # SETTING ProductID and ColourID as compound pk




                                                # ALTERING Product TABLE

ALTER TABLE Product ADD CONSTRAINT FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID); # SETTING SupplierID AS FK IN PRODUCT TABLE FROM SUPPLIER TABLE