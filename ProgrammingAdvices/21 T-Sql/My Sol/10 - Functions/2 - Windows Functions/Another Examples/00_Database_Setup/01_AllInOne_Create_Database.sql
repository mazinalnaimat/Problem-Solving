/*
SQL Server Window Functions Training Database
Run this file in SQL Server Management Studio or Azure Data Studio.
It creates a small training database with enough data for all examples and challenges.
*/

IF DB_ID('WindowFunctionsTrainingDB') IS NOT NULL
BEGIN
    ALTER DATABASE WindowFunctionsTrainingDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE WindowFunctionsTrainingDB;
END;
GO

CREATE DATABASE WindowFunctionsTrainingDB;
GO

USE WindowFunctionsTrainingDB;
GO

CREATE TABLE dbo.Departments
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL
);

CREATE TABLE dbo.Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(80) NOT NULL,
    DepartmentID INT NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    PerformanceScore INT NOT NULL,
    CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID)
        REFERENCES dbo.Departments(DepartmentID)
);

CREATE TABLE dbo.SalesOrders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(80) NOT NULL,
    SalesPersonID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Region NVARCHAR(30) NOT NULL,
    ProductCategory NVARCHAR(40) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_SalesOrders_Employees FOREIGN KEY (SalesPersonID)
        REFERENCES dbo.Employees(EmployeeID)
);

CREATE TABLE dbo.StudentScores
(
    ScoreID INT IDENTITY(1,1) PRIMARY KEY,
    StudentName NVARCHAR(80) NOT NULL,
    ClassName NVARCHAR(40) NOT NULL,
    ExamDate DATE NOT NULL,
    Score INT NOT NULL
);

CREATE TABLE dbo.StockPrices
(
    PriceID INT IDENTITY(1,1) PRIMARY KEY,
    Symbol NVARCHAR(10) NOT NULL,
    PriceDate DATE NOT NULL,
    ClosePrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE dbo.Tasks
(
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName NVARCHAR(60) NOT NULL,
    TaskTitle NVARCHAR(100) NOT NULL,
    AssignedToEmployeeID INT NOT NULL,
    CreatedDate DATE NOT NULL,
    CompletedDate DATE NULL,
    EstimatedHours DECIMAL(6,2) NOT NULL,
    CONSTRAINT FK_Tasks_Employees FOREIGN KEY (AssignedToEmployeeID)
        REFERENCES dbo.Employees(EmployeeID)
);
GO

INSERT INTO dbo.Departments(DepartmentName)
VALUES ('IT'), ('Sales'), ('Finance'), ('HR');

INSERT INTO dbo.Employees(FullName, DepartmentID, HireDate, Salary, PerformanceScore)
VALUES
('Ali Nasser', 1, '2020-01-10', 900.00, 88),
('Sara Haddad', 1, '2021-03-15', 1200.00, 95),
('Omar Saleh', 1, '2022-07-20', 1200.00, 91),
('Lina Faris', 1, '2023-11-01', 750.00, 82),
('Mazen Omar', 2, '2019-02-12', 1000.00, 89),
('Huda Sami', 2, '2020-06-01', 1100.00, 94),
('Tariq Khaled', 2, '2021-09-10', 800.00, 80),
('Nour Jamal', 2, '2024-01-05', 800.00, 84),
('Rami Yasin', 3, '2018-04-18', 1500.00, 92),
('Mona Saad', 3, '2019-08-27', 1300.00, 86),
('Kareem Zaid', 3, '2022-02-14', 950.00, 78),
('Dina Adel', 3, '2024-05-20', 950.00, 83),
('Yara Ahmad', 4, '2020-10-05', 850.00, 87),
('Fadi Noor', 4, '2021-12-11', 850.00, 81),
('Mariam Bilal', 4, '2023-03-30', 700.00, 79),
('Zaid Ibrahim', 4, '2024-08-18', 700.00, 76);

INSERT INTO dbo.SalesOrders(CustomerName, SalesPersonID, OrderDate, Region, ProductCategory, Amount)
VALUES
('Alpha Market', 5, '2025-01-03', 'North', 'Tables', 1200.00),
('Beta Store', 6, '2025-01-04', 'North', 'Chairs', 650.00),
('City Club', 5, '2025-01-10', 'South', 'Tables', 1800.00),
('Delta Cafe', 7, '2025-01-11', 'East', 'Accessories', 300.00),
('Alpha Market', 6, '2025-01-15', 'North', 'Tables', 1400.00),
('Beta Store', 8, '2025-01-17', 'West', 'Chairs', 900.00),
('City Club', 5, '2025-01-19', 'South', 'Accessories', 450.00),
('Delta Cafe', 6, '2025-01-21', 'East', 'Tables', 2100.00),
('Echo Gym', 7, '2025-01-25', 'West', 'Tables', 1600.00),
('Future Hall', 8, '2025-01-29', 'North', 'Chairs', 700.00),
('Alpha Market', 5, '2025-02-02', 'North', 'Accessories', 500.00),
('Beta Store', 6, '2025-02-04', 'North', 'Tables', 1900.00),
('City Club', 7, '2025-02-07', 'South', 'Chairs', 850.00),
('Delta Cafe', 8, '2025-02-12', 'East', 'Accessories', 350.00),
('Echo Gym', 5, '2025-02-15', 'West', 'Tables', 2200.00),
('Future Hall', 6, '2025-02-17', 'North', 'Accessories', 550.00),
('Alpha Market', 7, '2025-02-21', 'North', 'Chairs', 750.00),
('Beta Store', 8, '2025-02-24', 'West', 'Tables', 1750.00),
('City Club', 5, '2025-03-01', 'South', 'Tables', 2400.00),
('Delta Cafe', 6, '2025-03-05', 'East', 'Chairs', 950.00);

INSERT INTO dbo.StudentScores(StudentName, ClassName, ExamDate, Score)
VALUES
('Adam', 'SQL Basics', '2025-01-05', 91),
('Basma', 'SQL Basics', '2025-01-05', 91),
('Celine', 'SQL Basics', '2025-01-05', 84),
('Dany', 'SQL Basics', '2025-01-05', 77),
('Eman', 'SQL Basics', '2025-01-05', 77),
('Farah', 'SQL Basics', '2025-01-05', 65),
('Ghaith', 'C# Basics', '2025-01-07', 93),
('Hala', 'C# Basics', '2025-01-07', 88),
('Ibrahim', 'C# Basics', '2025-01-07', 88),
('Jana', 'C# Basics', '2025-01-07', 80),
('Khaled', 'C# Basics', '2025-01-07', 72),
('Lamar', 'C# Basics', '2025-01-07', 72),
('Mira', 'Database Design', '2025-01-09', 96),
('Nader', 'Database Design', '2025-01-09', 89),
('Ola', 'Database Design', '2025-01-09', 85),
('Peter', 'Database Design', '2025-01-09', 85),
('Qamar', 'Database Design', '2025-01-09', 74),
('Ruba', 'Database Design', '2025-01-09', 68);

INSERT INTO dbo.StockPrices(Symbol, PriceDate, ClosePrice)
VALUES
('AAA', '2025-01-01', 10.00), ('AAA', '2025-01-02', 10.50), ('AAA', '2025-01-03', 10.20),
('AAA', '2025-01-04', 11.00), ('AAA', '2025-01-05', 10.80), ('AAA', '2025-01-06', 11.40),
('BBB', '2025-01-01', 20.00), ('BBB', '2025-01-02', 19.50), ('BBB', '2025-01-03', 19.80),
('BBB', '2025-01-04', 21.00), ('BBB', '2025-01-05', 21.50), ('BBB', '2025-01-06', 21.20);

INSERT INTO dbo.Tasks(ProjectName, TaskTitle, AssignedToEmployeeID, CreatedDate, CompletedDate, EstimatedHours)
VALUES
('Billing System', 'Create login screen', 1, '2025-01-01', '2025-01-03', 6.0),
('Billing System', 'Create customers table', 2, '2025-01-02', '2025-01-06', 8.0),
('Billing System', 'Implement invoice report', 3, '2025-01-04', NULL, 12.0),
('Billing System', 'Test invoice report', 1, '2025-01-07', NULL, 5.0),
('Inventory App', 'Create product screen', 4, '2025-01-02', '2025-01-04', 7.0),
('Inventory App', 'Build stock movement query', 2, '2025-01-05', '2025-01-09', 9.0),
('Inventory App', 'Create dashboard', 3, '2025-01-10', NULL, 10.0),
('HR Portal', 'Create employee profile', 13, '2025-01-03', '2025-01-07', 8.0),
('HR Portal', 'Add leave request form', 14, '2025-01-08', NULL, 6.5),
('HR Portal', 'Add approval workflow', 15, '2025-01-09', NULL, 11.0);
GO

CREATE INDEX IX_Employees_Department_Salary ON dbo.Employees(DepartmentID, Salary DESC);
CREATE INDEX IX_SalesOrders_SalesPerson_Date ON dbo.SalesOrders(SalesPersonID, OrderDate);
CREATE INDEX IX_SalesOrders_Region_Date ON dbo.SalesOrders(Region, OrderDate);
CREATE INDEX IX_StudentScores_Class_Score ON dbo.StudentScores(ClassName, Score DESC);
CREATE INDEX IX_StockPrices_Symbol_Date ON dbo.StockPrices(Symbol, PriceDate);
GO

SELECT 'WindowFunctionsTrainingDB created successfully.' AS Message;
