/*
USE RetailOperations3NFDB;
GO
*/
;WITH ShipmentBaselines AS
(
    SELECT
        s.*,
        AVG(s.ShippingCost) OVER
        (
            PARTITION BY s.WarehouseID
            ORDER BY s.ShippedAt, s.ShipmentID
            ROWS BETWEEN 20 PRECEDING AND 1 PRECEDING
        ) AS Previous20Average,
        STDEV(s.ShippingCost) OVER
        (
            PARTITION BY s.WarehouseID
            ORDER BY s.ShippedAt, s.ShipmentID
            ROWS BETWEEN 20 PRECEDING AND 1 PRECEDING
        ) AS Previous20StdDev,
        COUNT(*) OVER
        (
            PARTITION BY s.WarehouseID
            ORDER BY s.ShippedAt, s.ShipmentID
            ROWS BETWEEN 20 PRECEDING AND 1 PRECEDING
        ) AS PreviousShipmentCount
    FROM Shipments s
)
SELECT
    w.WarehouseCode,
    sb.ShipmentNumber,
    sb.ShippedAt,
    sb.ShippingCost,
    CAST(sb.Previous20Average AS decimal(12,2)) AS Previous20Average,
    CAST(sb.Previous20StdDev AS decimal(12,2)) AS Previous20StdDev,
    CAST((sb.ShippingCost - sb.Previous20Average)
         / NULLIF(sb.Previous20StdDev,0) AS decimal(9,2)) AS ZScore
FROM ShipmentBaselines sb
JOIN Warehouses w ON w.WarehouseID = sb.WarehouseID
WHERE sb.PreviousShipmentCount >= 10
  AND sb.ShippingCost > sb.Previous20Average + 2 * sb.Previous20StdDev
ORDER BY ZScore DESC, w.WarehouseCode, sb.ShippedAt;
