/*
USE RetailOperations3NFDB;
GO
*/

/*
Challenge 20: Shipment Cost Anomalies
Difficulty: Hard

Write your solution beloWH.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

;WITH ShipmentBaselines AS
(
    select
        Sp.*,
        AVG(Sp.ShippingCost) OVER
        (
            partition by Sp.WarehouseID
            order by Sp.ShippedAt, Sp.ShipmentID
            rows between 20 preceding and 1 preceding
        ) AS Previous20Average,
        STDDEV(Sp.ShippingCost) OVER
        (
            partition by Sp.WarehouseID
            order by Sp.ShippedAt, Sp.ShipmentID
            rows between 20 preceding and 1 preceding
        ) AS Previous20StdDev,
        COUNT(*) OVER
        (
            partition by Sp.WarehouseID
            order by Sp.ShippedAt, Sp.ShipmentID
            rows between 20 preceding and 1 preceding
        ) AS PreviousShipmentCount
    from Shipments AS Sp
)
select
    WH.WarehouseCode,
    SB.ShipmentNumber,
    SB.ShippedAt,
    SB.ShippingCost,
    CAST(SB.Previous20Average AS decimal(12,2)) AS Previous20Average,
    CAST(SB.Previous20StdDev AS decimal(12,2)) AS Previous20StdDev,
    CAST((SB.ShippingCost - SB.Previous20Average)
         / NULLIF(SB.Previous20StdDev,0) AS decimal(9,2)) AS ZScore
from ShipmentBaselines AS SB
JOIN Warehouses AS WH 
    on WH.WarehouseID = SB.WarehouseID
WHERE SB.PreviousShipmentCount >= 10
  and SB.ShippingCost > SB.Previous20Average + 2 * SB.Previous20StdDev
order by ZScore DESC, WH.WarehouseCode, SB.ShippedAt;