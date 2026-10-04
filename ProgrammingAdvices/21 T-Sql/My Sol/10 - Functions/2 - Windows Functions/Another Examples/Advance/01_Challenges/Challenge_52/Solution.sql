USE RetailOperations3NFDB;
GO
;WITH OrderValue AS
(
 SELECT o.OrderID,o.SalesEmployeeID,DATEFROMPARTS(YEAR(o.OrderDate),MONTH(o.OrderDate),1) MonthStart,
        SUM(oi.Quantity*oi.UnitPrice*(1-oi.DiscountPercent/100.0))-o.OrderDiscount Revenue
 FROM SalesOrders o JOIN OrderItems oi ON oi.OrderID=o.OrderID
 JOIN OrderStatuses os ON os.OrderStatusID=o.OrderStatusID
 WHERE os.StatusName<>N'Cancelled'
 GROUP BY o.OrderID,o.SalesEmployeeID,o.OrderDate,o.OrderDiscount
),
Actual AS
(
 SELECT SalesEmployeeID,MonthStart,SUM(Revenue) ActualRevenue
 FROM OrderValue GROUP BY SalesEmployeeID,MonthStart
),
Attained AS
(
 SELECT t.EmployeeID,t.TargetMonth,t.RevenueTarget,COALESCE(a.ActualRevenue,0) ActualRevenue,
        100.0*COALESCE(a.ActualRevenue,0)/NULLIF(t.RevenueTarget,0) AttainmentPct
 FROM EmployeeMonthlyTargets t
 LEFT JOIN Actual a ON a.SalesEmployeeID=t.EmployeeID AND a.MonthStart=t.TargetMonth
 WHERE COALESCE(a.ActualRevenue,0)>=t.RevenueTarget
),
Islands AS
(
 SELECT *,DATEADD(MONTH,-ROW_NUMBER() OVER(PARTITION BY EmployeeID ORDER BY TargetMonth),TargetMonth) grp
 FROM Attained
),
Streaks AS
(
 SELECT EmployeeID,grp,COUNT(*) StreakMonths,MIN(TargetMonth) StartMonth,MAX(TargetMonth) EndMonth,
        AVG(AttainmentPct) AverageAttainmentPct
 FROM Islands GROUP BY EmployeeID,grp
),
Pick AS
(
 SELECT *,ROW_NUMBER() OVER(PARTITION BY EmployeeID ORDER BY StreakMonths DESC,EndMonth DESC,StartMonth DESC) rn
 FROM Streaks
),
Ranked AS
(
 SELECT *,RANK() OVER(ORDER BY StreakMonths DESC,EndMonth DESC,EmployeeID) StreakRank
 FROM Pick WHERE rn=1
)
SELECT e.EmployeeNumber,e.FullName,r.StreakMonths LongestStreakMonths,
       r.StartMonth StreakStartMonth,r.EndMonth StreakEndMonth,
       CAST(r.AverageAttainmentPct AS decimal(8,2)) AverageAttainmentPct,r.StreakRank
FROM Ranked r JOIN Employees e ON e.EmployeeID=r.EmployeeID
ORDER BY r.StreakRank,e.EmployeeNumber;
