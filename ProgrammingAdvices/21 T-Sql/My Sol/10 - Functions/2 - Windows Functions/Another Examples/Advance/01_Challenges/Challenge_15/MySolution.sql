/*
USE RetailOperations3NFDB;
GO
*/


/*
Challenge 15: Order Share of Customer Lifetime Value
Difficulty: Medium


Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/
/*
select * from salesorders;
select * from OrderItems;
select * from orderstatuses*/



WITH OrderTotals AS 
(
    select  
        SO.OrderID,
        SO.OrderNumber,
        SO.CustomerID,
        SO.OrderDate,
        SUM(
                OI.Quantity * OI.UnitPrice  * (1 - OI.DiscountPercent / 100.0) 
           )
           - SO.OrderDiscount AS OrderValue
    from SalesOrders AS SO
    join OrderItems AS OI 
        on OI.OrderID = SO.OrderID
    where SO.OrderStatusId <> 6
    group by SO.OrderID, SO.OrderNumber,
     SO.CustomerID, SO.OrderDate, SO.OrderDiscount
),
CustomerValue AS 
(
    select 
        OT.*,
        SUM(OT.OrderValue) 
        OVER
        (
            partition by OT.CustomerID
        ) AS CustomerLifetimeValue
    from OrderTotals AS OT
)
select
    Cu.CustomerNumber,
    CV.OrderNumber,
    CV.OrderDate,
    CAST(CV.OrderValue AS decimal(14,2)) AS OrderValue,
    CAST(CV.CustomerLifetimeValue AS decimal(14,2)) AS CustomerLifetimeValue,
    CAST(CV.OrderValue * 100.0 / NULLIF(CV.CustomerLifetimeValue, 0) AS decimal(9,2)) AS OrderSharePercent 
from CustomerValue AS CV
join Customers AS Cu 
    on CV.CustomerID = Cu.CustomerId
order by Cu.CustomerNumber, CV.OrderDate, CV.OrderNumber;







