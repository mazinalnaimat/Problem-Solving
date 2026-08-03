/*
Challenge 09: Current transaction plus the next two branch transactions
Level: Advanced
*/

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

