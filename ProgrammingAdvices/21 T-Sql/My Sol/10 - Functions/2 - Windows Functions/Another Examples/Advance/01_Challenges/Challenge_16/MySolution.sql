/*
USE RetailOperations3NFDB;
GO
*/
/*
Challenge 16: Manager Team Revenue Ranking
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

/*
select distinct  Em1.Employeeid, Em1.FullName 
from Employees AS Em1
join Employees AS Em2
    on Em1.employeeid = Em2.managerid

select * from Employees
*/

with Recursive OrderTotals AS 
(
    select 
        SO.OrderId,
        SO.SalesEmployeeID,
        MAKE_DATE
        (
            EXTRACT(YEAR FROM SO.OrderDate)::int,
            EXTRACT(MONTH FROM SO.OrderDate)::int,
            1
        ) AS MonthStart,
        SUM(OI.Quantity * OI.UnitPrice * (1 - OI.DiscountPercent / 100.0))
        - SO.OrderDiscount AS OrderValue
    from SalesOrders As SO
    join OrderItems AS OI
        on SO.OrderId = OI.OrderId
    where SO.OrderStatusID <> 6
    group by SO.OrderID, SO.SalesEmployeeID, SO.OrderDate

),
 EmployeeHierarchy AS
(
    select
          Em.EmployeeID AS ManagerID,
          Em.EmployeeID AS DescendantEmployeeID
    from Employees As Em

    UNION ALL

    select
          EH.ManagerID,
          Child.EmployeeID
    from EmployeeHierarchy AS EH
    join Employees Child
        on child.ManagerID = eh.DescendantEmployeeID
),
ManagerMonthlyRevenue AS
(
    select 
          EH.ManagerID,
          OT.MonthStart,
          SUM(OT.OrderValue) AS TeamRevenue
    from EmployeeHierarchy AS EH
    join OrderTotals AS OT
        on EH.DescendantEmployeeID = OT.SalesEmployeeID
    group by EH.ManagerID, OT.MonthStart

),
RankedManagers AS
(
    SELECT
          MMR.*,
          RANK() 
          OVER
          (
              partition by MMR.MonthStart
              order by MMR.TeamRevenue DESC
          ) AS ManagerRank
    FROM ManagerMonthlyRevenue AS MMR
)



SELECT
      RM.MonthStart,
      Em.EmployeeNumber AS ManagerNumber,
      Em.FullName AS ManagerName,
      CAST(rm.TeamRevenue AS decimal(14,2)) AS TeamRevenue,
      RM.ManagerRank
from RankedManagers AS RM
join Employees AS Em 
    on Em.EmployeeID = RM.ManagerID
where exists
(
    select 1
    from Employees as Child
    where Child.ManagerID = RM.ManagerID
)
order by RM.MonthStart, RM.ManagerRank, Em.EmployeeNumber