/*
Challenge 10: Apply temporary data changes and calculate cumulative daily totals
Level: Advanced+
*/

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

