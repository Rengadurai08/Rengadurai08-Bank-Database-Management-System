-- Create database and use it
CREATE DATABASE Bank_DB_02;
USE Bank_DB_02;

-- Create tables
CREATE TABLE CUSTOMER_INFORMATION (
  Customer_ID int PRIMARY KEY,
  First_Name varchar(40),
  Last_Name varchar(50),
  Date_Of_Birth date,
  Gender varchar(10),
  Address varchar(60),
  City varchar(20),
  State varchar(70),
  Postal_code varchar(10),
  Country varchar(80),
  Phone_Number int,
  Email varchar(90),
  Date_Joined date
);

CREATE TABLE Account_details (
  Account_ID int PRIMARY KEY,
  Customer_ID int,
  Account_Type varchar(45),
  IFSC_code varchar(15),
  Account_balance decimal(15,2),
  Date_Opened date,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER_INFORMATION(Customer_ID)
);

CREATE TABLE Transactions (
  Transaction_ID int PRIMARY KEY,
  Account_ID int,
  Type varchar(40),
  Amount decimal(15,2),
  Description varchar(300),
  Transaction_Date date,
  FOREIGN KEY (Account_ID) REFERENCES Account_details(Account_ID)
);

CREATE TABLE Bank_info (
  IFSC_code varchar(55) PRIMARY KEY,
  Bank_name varchar(44),
  Branch_name varchar(77)
);

-- Insert values into tables
INSERT INTO Bank_info(IFSC_code, Bank_name, Branch_name) VALUES
('HDFC0000012', 'HDFC', 'Mumbai'),
('SBIN0000874', 'SBI', 'Chennai'),
('ICIC0000104', 'ICIC', 'Bangalore'),
('UTIB0001235', 'AXIS', 'Delhi'),
('PUNB0123456', 'PUNJAB', 'Kolkata');

INSERT INTO CUSTOMER_INFORMATION (Customer_ID, First_Name, Last_Name, Date_Of_Birth, Gender, Address, City, State, Postal_code, Country, Phone_Number, Email, Date_Joined)
VALUES
(1, 'Roronoa', 'Zoro', '1990-11-11', 'Male', '123 Shimotsuki Village', 'East Blue', 'JAPAN', '123-4567', 'JAPAN', 1234567890, 'onigiri.zoro@gmail.com', '2023-01-15'),
(2, 'Cat Burglar', 'Nami', '1985-08-20', 'Female', '456 Cocoyasi Village', 'East Blue', 'Texas', '900-7801', 'USA', 1325478691, 'nami.thunderbolt@gmail.com', '2022-03-10'),
(3, 'Vinsmoke', 'Sanji', '1982-11-10', 'Male', '789 North Blue', 'Chicago', 'Texas', '608-5001', 'USA', 1432697857, 'BoeufBurst.sanji@gmail.com', '2024-05-20'),
(4, 'Helmsman', 'Jinbe', '1995-04-25', 'Male', '321 Totto land', 'Houston', 'California', '770-5401', 'USA', 1879456321, 'jenbeBuraikan@gmail.com', '2023-08-12'),
(5, 'Nico', 'Robin', '1988-09-30', 'Female', '567 Ohara', 'San Francisco', 'California', '941-1201', 'USA', 1369258147, 'DemonioFleur@gmail.com', '2022-11-05');

INSERT INTO Account_details (Account_ID, Customer_ID, Account_Type, IFSC_code, Account_balance, Date_Opened)
VALUES
(1, 1, 'Savings', 'HDFC0000012', 15000.00, '2023-02-01'),
(2, 2, 'Checking', 'SBIN0000874', 22000.00, '2022-04-15'),
(3, 3, 'Savings', 'ICIC0000104', 18000.00, '2024-06-01'),
(4, 4, 'Checking', 'UTIB0001235', 30000.00, '2023-09-15'),
(5, 5, 'Checking', 'PUNB0123456', 14000.00, '2022-06-10');

SELECT * FROM Bank_info;
SELECT * FROM CUSTOMER_INFORMATION;
SELECT * FROM Account_details;

--- Sample Queries and Outputs for Bank Database Management ---

### Customers from a specific city ###

SELECT * FROM CUSTOMER_INFORMATION WHERE City = 'East Blue';

### Accounts with a balance greater than a certain amount ###

SELECT * FROM Account_details WHERE Account_balance > 15000;

### Total number of customers from each state ###

SELECT State, COUNT(*) AS Number_of_Customers
FROM CUSTOMER_INFORMATION
GROUP BY State;
