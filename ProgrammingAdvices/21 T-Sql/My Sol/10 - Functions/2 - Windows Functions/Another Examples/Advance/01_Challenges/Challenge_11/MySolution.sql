/*
USE RetailOperations3NFDB;
GO
*/
/*
Challenge 11: Customer Average Order Value versus Segment Median
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



;WITH OrderTotals AS
(
    select
          SO.OrderID,
          SO.CustomerID,
          SUM(OI.Quantity * OI.UnitPrice * (1 - OI.DiscountPercent / 100.0))
              - SO.OrderDiscount AS OrderValue
    from SalesOrders AS SO
    join OrderItems AS OI
        ON OI.OrderID = SO.OrderID
    where SO.OrderStatusID <> 6
    group by SO.OrderID, SO.CustomerID, SO.OrderDiscount
),
CustomerAvgs as 
(
    select 
          OT.CustomerID,
          Cu.SegmentID,
          AVG(OT.OrderValue) AS OrderValueAvg
    from OrderTotals as OT 
    join Customers as Cu
        on OT.CustomerID = Cu.CustomerId
    group by OT.CustomerID, Cu.SegmentID
),
SegmentMedians as
(
    select 
          CA.SegmentID,
          percentile_cont(0.5)
          WITHIN GROUP(order by CA.OrderValueAvg) AS Median_OrderValueAvg
          from CustomerAvgs as CA
    group by CA.SegmentID
),
SegmentComparison AS
(
    select
          CA.*,
          SM.Median_OrderValueAvg,
          PERCENT_RANK()
          OVER
          (
              partition by CA.SegmentID
              order by CA.OrderValueAvg
          ) AS SegmentPercentRank
    from CustomerAvgs CA
    join SegmentMedians SM
        on SM.SegmentID = CA.SegmentID
)


select  
      CS.SegmentName,
      Cu.customernumber,
      CAST(SC.OrderValueAvg as decimal(14,2)),
      CAST(SC.Median_OrderValueAvg as decimal(14,2))AS SegmentMedian_OrderValueAvg ,
      CAST((SC.OrderValueAvg -       SC.Median_OrderValueAvg)  as decimal(14,2))AS AmountAboveMedian,
      CAST(SC.SegmentPercentRank as decimal(14,2))

from SegmentComparison AS SC
join customers AS Cu
    on SC.CustomerId = Cu.customerid
join CustomerSegments AS CS
    on SC.segmentId = CS.SegmentID
where SC.OrderValueAvg > SC.Median_OrderValueAvg
order by CS.SegmentName, AmountAboveMedian DESC, Cu.CustomerNumber;
    