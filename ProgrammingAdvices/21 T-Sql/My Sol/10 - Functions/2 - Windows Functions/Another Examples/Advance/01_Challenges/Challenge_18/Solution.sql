/*
USE RetailOperations3NFDB;
GO
*/
;WITH PurchaseOrderFill AS
(
    SELECT
        po.SupplierID,
        po.PurchaseOrderID,
        po.PurchaseOrderNumber,
        SUM(poi.QuantityOrdered) AS QuantityOrdered,
        SUM(poi.QuantityReceived) AS QuantityReceived,
        SUM(poi.QuantityReceived) * 100.0 / NULLIF(SUM(poi.QuantityOrdered),0) AS FillPercent
    FROM dbo.PurchaseOrders po
    JOIN dbo.PurchaseOrderItems poi
      ON poi.PurchaseOrderID = po.PurchaseOrderID
    GROUP BY po.SupplierID, po.PurchaseOrderID, po.PurchaseOrderNumber
),
RankedFill AS
(
    SELECT
        pof.*,
        DENSE_RANK() OVER
        (
            PARTITION BY pof.SupplierID
            ORDER BY pof.FillPercent DESC
        ) AS SupplierFillRank
    FROM PurchaseOrderFill pof
)
SELECT
    s.SupplierCode,
    rf.PurchaseOrderNumber,
    rf.QuantityOrdered,
    rf.QuantityReceived,
    CAST(rf.FillPercent AS decimal(7,2)) AS FillPercent,
    rf.SupplierFillRank
FROM RankedFill rf
JOIN dbo.Suppliers s ON s.SupplierID = rf.SupplierID
ORDER BY s.SupplierCode, rf.SupplierFillRank, rf.PurchaseOrderNumber;
