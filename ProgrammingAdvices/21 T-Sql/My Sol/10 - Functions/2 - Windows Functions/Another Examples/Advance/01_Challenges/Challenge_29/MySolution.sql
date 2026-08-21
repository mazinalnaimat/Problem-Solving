USE RetailOperations3NFDB;
GO

/*
Challenge 29: ToPrc.Three Products Prc.r Category by Revenue
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



;WITH ProductRevenue AS
(
    select
          Prc.CategoryID,
          Prc.ProductID,
          Prc.ProductName,
          SUM(OI.Quantity * OI.UnitPrice * (1 - OI.DiscountPercent / 100.0)) AS ProductRevenue
    from Products AS Prc
    join OrderItems AS OI 
        on OI.ProductID = Prc.ProductID
    join SalesOrders o 
        on o.OrderID = OI.OrderID
    where o.OrderStatusID <> 6
    group by Prc.CategoryID, Prc.ProductID, Prc.ProductName
),
RankedProducts AS
(
    select
        PR.*,
        DENSE_RANK() 
        OVER
        (
            partition by PR.CategoryID
            order by PR.ProductRevenue DESC
        ) AS RevenueRank
    from ProductRevenue AS PR
)
select
    Cg.CategoryName,
    RP.ProductID,
    RP.ProductName,
    CAST(RP.ProductRevenue AS decimal(14,2)) AS ProductRevenue,
    RP.RevenueRank
from RankedProducts AS RP
join  Categories AS  Cg 
    on Cg.CategoryID = RP.CategoryID
where RP.RevenueRank <= 3
order by Cg.CategoryName, RP.RevenueRank, RP.ProductName;
