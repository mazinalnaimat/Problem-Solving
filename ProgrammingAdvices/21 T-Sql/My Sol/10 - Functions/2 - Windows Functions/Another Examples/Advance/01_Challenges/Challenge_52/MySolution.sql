USE RetailOperations3NFDB;
GO

-- Challenge 52: Longest Consecutive Sales-Target Attainment Streak
-- Write your solution below.




/*
select * from EmployeeMonthlyTargets
*/

with OrderValue as 
(
	select 
		   SO.OrderID,
		   SO.SalesEmployeeID,
		   DATEfromPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1) AS MonthStart,
		   SUM
		   (
				OI.Quantity * OI.UnitPrice * (1.0 - OI.DiscountPercent/100.0)
		   ) - SO.OrderDiscount AS Revenue
	from SalesOrders AS SO
	join OrderItems AS OI
	on SO.OrderID = OI.OrderID
	where SO.OrderStatusID <> 6
	group by SO.OrderID, SO.SalesEmployeeID, SO.OrderDate, SO.OrderDiscount
),
Actual AS
(
	 select 
	        SalesEmployeeID,
			MonthStart,
			SUM(Revenue) AS  ActualRevenue
	 from OrderValue 
	 group by SalesEmployeeID,MonthStart
),
Attained AS
(
	 select 
			EmMonTarg.EmployeeID,
			EmMonTarg.TargetMonth,
			EmMonTarg.RevenueTarget,
			COALESCE(Act.ActualRevenue,0) ActualRevenue,
			100.0*COALESCE(Act.ActualRevenue,0)/NULLIF(EmMonTarg.RevenueTarget,0) AttainmentPct
	 from EmployeeMonthlyTargets AS EmMonTarg
	 left join Actual AS  Act 
		ON Act.SalesEmployeeID = EmMonTarg.EmployeeID AND Act.MonthStart = EmMonTarg.TargetMonth
	 where COALESCE(Act.ActualRevenue,0)>=EmMonTarg.RevenueTarget
),
Islands AS
(
	 select 
			*,
			DATEADD(MONTH,-ROW_NUMBER() OVER(PARTITION BY EmployeeID order by TargetMonth),TargetMonth) grp
	 from Attained
),
Streaks AS
(
	 select 
	        EmployeeID,
			grp,
			COUNT(*) StreakMonths,
			MIN(TargetMonth) StartMonth,
			MAX(TargetMonth) EndMonth,
			AVG(AttainmentPct) AverageAttainmentPct
	 from Islands 
	 group by EmployeeID,grp
),
Pick AS
(
	 select 
			*,
			ROW_NUMBER() OVER(PARTITION BY EmployeeID order by StreakMonths DESC,EndMonth DESC,StartMonth DESC) rn
	 from Streaks
),
Ranked AS
(
	 select 
			 *,
			 RANK() OVER(order by StreakMonths DESC,EndMonth DESC,EmployeeID) StreakRank
	 from Pick
	 where rn=1
)
select 
	   Emp.EmployeeNumber,
	   Emp.FullName,
	   Ran.StreakMonths LongestStreakMonths,
       Ran.StartMonth StreakStartMonth,
	   Ran.EndMonth StreakEndMonth,
       CAST(Ran.AverageAttainmentPct AS decimal(8,2)) AverageAttainmentPct,
	   Ran.StreakRank
from Ranked AS Ran 
join Employees AS Emp
	on Emp.EmployeeID = Ran.EmployeeID
order by Ran.StreakRank,Emp.EmployeeNumber;


