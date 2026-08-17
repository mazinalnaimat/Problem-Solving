
/*
USE RetailOperations3NFDB;
GO
*/
/*
Challenge 18: Purchase Order Fill-Rate Rank by Supplier
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

with PurchaseOrderFills as 
(
    select 
        PO.PurchaseOrderID,
        PO.PurchaseOrderNumber,
        PO.SupplierID,
        SUM(POI.QuantityOrdered) AS TotalQuantityOrdered,
        SUM(POI.QuantityReceived) AS TotalQuantityReceived,
        CAST (SUM(POI.QuantityReceived) / (NULLIF(SUM(POI.QuantityOrdered), 0)*1.0) AS decimal(12,3))
        AS FillPercent
    from  PurchaseOrders AS PO
    join  PurchaseOrderItems AS POI 
        on POI.PurchaseOrderID = PO.PurchaseOrderID
    where PO.PurchaseOrderStatusID <>5
    group by PO.PurchaseOrderID       
),
SupplierFillRanksPerOrder AS
(
    select
          POF.PurchaseOrderId,
          dense_rank()
          OVER
          (order by POF.FillPercent DESC)
          as SupplierFillRank
    from PurchaseOrderFills AS POF
    group by POF.PurchaseOrderId, POF. FillPercent
)

select 
     Su.SupplierCode,
     POF.PurchaseOrderNumber,
     POF.TotalQuantityOrdered,
     POF.TotalQuantityReceived,
     POF.FillPercent,
     SFRPO.SupplierFillRank
from PurchaseOrderFills AS POF
join SupplierFillRanksPerOrder AS SFRPO 
    on POF.PurchaseOrderId = SFRPO.PurchaseOrderId
join Suppliers AS Su 
    on POF.SupplierID = Su.SupplierID 
order by Su.SupplierCode, SFRPO.SupplierFillRank, POF.TotalQuantityOrdered;



