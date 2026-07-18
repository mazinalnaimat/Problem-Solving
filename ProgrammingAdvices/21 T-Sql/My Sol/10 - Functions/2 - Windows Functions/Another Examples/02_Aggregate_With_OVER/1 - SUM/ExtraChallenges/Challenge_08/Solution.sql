/*
Challenge 08: Moving total of the latest three cashier transactions
Level: Advanced
*/

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

