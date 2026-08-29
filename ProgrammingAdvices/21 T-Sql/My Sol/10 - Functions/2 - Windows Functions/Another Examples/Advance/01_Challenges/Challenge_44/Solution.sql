USE RetailOperations3NFDB;
GO

;WITH CustomerFirstOrder AS
(
    SELECT
        o.CustomerID,
        MIN(DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)) AS CohortMonth
    FROM dbo.SalesOrders o
    WHERE o.OrderStatusID <> 6
    GROUP BY o.CustomerID
),
CustomerActiveMonths AS
(
    SELECT DISTINCT
        o.CustomerID,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS ActiveMonth
    FROM dbo.SalesOrders o
    WHERE o.OrderStatusID <> 6
),
CohortActivity AS
(
    SELECT
        cfo.CohortMonth,
        DATEDIFF(MONTH, cfo.CohortMonth, cam.ActiveMonth) AS MonthNumber,
        COUNT(*) AS ActiveCustomers
    FROM CustomerFirstOrder cfo
    JOIN CustomerActiveMonths cam ON cam.CustomerID = cfo.CustomerID
    GROUP BY cfo.CohortMonth,
             DATEDIFF(MONTH, cfo.CohortMonth, cam.ActiveMonth)
),
WithCohortSize AS
(
    SELECT
        ca.*,
        MAX(CASE WHEN ca.MonthNumber = 0 THEN ca.ActiveCustomers END) OVER
        (
            PARTITION BY ca.CohortMonth
        ) AS CohortSize
    FROM CohortActivity ca
)
SELECT
    CohortMonth,
    MonthNumber,
    ActiveCustomers,
    CohortSize,
    CAST(ActiveCustomers * 100.0 / NULLIF(CohortSize,0) AS decimal(7,2))
        AS RetentionPercent
FROM WithCohortSize
ORDER BY CohortMonth, MonthNumber;
