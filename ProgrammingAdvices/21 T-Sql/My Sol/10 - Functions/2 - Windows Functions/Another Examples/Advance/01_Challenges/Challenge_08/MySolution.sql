USE RetailOperations3NFDB;
GO

/*
Challenge 08: Failed Payments Followed by Recovery
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/




;WITH PaymentFlow AS
(
    select
          Pm.OrderID,
          Pm.PaymentID,
          Pm.PaymentDate,
          Pm.Amount,        
          Pm.PaymentStatusID,
          LAG(Pm.PaymentStatusID) 
          OVER
          (
              partition by Pm.OrderID
              order by Pm.PaymentDate, Pm.PaymentID
          ) AS PreviousStatusID,
          LAG(Pm.PaymentDate)
          OVER
          (
              partition by Pm.OrderID
              order by Pm.PaymentDate, Pm.PaymentID
          ) AS PreviousPaymentDate
    from Payments AS Pm
)
SELECT
      SO.OrderNumber,
      PF.PreviousPaymentDate AS FailedPaymentDate,
      PF.PaymentDate AS RecoveredPaymentDate,
      PF.Amount AS RecoveredAmount,
      DATEDIFF(HOUR, PF.PreviousPaymentDate, PF.PaymentDate) AS RecoveryHours
from PaymentFlow AS PF
join SalesOrders AS SO 
   on SO.OrderID = PF.OrderID
join PaymentStatuses currentStatus
  on currentStatus.PaymentStatusID = PF.PaymentStatusID
join PaymentStatuses previousStatus
  on previousStatus.PaymentStatusID = PF.PreviousStatusID
where currentStatus.StatusName = N'Completed'
  and previousStatus.StatusName = N'Failed'
order by RecoveryHours, SO.OrderNumber;


