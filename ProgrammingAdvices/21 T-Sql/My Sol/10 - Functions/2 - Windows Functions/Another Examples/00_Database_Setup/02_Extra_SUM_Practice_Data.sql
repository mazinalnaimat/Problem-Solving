/*
Extra data for the SUM and window-function challenges.

Run after:
    01_AllInOne_Create_Database.sql

This script recreates dbo.StoreTransactions so it is safe to run repeatedly.
*/

USE WindowFunctionsTrainingDB;
GO

IF OBJECT_ID('dbo.StoreTransactions', 'U') IS NOT NULL
    DROP TABLE dbo.StoreTransactions;
GO

CREATE TABLE dbo.StoreTransactions
(
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    ReferenceCode VARCHAR(30) NOT NULL UNIQUE,
    Branch NVARCHAR(30) NOT NULL,
    Cashier NVARCHAR(60) NOT NULL,
    TransactionDate DATE NOT NULL,
    ProductCategory NVARCHAR(40) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO dbo.StoreTransactions
    (ReferenceCode, Branch, Cashier, TransactionDate, ProductCategory, Amount)
VALUES
('N-A-001', 'North', 'Aisha', '2025-01-01', 'Tables',      300.00),
('N-A-002', 'North', 'Aisha', '2025-01-01', 'Chairs',      150.00),
('N-B-001', 'North', 'Bilal', '2025-01-02', 'Accessories',  80.00),
('N-A-003', 'North', 'Aisha', '2025-01-02', 'Tables',      500.00),
('N-B-002', 'North', 'Bilal', '2025-01-03', 'Chairs',      220.00),
('N-A-004', 'North', 'Aisha', '2025-01-04', 'Accessories',  90.00),
('N-B-003', 'North', 'Bilal', '2025-01-04', 'Tables',      450.00),
('N-A-005', 'North', 'Aisha', '2025-01-05', 'Chairs',      210.00),

('S-C-001', 'South', 'Carol', '2025-01-01', 'Tables',      400.00),
('S-D-001', 'South', 'Dana',  '2025-01-01', 'Accessories', 120.00),
('S-C-002', 'South', 'Carol', '2025-01-02', 'Chairs',      180.00),
('S-D-002', 'South', 'Dana',  '2025-01-02', 'Tables',      650.00),
('S-C-003', 'South', 'Carol', '2025-01-03', 'Accessories',  70.00),
('S-D-003', 'South', 'Dana',  '2025-01-03', 'Chairs',      240.00),
('S-C-004', 'South', 'Carol', '2025-01-04', 'Tables',      520.00),
('S-D-004', 'South', 'Dana',  '2025-01-05', 'Accessories', 110.00),

('E-E-001', 'East',  'Eman',  '2025-01-01', 'Tables',      280.00),
('E-F-001', 'East',  'Fadi',  '2025-01-02', 'Chairs',      160.00),
('E-E-002', 'East',  'Eman',  '2025-01-02', 'Tables',      340.00),
('E-F-002', 'East',  'Fadi',  '2025-01-03', 'Accessories',  95.00),
('E-E-003', 'East',  'Eman',  '2025-01-03', 'Chairs',      205.00),
('E-F-003', 'East',  'Fadi',  '2025-01-04', 'Tables',      480.00),
('E-E-004', 'East',  'Eman',  '2025-01-05', 'Accessories', 105.00),
('E-F-004', 'East',  'Fadi',  '2025-01-05', 'Chairs',      190.00);
GO

CREATE INDEX IX_StoreTransactions_Branch_Date
    ON dbo.StoreTransactions(Branch, TransactionDate, TransactionID);

CREATE INDEX IX_StoreTransactions_Branch_Cashier_Date
    ON dbo.StoreTransactions(Branch, Cashier, TransactionDate, TransactionID);
GO

SELECT 'Extra SUM practice data created successfully.' AS Message;
