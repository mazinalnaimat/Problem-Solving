USE RetailOperations3NFDB;
GO

/*
Challenge 42: Reopened Support Ticket Events
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/




/*

select * from SupportTickets
select * from SupportTicketStatuses
select * from TicketStatusHistory
*/

;WITH TicketFlow AS
(
    SELECT
          TSH.TicketID,
          TSH.SupportTicketStatusID,
          TSH.ChangedAt,
          LAG(TSH.SupportTicketStatusID)
          OVER
          (
              partition by TSH.TicketID
              order by TSH.ChangedAt, TSH.TicketStatusHistoryID
          ) AS PreviousStatusID,
          LAG(TSH.ChangedAt)
          OVER
          (
              partition by TSH.TicketID
              order by TSH.ChangedAt, TSH.TicketStatusHistoryID
          ) AS PreviousChangedAt
    FROM TicketStatusHistory AS TSH
)

select 
      ST.TicketNumber,
      PreviousStatus.StatusName,
      TF.ChangedAt AS ReopenedAt,
      DATEDIFF(HOUR, TF.PreviousChangedAt, TF.ChangedAt) AS HoursSincePreviousStatus
from TicketFlow AS TF
join SupportTickets AS ST
    on TF.TicketID = ST.TicketID
join SupportTicketStatuses AS CurrentStatus
    on CurrentStatus.SupportTicketStatusID = TF.SupportTicketStatusID
join SupportTicketStatuses AS PreviousStatus 
    on PreviousStatus.SupportTicketStatusID = TF.PreviousStatusID
where CurrentStatus.SupportTicketStatusID = 6
order by TF.ChangedAt, ST.TicketNumber;