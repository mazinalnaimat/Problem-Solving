/*
Run the setup scripts first.

This file contains all 10 reference solutions.
Each solution is also available in its own challenge folder.
*/

USE WindowFunctionsTrainingDB;
GO


-- ============================================================
-- Challenge 01: Total salary of all employees
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    SUM(Salary) AS TotalSalary
FROM dbo.Employees;


-- ============================================================
-- Challenge 02: Total sales for every region
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    Region,
    SUM(Amount) AS RegionTotal
FROM dbo.SalesOrders
GROUP BY Region
ORDER BY Region;


-- ============================================================
-- Challenge 03: Show every order with the grand total
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    OrderID,
    OrderDate,
    CustomerName,
    Amount,
    SUM(Amount) OVER () AS GrandTotal
FROM dbo.SalesOrders
ORDER BY OrderDate, OrderID;


-- ============================================================
-- Challenge 04: Department salary total beside each employee
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    e.EmployeeID,
    e.FullName,
    d.DepartmentName,
    e.Salary,
    SUM(e.Salary) OVER
    (
        PARTITION BY e.DepartmentID
    ) AS DepartmentSalaryTotal
FROM dbo.Employees AS e
INNER JOIN dbo.Departments AS d
    ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.EmployeeID;


-- ============================================================
-- Challenge 05: Total by region and product category
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    OrderID,
    Region,
    ProductCategory,
    OrderDate,
    Amount,
    SUM(Amount) OVER
    (
        PARTITION BY Region, ProductCategory
    ) AS RegionCategoryTotal
FROM dbo.SalesOrders
ORDER BY Region, ProductCategory, OrderDate, OrderID;


-- ============================================================
-- Challenge 06: Running total of all sales
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    OrderID,
    OrderDate,
    CustomerName,
    Amount,
    SUM(Amount) OVER
    (
        ORDER BY OrderDate, OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM dbo.SalesOrders
ORDER BY OrderDate, OrderID;


-- ============================================================
-- Challenge 07: Running sales total for each salesperson
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    so.SalesPersonID,
    e.FullName,
    so.OrderID,
    so.OrderDate,
    so.Amount,
    SUM(so.Amount) OVER
    (
        PARTITION BY so.SalesPersonID
        ORDER BY so.OrderDate, so.OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS SalesPersonRunningTotal
FROM dbo.SalesOrders AS so
INNER JOIN dbo.Employees AS e
    ON e.EmployeeID = so.SalesPersonID
ORDER BY so.SalesPersonID, so.OrderDate, so.OrderID;


-- ============================================================
-- Challenge 08: Moving total of the latest three cashier transactions
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    TransactionID,
    Branch,
    Cashier,
    TransactionDate,
    Amount,
    SUM(Amount) OVER
    (
        PARTITION BY Branch, Cashier
        ORDER BY TransactionDate, TransactionID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS LastThreeTransactionsTotal
FROM dbo.StoreTransactions
ORDER BY Branch, Cashier, TransactionDate, TransactionID;


-- ============================================================
-- Challenge 09: Current transaction plus the next two branch transactions
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

SELECT
    TransactionID,
    Branch,
    TransactionDate,
    Cashier,
    Amount,
    SUM(Amount) OVER
    (
        PARTITION BY Branch
        ORDER BY TransactionDate, TransactionID
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS CurrentAndNextTwoTotal
FROM dbo.StoreTransactions
ORDER BY Branch, TransactionDate, TransactionID;


-- ============================================================
-- Challenge 10: Apply temporary data changes and calculate cumulative daily totals
-- ============================================================

USE WindowFunctionsTrainingDB;
GO

BEGIN TRANSACTION;

IF NOT EXISTS
(
    SELECT 1
    FROM dbo.StoreTransactions
    WHERE ReferenceCode = 'PRACTICE-001'
)
BEGIN
    INSERT INTO dbo.StoreTransactions
        (ReferenceCode, Branch, Cashier, TransactionDate, ProductCategory, Amount)
    VALUES
        ('PRACTICE-001', 'North', 'Aisha', '2025-01-06', 'Tables', 900.00);
END;

UPDATE dbo.StoreTransactions
SET Amount = 575.00
WHERE ReferenceCode = 'N-A-003';

;WITH DailyTotals AS
(
    SELECT
        Branch,
        TransactionDate,
        SUM(Amount) AS DailyTotal
    FROM dbo.StoreTransactions
    GROUP BY
        Branch,
        TransactionDate
)
SELECT
    Branch,
    TransactionDate,
    DailyTotal,
    SUM(DailyTotal) OVER
    (
        PARTITION BY Branch
        ORDER BY TransactionDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS BranchRunningTotal,
    SUM(DailyTotal) OVER
    (
        PARTITION BY Branch
    ) AS BranchGrandTotal
FROM DailyTotals
ORDER BY Branch, TransactionDate;

ROLLBACK TRANSACTION;
