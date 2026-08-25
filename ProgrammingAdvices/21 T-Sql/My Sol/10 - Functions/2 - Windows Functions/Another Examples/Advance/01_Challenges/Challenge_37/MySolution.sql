USE RetailOperations3NFDB;
GO

/*
Challenge 37: Rolling Delayed-Delivery Rate by Channel
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

/*
select * from SalesChannels;
select * from SalesOrders;
select * from Shipments;
*/


;WITH OrderDelivery AS
(
    select
          Shp.OrderID,
          COUNT(*) AS ShipmentCount,
          COUNT(Shp.DeliveredAt) AS DeliveredShipmentCount,
          MAX(Shp.DeliveredAt) AS FinalDeliveredAt
    from Shipments AS Shp
    group by Shp.OrderID
),
MonthlyDeliveryStats AS
(
    select
          SO.SalesChannelID,
          DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1) AS MonthStart,
          COUNT(*) AS DeliveredOrders,
          SUM(CASE WHEN CAST(OD.FinalDeliveredAt AS date) > SO.RequiredDate
                   THEN 1 ELSE 0 END) AS DelayedOrders
    from OrderDelivery AS OD
    join SalesOrders AS SO
        on SO.OrderID = OD.OrderID
    where OD.ShipmentCount = OD.DeliveredShipmentCount
    group by SO.SalesChannelID,
             DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1)
),
RollingCounts AS
(
    select
        MDS.*,
        SUM(MDS.DeliveredOrders) 
        OVER
        (
            partition by  MDS.SalesChannelID
            order by MDS.MonthStart
            rows between 2 preceding and current row
        ) AS RollingDeliveredOrders,
        SUM(MDS.DelayedOrders)
        OVER
        (
            partition by  MDS.SalesChannelID
            order by MDS.MonthStart
            rows between 2 preceding and current row
        ) AS RollingDelayedOrders
    from MonthlyDeliveryStats AS MDS
)
SELECT
      SC..ChannelName,
      rc.MonthStart,
      rc.DeliveredOrders,
      rc.DelayedOrders,
      CAST(rc.RollingDelayedOrders * 100.0 / NULLIF(rc.RollingDeliveredOrders,0)
           AS decimal(7,2)) AS Rolling3MonthDelayRate
from RollingCounts AS RC
join SalesChannels AS  SC
    on SC..SalesChannelID = rc.SalesChannelID
order by SC..ChannelName, rc.MonthStart;



