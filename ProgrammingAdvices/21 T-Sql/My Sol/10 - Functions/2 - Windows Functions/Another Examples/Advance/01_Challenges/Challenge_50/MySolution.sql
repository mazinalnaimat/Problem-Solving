USE RetailOperations3NFDB;
GO

/*
Challenge 50: Long Customer Inactivity Gaps
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/




;WITH SequencedOrders AS
(
    select
          SO.OrderID,
          SO.OrderNumber,
          SO.CustomerID,
          SO.OrderDate,
          LAG(SO.OrderDate) 
          OVER
          (
              partition by SO.CustomerID
              order by SO.OrderDate, SO.OrderID
          ) AS PreviousOrderDate
    from SalesOrders AS SO
    where SO.OrderStatusID <> 6
)
select
      Cu.CustomerNumber,
      SqOr.OrderNumber,
      SqOr.OrderDate,
      SqOr.PreviousOrderDate,
      DATEDIFF(DAY, SqOr.PreviousOrderDate, SqOr.OrderDate) AS GapDays
from SequencedOrders AS SqOr
join Customers AS Cu 
    on Cu.CustomerID = SqOr.CustomerID
where DATEDIFF(DAY, SqOr.PreviousOrderDate, SqOr.OrderDate) > 45
order by GapDays DESC, Cu.CustomerNumber, SqOr.OrderDate;









