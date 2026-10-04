USE RetailOperations3NFDB;
GO

-- Challenge 51: Order Margin Band and Channel Revenue Share
-- Write your solution below.





/*
select * from SalesOrders;
select * from OrderItems;
select * from Products;
select * from SalesChannels;
select * from OrderStatuses;

*/


WITH OrderAmounts AS
(
    SELECT 
           SO.OrderID,
           SO.SalesChannelID,
           SUM(OI.Quantity * OI.UnitPrice * ( 1 - OI.DiSCountPercent / 100.0)) - SO.OrderDiSCount AS NetRevenue,
           SUM(OI.Quantity * Prc.StandardCost) AS EstimatedCost
    from SalesOrders AS SO
    join OrderItems AS OI 
        ON OI.OrderID = SO.OrderID
    join Products AS Prc 
        ON Prc.ProductID = OI.ProductID
    join OrderStatuses AS OS 
        ON OS.OrderStatusID= SO.OrderStatusID
    where OS.OrderStatusID <> 6
    group by SO.OrderID, SO.SalesChannelID, SO.OrderDiSCount
),
Banding AS
(
    select *,
      CASE
       WHEN (NetRevenue-EstimatedCost)/NULLIF(NetRevenue,0)<0 THEN 'Loss'
       WHEN (NetRevenue-EstimatedCost)/NULLIF(NetRevenue,0)<0.15 THEN 'Low'
       WHEN (NetRevenue-EstimatedCost)/NULLIF(NetRevenue,0)<0.30 THEN 'Healthy'
       ELSE 'High' END AS MarginBand
    from OrderAmounts
),
BandTotals AS
(
    select 
           SalesChannelID,
           MarginBand,
           COUNT(*) AS OrderCount,
           SUM(NetRevenue) AS NetRevenue,
           SUM(NetRevenue - EstimatedCost) AS GrossMargin
    from Banding 
    group by SalesChannelID, MarginBand
),
Scored AS
(
    select 
           *,
           100.0 * NetRevenue/
           NULLIF
           (
                SUM(NetRevenue) 
                OVER
                (
                    PARTITION BY SalesChannelID
                )
                ,0
           ) AS SharePct,
           DENSE_RANK() OVER
           (
                PARTITION BY SalesChannelID
                ORDER BY NetRevenue DESC,MarginBand
           ) AS RevenueRank
    from BandTotals
)

select 
       SC.ChannelName,Scr.MarginBand,Scr.OrderCount,
       CAST(Scr.NetRevenue AS decimal(14,2)) NetRevenue,
       CAST(Scr.GrossMargin AS decimal(14,2)) GrossMargin,
       CAST(Scr.SharePct AS decimal(7,2)) ChannelRevenueSharePct,Scr.RevenueRank
from Scored AS Scr 
join SalesChannels AS SC 
    on SC.SalesChannelID = Scr.SalesChannelID
order by SC.ChannelName, Scr.RevenueRank, Scr.MarginBand;














