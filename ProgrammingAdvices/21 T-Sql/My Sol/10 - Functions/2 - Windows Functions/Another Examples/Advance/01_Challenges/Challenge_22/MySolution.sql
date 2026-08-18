
/*
USE RetailOperations3NFDB;
GO
*/

/*
Challenge 22: Customer Monthly Spend Change
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


/*
select * from Customers;
select * from SalesOrders;
select * from OrderItems;

*/

with OrderTotals as 
(
    select 
          SO.OrderId,
          SO.CustomerId,
          MAKE_DATE(
                        extract (year from SO.OrderDate)::int,
                        extract (month from SO.OrderDate)::int,
                        1                
                    )As MonthStart,
         SUM
            (
                OI.Quantity * OI.UnitPrice * (1 - OI.DiscountPercent / 100.0)
            ) - SO.OrderDiscount AS OrderValue
    from SalesOrders as SO
    join OrderItems as OI
        on SO.OrderId = OI.OrderId
    where SO.OrderStatusID <> 6
    group by SO.OrderID, SO.CustomerID, SO.OrderDate, SO.OrderDiscount
),
MonthOrders as 
(
    select 
          OT.CustomerId,
          OT.MonthStart,
          SUM(OrderValue) AS MonthlySpend
    from OrderTotals AS OT
    group by OT.CustomerId, OT.MonthStart
),
WithPreMonthlySpend AS 
(
    select 
      MO.*,
      cast
      (  
        LAG(MO.MonthlySpend)
        OVER
        (
            partition by MO.CustomerId
            order by MO.MonthStart
        )
        as decimal(10,2)
      )AS PreviousMonthSpend 
    from MonthOrders AS MO

)

select 
      Cu.CustomerNumber,
      Cu.FullName,
      WPMS.MonthStart,
      cast(WPMS.MonthlySpend AS decimal(10,2)),
      cast(WPMS.PreviousMonthSpend AS decimal(10,2)),
      cast(WPMS.MonthlySpend - WPMS.PreviousMonthSpend as decimal)AS SpendChange
from WithPreMonthlySpend as WPMS
join Customers as Cu
    on WPMS.CustomerId = Cu.CustomerId
order by  Cu.CustomerNumber, WPMS.MonthStart;
