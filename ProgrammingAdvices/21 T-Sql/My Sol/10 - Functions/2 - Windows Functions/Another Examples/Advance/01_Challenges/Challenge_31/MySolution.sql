USE RetailOperations3NFDB;
GO

/*
Challenge 31: Warehouse Fulfillment Percentiles
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


;WITH OrderDelivery AS
(
    select
          Shpm.OrderID,
          Shpm.WarehouseID,
          MAX(Shpm.DeliveredAt) AS FinalDeliveredAt,
          COUNT(*) AS ShipmentCount,
          COUNT(Shpm.DeliveredAt) AS DeliveredShipmentCount
    from Shipments AS Shpm
    group by Shpm.OrderID, Shpm.WarehouseID
),
FulfillmentCycles AS
(
    select
          OD.WarehouseID,
          OD.OrderID,
          DATEDIFF(DAY, SO.OrderDate, CAST(OD.FinalDeliveredAt AS date)) AS FulfillmentDays
    from OrderDelivery AS OD
    join SalesOrders SO 
        on SO.OrderID = OD.OrderID
    where OD.ShipmentCount = OD.DeliveredShipmentCount
),
Percentiles AS
(
    SELECT
          FC.WarehouseID,
          COUNT(*) 
          OVER 
          (
              partition by FC.WarehouseID
          ) AS DeliveredOrderCount,
          PERCENTILE_CONT(0.50)
          WITHIN GROUP
          (
             order by FC.FulfillmentDays
          )
          OVER 
          (
              partition by FC.WarehouseID
          ) AS MedianFulfillmentDays,
          PERCENTILE_CONT(0.90) 
          WITHIN GROUP
          (
             order by FC.FulfillmentDays
          )
          OVER
          (
              partition by FC.WarehouseID
          ) AS P90FulfillmentDays
    from FulfillmentCycles AS  FC
)
select distinct
       Wh.WarehouseCode,
       Prcn.DeliveredOrderCount,
       CAST(Prcn.MedianFulfillmentDays AS decimal(9,2)) AS MedianFulfillmentDays,
       CAST(Prcn.P90FulfillmentDays AS decimal(9,2)) AS P90FulfillmentDays
from Percentiles as Prcn
join Warehouses AS Wh
    on Wh.WarehouseID = Prcn.WarehouseID
order by Wh.WarehouseCode;
