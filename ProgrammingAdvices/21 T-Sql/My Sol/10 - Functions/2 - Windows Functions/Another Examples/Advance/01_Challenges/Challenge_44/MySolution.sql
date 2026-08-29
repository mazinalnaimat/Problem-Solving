USE RetailOperations3NFDB;
GO

/*
Challenge 44: Customer Cohort Retention Matrix
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


/*



*/



;with CustomerFirstOrder AS
(
    select
          SO.CustomerID,
          MIN(DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1)) AS CohortMonth
    from SalesOrders AS SO
    where SO.OrderStatusID <> 6
    group by SO.CustomerID
),
CustomerActiveMonths AS
(
    select DISTINCT
          SO.CustomerID,
          DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1) AS ActiveMonth
    from SalesOrders AS SO
    where SO.OrderStatusID <> 6
),
CohortActivity AS
(
    select
          CFO.CohortMonth,
          DATEDIFF(MONTH, CFO.CohortMonth, CAM.ActiveMonth) AS MonthNumber,
          COUNT(*) AS ActiveCustomers
    from CustomerFirstOrder CFO
    join CustomerActiveMonths AS CAM
        on CAM.CustomerID = CFO.CustomerID
    group by CFO.CohortMonth,
             DATEDIFF(MONTH, CFO.CohortMonth, CAM.ActiveMonth)
),
WithCohortSize AS
(
    select
          CA.*,
          MAX
          (
              CASE 
                  WHEN CA.MonthNumber = 0
                      THEN CA.ActiveCustomers 
              END
          ) 
          OVER
          (
              partition by CA.CohortMonth
          ) AS CohortSize
    from CohortActivity AS CA
)
select
      CohortMonth,
      MonthNumber,
      ActiveCustomers,
      CohortSize,
      CAST(ActiveCustomers * 100.0 / NULLIF(CohortSize,0) AS decimal(7,2))
          AS RetentionPercent
from WithCohortSize
order by CohortMonth, MonthNumber;

