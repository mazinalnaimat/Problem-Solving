
/*
USE RetailOperations3NFDB;
GO
*/

/*
Challenge 12: Same-Day Customer Order Sequence
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/
with DailyOrderSequence as
(
    select 
        Cu.CustomerID,
        SO.OrderDate,
        SO.OrderNumber,
        ROW_NUMBER()
        OVER
        (
            partition by SO.customerid, SO.orderdate
            order by SO.orderid
        )AS DailyOrderSequence,
        COUNT(*)
        OVER
        (
            partition by SO.customerid, SO.orderdate
        )AS DailyOrderCount
    from Customers as Cu
    join SalesOrders as SO
        on Cu.CustomerID = SO.CustomerID
)
select 
      Cu.CustomerNumber,
      DOS.OrderDate,
      DOS.OrderNumber,
      DOS.DailyOrderSequence,
      DOS.DailyOrderCount
from DailyOrderSequence AS DOS
join Customers AS Cu
    on DOS.CustomerID = Cu.Customerid
where DOS.DailyOrderCount >=2