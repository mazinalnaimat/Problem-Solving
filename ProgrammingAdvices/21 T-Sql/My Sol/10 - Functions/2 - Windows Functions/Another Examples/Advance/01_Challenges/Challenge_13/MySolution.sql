/*USE RetailOperations3NFDB;
GO*/

/*
Challenge 13: Split-Shipment Final Delivery Performance
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

with ShipmentWindows as 
(
    select  
        Sm.OrderID,
        Sm.ShipmentID,
        MIN(Sm.ShippedAt)
        OVER
        (
            partition by Sm.OrderID
        ) AS FirstShippedAt,
        MAX(Sm.DeliveredAt)
        OVER
        (
            partition by Sm.OrderID
        ) AS FinalDeliveredAt,
        COUNT(*) 
        OVER
        (
            partition by Sm.OrderID
        )AS ShipmentCount,
        COUNT(Sm.DeliveredAt)
        OVER
        (
            partition by Sm.OrderID
        ) AS DeliveredShipmentCount,
        ROW_NUMBER()
        OVER
        (
            partition by Sm.OrderID 
            order by Sm.ShipmentID

        ) AS OrderRow 

    from Shipments AS Sm
)
select
    SO.OrderNumber,
    SW.ShipmentCount,
    SW.FirstShippedAt,
    SW.FinalDeliveredAt,
    -- Hours difference between two timestamps
    EXTRACT(EPOCH FROM (SW.FinalDeliveredAt - SW.FirstShippedAt))::integer / 3600 AS FulfillmentHours,

    -- Days difference between two dates
    (SW.FinalDeliveredAt::date - SO.RequiredDate::date) AS DelayDays

from ShipmentWindows AS SW
join SalesOrders AS SO
    on SO.OrderID = SW.OrderID
where SW.OrderRow = 1
  and SW.ShipmentCount > 1
  and SW.ShipmentCount = SW.DeliveredShipmentCount
order by DelayDays DESC, SO.OrderNumber;
