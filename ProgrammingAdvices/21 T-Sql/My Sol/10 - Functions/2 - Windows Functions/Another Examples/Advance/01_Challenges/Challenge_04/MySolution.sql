USE RetailOperations3NFDB;
GO

/*
Challenge 04: Regional Pareto Customers
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

















with OrderTotals as
(
	select 
		  SO.OrderID,
		  SO.CustomerID,
		  Sum(OI.UnitPrice * OI.Quantity * (1 - OI.DiscountPercent / 100.0)) - SO.OrderDiscount
		  AS OrderValue 
	from SalesOrders As SO
	join OrderItems AS OI
		on SO.OrderID = OI.OrderID
	where SO.OrderStatusID <> 6
    group by SO.OrderID, SO.CustomerID, SO.OrderDiscount
),
CustomerRevenue as 
(
    select
        Re.RegionID,
        OT.CustomerID,
        SUM(OT.OrderValue) AS CustomerRevenue
    from OrderTotals AS OT
    join Customers AS Cu
        on Cu.CustomerID = OT.CustomerID
    join Cities as  Ci 
        on Ci.CityID = Cu.CityID
    join Countries Co 
        on Co.CountryID = ci.CountryID
    join Regions Re 
        on Re.RegionID = Co.RegionID
    group by Re.RegionID, OT.CustomerID
),
RevenueCurve AS
(
    select
        CR.*,
        ROW_NUMBER()
        OVER
        (
            partition by  CR.RegionID
            order by CR.CustomerRevenue DESC, CR.CustomerID
        ) AS RevenuePosition,
        SUM(CR.CustomerRevenue)
        OVER
        (
            partition by CR.RegionID
            order by CR.CustomerRevenue DESC, CR.CustomerID
            rows between
            unbounded preceding and current row
        ) AS CumulativeRevenue,
        SUM(CR.CustomerRevenue) 
        OVER
        (
            PARTITION BY CR.RegionID
        ) AS RegionRevenue
    from CustomerRevenue as CR
),
Threshold AS
(
    select
        RC.*,
        (RC.CumulativeRevenue - RC.CustomerRevenue) * 100.0
            / NULLIF(RC.RegionRevenue,0) AS PreviousPercent
    FROM RevenueCurve AS RC
)

SELECT
      Re.RegionName,
      Cu.CustomerNumber,
      CAST(Tsh.CustomerRevenue AS decimal(14,2)) AS CustomerRevenue,
      CAST(Tsh.CumulativeRevenue * 100.0 / NULLIF(Tsh.RegionRevenue,0) AS decimal(7,2))
          AS CumulativeRevenuePercent,
      Tsh.RevenuePosition
from Threshold AS Tsh
join Regions AS Re
    ON Re.RegionID = Tsh.RegionID
join Customers as Cu 
    on Cu.CustomerID = Tsh.CustomerID
where Tsh.PreviousPercent < 80
order by Re.RegionName, Tsh.RevenuePosition, Cu.CustomerNumber;










