USE WindowFunctionsTrainingDB;
GO

WITH PaidCustomers AS
(
    SELECT DISTINCT PlanName, CustomerName
    FROM dbo.SubscriptionPayments
    WHERE PaymentStatus = 'Paid'
)
SELECT
    PlanName,
    STRING_AGG(CONVERT(nvarchar(max), CustomerName), ', ')
        WITHIN GROUP (ORDER BY CustomerName) AS PaidCustomers
FROM PaidCustomers
GROUP BY PlanName
ORDER BY PlanName;
