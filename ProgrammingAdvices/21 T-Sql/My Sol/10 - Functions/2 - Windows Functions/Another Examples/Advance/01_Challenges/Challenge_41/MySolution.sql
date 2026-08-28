USE RetailOperations3NFDB;
GO

/*
Challenge 41: Year-over-Year Regional Monthly Growth
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

/*
select * from SalesOrders
select * from Regions
select * from Customers
select * from Cities
select * from Countries
*/

with OrderTotals As 
(
	select 
		  SO.OrderID,
		  SO.CustomerID,
		  DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1) AS MonthStart,
		  SUM
		  (
			OI.UnitPrice * OI.Quantity * (1.0 - OI.DiscountPercent / 100.0)
		  ) - SO.OrderDiscount AS OrderValue
	from SalesOrders AS SO
	join OrderItems AS OI
		on SO.OrderID = OI.OrderID
	where SO.OrderStatusID <> 6
	group by SO.OrderID, SO.OrderDate, SO.OrderDiscount, SO.CustomerID
),
RegionalMonthlyRevenue as 
(
	select
		  Cnt.RegionID,
		  OT.MonthStart,
		  SUM(OT.OrderValue) AS MonthlyRevenue
	from OrderTotals AS OT
	join Customers AS Cu
		on OT.CustomerID = Cu.CustomerID
	join Cities AS Ct
		on Cu.CityID = Ct.CityID
	join Countries As Cnt
		on Ct.CountryID = Cnt.CountryID 
	group by Cnt.RegionID, OT.MonthStart
),
MonthBounds AS
(
    select 
	      MIN(MonthStart) AS MinMonth,
		  MAX(MonthStart) AS MaxMonth
    from OrderTotals
),
CalendarMonths AS
(
    select 
	      MinMonth AS MonthStart,
		  MaxMonth
    from MonthBounds

    UNION ALL

	select 
	     DATEADD(MONTH,1 ,MonthStart) ,
		 MaxMonth
	from CalendarMonths AS CM
	where CM.MonthStart < CM.MaxMonth
),
RegionMonthSpine AS
(
    select
          Rg.RegionID,
          CM.MonthStart,
          COALESCE(RMR.MonthlyRevenue,0) AS MonthlyRevenue
    from Regions AS Rg
    cross join CalendarMonths AS CM
    left join RegionalMonthlyRevenue AS RMR
      on RMR.RegionID = Rg.RegionID
     and RMR.MonthStart = CM.MonthStart
),
WithPriorYear AS
(
    select
          RMS.*,
          LAG(rms.MonthlyRevenue,12)
		  OVER
          (
              partition by RMS.RegionID
              order by  RMS.MonthStart
          ) AS PreviousYearRevenue
    from RegionMonthSpine AS RMS
)
select
    Rg.RegionName,
    WPY.MonthStart,
    CAST(WPY.MonthlyRevenue AS decimal(14,2)) AS MonthlyRevenue,
    CAST(WPY.PreviousYearRevenue AS decimal(14,2)) AS PreviousYearRevenue,
    CAST((WPY.MonthlyRevenue / NULLIF(WPY.PreviousYearRevenue,0) - 1) * 100
         AS decimal(9,2)) AS YoYGrowthPercent
from WithPriorYear AS WPY
join Regions AS Rg 
	on Rg.RegionID = WPY.RegionID
WHERE WPY.PreviousYearRevenue is not null
order by Rg.RegionName, WPY.MonthStart
option (MAXRECURSION 0);