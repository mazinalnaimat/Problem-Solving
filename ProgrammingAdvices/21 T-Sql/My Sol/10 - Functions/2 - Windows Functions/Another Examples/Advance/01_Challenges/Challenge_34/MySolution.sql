USE RetailOperations3NFDB;
GO

/*
Challenge 34: Support Agent Monthly Workload Rank
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/
/*
select * from Employees;
select * from SupportTickets;
*/
with MonththlyWorkload as  
(
    select 
          ST.AssignedEmployeeID,
          DATEFROMPARTS(YEAR(ST.CreatedAt), MONTH(ST.CreatedAt), 1) AS MonthStart,
          COUNT(*) AS TicketCount
    from SupportTickets AS ST
    group by 
         ST.AssignedEmployeeID, 
         DATEFROMPARTS(YEAR(ST.CreatedAt), MONTH(ST.CreatedAt), 1)
),
MonthltyWorkloadRank as
(
    select 
          MW.*,
          RANK()
          OVER
          (
            partition by  MW.MonthStart
            order by MW.TicketCount DESC
          )AS WorkloadRank
    from MonththlyWorkload AS MW
)

select 
      MWR.MonthStart,
      Em.EmployeeNumber,
      Em.FullName,
      MWR.TicketCount,
      MWR.WorkloadRank
from MonthltyWorkloadRank AS MWR
join Employees AS Em
    on MWR.AssignedEmployeeID = Em.EmployeeID
order by MWR.MonthStart, MWR.WorkloadRank, Em.EmployeeNumber;
