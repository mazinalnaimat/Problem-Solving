USE RetailOperations3NFDB;
GO

/*
Challenge 45: Salesperson Monthly Revenue Rank
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

/**/



with OrderTotals as 
(
	select 
          SO.OrderID,
          SO.SalesEmployeeID,
          DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate),1) AS MonthStart,
          SUM
          (
            OI.Quantity * OI.UnitPrice * (1.0 - OI.DiscountPercent/100.0)
          ) - SO.OrderDiscount AS OrderValue
    from SalesOrders AS SO
    join OrderItems AS OI
        on SO.OrderID = OI.OrderID
    where SO.OrderStatusID <> 6
    group by SO.SalesEmployeeID, SO.OrderID, SO.OrderDiscount, SO.OrderDate 

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
SalesRevenueRank as 
(
    select 
          MS.MonthStart,
          MS.SalesEmployeeID,
          MS.MonthlyRevenue,
          RANK()
          OVER
          (
            partition by MS.MonthStart
            order by MS.MonthlyRevenue DESC
          ) AS RevenueRank
    from MonthlySales AS MS
)

select
      SRR.MonthStart,
      Em.EmployeeNumber,
      Em.FullName,
      SRR.MonthlyRevenue,
      SRR.RevenueRank
from SalesRevenueRank AS SRR
join Employees AS Em
    on SRR.SalesEmployeeID = Em.EmployeeID
order by SRR.MonthStart, SRR.RevenueRank, Em.EmployeeNumber
