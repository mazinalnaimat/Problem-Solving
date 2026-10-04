USE RetailOperations3NFDB;
GO
;WITH OrderAmounts AS
(
    SELECT o.OrderID,o.SalesChannelID,
           SUM(oi.Quantity*oi.UnitPrice*(1-oi.DiscountPercent/100.0))-o.OrderDiscount AS NetRevenue,
           SUM(oi.Quantity*p.StandardCost) AS EstimatedCost
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID=o.OrderID
    JOIN dbo.Products p ON p.ProductID=oi.ProductID
    JOIN dbo.OrderStatuses os ON os.OrderStatusID=o.OrderStatusID
    WHERE os.StatusName<>N'Cancelled'
    GROUP BY o.OrderID,o.SalesChannelID,o.OrderDiscount
),
Banding AS
(
    SELECT *,
      CASE
       WHEN (NetRevenue-EstimatedCost)/NULLIF(NetRevenue,0)<0 THEN 'Loss'
       WHEN (NetRevenue-EstimatedCost)/NULLIF(NetRevenue,0)<0.15 THEN 'Low'
       WHEN (NetRevenue-EstimatedCost)/NULLIF(NetRevenue,0)<0.30 THEN 'Healthy'
       ELSE 'High' END AS MarginBand
    FROM OrderAmounts
),
BandTotals AS
(
    SELECT SalesChannelID,MarginBand,COUNT(*) OrderCount,
           SUM(NetRevenue) NetRevenue,SUM(NetRevenue-EstimatedCost) GrossMargin
    FROM Banding GROUP BY SalesChannelID,MarginBand
),
Scored AS
(
    SELECT *,
      100.0*NetRevenue/NULLIF(SUM(NetRevenue) OVER(PARTITION BY SalesChannelID),0) AS SharePct,
      DENSE_RANK() OVER(PARTITION BY SalesChannelID ORDER BY NetRevenue DESC,MarginBand) AS RevenueRank
    FROM BandTotals
)
SELECT sc.ChannelName,s.MarginBand,s.OrderCount,
       CAST(s.NetRevenue AS decimal(14,2)) NetRevenue,
       CAST(s.GrossMargin AS decimal(14,2)) GrossMargin,
       CAST(s.SharePct AS decimal(7,2)) ChannelRevenueSharePct,s.RevenueRank
FROM Scored s JOIN dbo.SalesChannels sc ON sc.SalesChannelID=s.SalesChannelID
ORDER BY sc.ChannelName,s.RevenueRank,s.MarginBand;
