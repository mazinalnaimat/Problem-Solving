USE RetailOperations3NFDB;
GO

/*
Challenge 07: Product Selling Price Changes
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



with PreProductPrices as
(
    select 
      
            oi.ProductID,
            SO.OrderNumber,
            SO.OrderDate,
            SO.OrderID,
            oi.OrderItemID,
            oi.UnitPrice,
            LAG(oi.UnitPrice) OVER
            (
                PARTITION BY oi.ProductID
                ORDER BY SO.OrderDate, SO.OrderID, oi.OrderItemID
            ) AS PreviousUnitPrice
    from  OrderItems AS OI
    join SalesOrders as SO
        on OI.OrderID = SO.OrderID
        and SO.OrderStatusID <> 6
)

select 
      Pr.SKU,
      PPP.OrderNumber,
      PPP.OrderDate,
      PPP.UnitPrice,
      PPP.PreviousUnitPrice,
      CAST((PPP.UnitPrice / NULLIF(PPP.PreviousUnitPrice, 0) - 1)  * 100
      as decimal(7, 2))
      AS PriceChangePercent
from PreProductPrices AS PPP
join Products AS Pr
    on PPP.ProductID = Pr.ProductID
where ABS(PPP.UnitPrice / NULLIF(PPP.PreviousUnitPrice,0) - 1) >= 0.10
order by ABS((PPP.UnitPrice / NULLIF(PPP.PreviousUnitPrice,0) - 1) * 100) DESC,
         PR.SKU, PPP.OrderDate;



