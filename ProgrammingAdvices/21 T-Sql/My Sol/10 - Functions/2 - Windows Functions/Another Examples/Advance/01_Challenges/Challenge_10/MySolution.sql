USE RetailOperations3NFDB;
GO

/*
Challenge 10: Longest Positive Monthly Sales-Growth Streak
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
		  SO.SalesEmployeeID,
		  DATEfromPARTS(year(OrderDate), MONTH(OrderDate), 1) AS MonthStart,
		  SUM (OI.Quantity * OI.UnitPrice * (1 - OI.DiscountPercent / 100.0))
            - SO.OrderDiscount AS OrderValue
	from SalesOrders AS SO
	join OrderItems AS OI
		on SO.OrderID = OI.OrderID
	where SO.OrderStatusID <> 6
	group by SO.OrderID,  SO.SalesEmployeeID, SO.OrderDate, SO.OrderDiscount
),
MonthlySales AS
(
    select 
		  SalesEmployeeID,
		  MonthStart,
		  SUM(OrderValue) AS MonthlyRevenue
    from OrderTotals
    group by SalesEmployeeID, MonthStart
),
GrowthComparison AS
(
    select
          MS.*,
          LAG(MS.MonthStart)
          OVER
          (
              partition by MS.SalesEmployeeID
              order by MS.MonthStart
          ) AS PreviousMonth,
          LAG(MS.MonthlyRevenue) 
          OVER
          (
              partition by MS.SalesEmployeeID
              order by MS.MonthStart
          ) AS PreviousRevenue
    from MonthlySales AS MS
), 
QualifyingMonths AS
(
    select
          GC.*,
          ROW_NUMBER()
          OVER
          (
              partition by GC.SalesEmployeeID
              order by GC.MonthStart
          ) AS QualifiedSequence
    from GrowthComparison AS GC
    where GC.MonthlyRevenue > GC.PreviousRevenue
         and DATEDIFF(MONTH, GC.PreviousMonth, GC.MonthStart) = 1
),
GrowthIslands AS
(
    select
          QM.*,
          DATEADD(MONTH, -CONVERT(int,QM.QualifiedSequence), QM.MonthStart) AS IslandKey
    from QualifyingMonths as QM
),
Streaks AS
(
    select
          SalesEmployeeID,
          IslandKey,
          MIN(MonthStart) AS StreakStartMonth,
          MAX(MonthStart) AS StreakEndMonth,
          COUNT(*) AS GrowthMonths
    from GrowthIslands
    group by SalesEmployeeID, IslandKey
),
RankedStreaks AS
(
    select
          St.*,
          ROW_NUMBER()
          OVER
          (
              partition by St.SalesEmployeeID
              order by St.GrowthMonths DESC, St.StreakEndMonth DESC
          ) AS StreakRank
    from Streaks AS St
)
select
    Em.EmployeeNumber,
    RS.StreakStartMonth,
    RS.StreakEndMonth,
    RS.GrowthMonths
from RankedStreaks AS RS
join Employees AS Em
    ON Em.EmployeeID = RS.SalesEmployeeID
where RS.StreakRank = 1
order by RS.GrowthMonths DESC, Em.EmployeeNumber;








