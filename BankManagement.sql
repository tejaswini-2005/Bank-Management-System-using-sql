CREATE DATABASE BankManagementSystem;

USE BankManagementSystem;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountNumber VARCHAR(20),
    AccountType VARCHAR(20),
    Balance DECIMAL(10, 2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

delete from Accounts;
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    TransactionType VARCHAR(20),
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(50),
    BranchAddress VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(50),
    Position VARCHAR(50),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

INSERT INTO Customers 
(FirstName, LastName, Address, PhoneNumber) VALUES
('John', 'Doe', '123 Main St', '123-456-7890'),
('Jane', 'Smith', '456 Elm St', '234-567-8901'),
('Alice', 'Johnson', '789 Pine St', '345-678-9012'),
('Bob', 'Brown', '321 Oak St', '456-789-0123'),
('Emily', 'Davis', '654 Maple St', '567-890-1234'),
('Michael', 'Wilson', '987 Cedar St', '678-901-2345'),
('Sarah', 'Taylor', '135 Birch St', '789-012-3456');

INSERT INTO Accounts 
(AccountNumber, AccountType, Balance, CustomerID) VALUES
('ACC12345', 'Savings', 1500.00, 1),
('ACC23456', 'Checking', 3200.00, 2),
('ACC34567', 'Savings', 500.00, 3),
('ACC45678', 'Checking', 2500.00, 4),
('ACC56789', 'Savings', 750.00, 5),
('ACC67890', 'Checking', 1100.00, 6),
('ACC78901', 'Savings', 200.00, 7);

INSERT INTO Transactions 
(AccountID, TransactionType, TransactionDate, Amount) VALUES
(1, 'Deposit', '2024-01-10', 1000.00),
(2, 'Withdrawal', '2024-02-15', 500.00),
(3, 'Deposit', '2024-03-20', 300.00),
(4, 'Deposit', '2024-04-05', 1000.00),
(5, 'Withdrawal', '2024-05-25', 200.00),
(6, 'Deposit', '2024-06-30', 500.00),
(7, 'Deposit', '2024-07-10', 100.00);

INSERT INTO Branches (BranchName, BranchAddress) VALUES
('Downtown', '12 Main St'),
('Uptown', '34 Elm St'),
('Suburban', '56 Pine St'),
('Rural', '78 Oak St'),
('City Center', '90 Maple St');

INSERT INTO Employees 
(EmployeeName, Position, BranchID) VALUES
('Mark Miller', 'Manager', 1),
('Samantha Green', 'Clerk', 2),
('David White', 'Cashier', 3),
('Lisa Black', 'Clerk', 4),
('James Gray', 'Manager', 5),
('Laura Blue', 'Cashier', 1),
('Richard Red', 'Teller', 2);

SELECT * FROM Customers WHERE LastName = 'Smith';

SELECT * FROM Accounts WHERE Balance > 1000;

SELECT * FROM Transactions WHERE TransactionType = 'Deposit';

SELECT * FROM Employees
WHERE BranchID = 
(SELECT BranchID FROM Branches WHERE BranchName = 'Downtown');

SELECT SUM(Balance) AS TotalBalance FROM Accounts;

SELECT AVG(Amount) AS AvgTransactionAmount FROM Transactions;

SELECT BranchID, COUNT(EmployeeID) AS NumEmployees 
FROM Employees GROUP BY BranchID;

SELECT DISTINCT AccountType FROM Accounts;

SELECT * FROM Customers ORDER BY LastName;

SELECT * FROM Transactions ORDER BY Amount DESC;

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Accounts.AccountNumber, Accounts.Balance
FROM Customers
LEFT JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

SELECT Accounts.AccountID, Accounts.AccountNumber, Accounts.Balance, Customers.FirstName, Customers.LastName
FROM Accounts
RIGHT JOIN Customers ON Customers.CustomerID = Accounts.CustomerID;

drop database bankmanagementsystem;
