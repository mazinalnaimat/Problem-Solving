USE RetailOperations3NFDB;
GO

;WITH PaymentFlow AS
(
    SELECT
        p.OrderID,
        p.PaymentID,
        p.PaymentDate,
        p.Amount,
        p.PaymentStatusID,
        LAG(p.PaymentStatusID) OVER
        (
            PARTITION BY p.OrderID
            ORDER BY p.PaymentDate, p.PaymentID
        ) AS PreviousStatusID,
        LAG(p.PaymentDate) OVER
        (
            PARTITION BY p.OrderID
            ORDER BY p.PaymentDate, p.PaymentID
        ) AS PreviousPaymentDate
    FROM dbo.Payments p
)
SELECT
    o.OrderNumber,
    pf.PreviousPaymentDate AS FailedPaymentDate,
    pf.PaymentDate AS RecoveredPaymentDate,
    pf.Amount AS RecoveredAmount,
    DATEDIFF(HOUR, pf.PreviousPaymentDate, pf.PaymentDate) AS RecoveryHours
FROM PaymentFlow pf
JOIN dbo.SalesOrders o ON o.OrderID = pf.OrderID
JOIN dbo.PaymentStatuses currentStatus
  ON currentStatus.PaymentStatusID = pf.PaymentStatusID
JOIN dbo.PaymentStatuses previousStatus
  ON previousStatus.PaymentStatusID = pf.PreviousStatusID
WHERE currentStatus.StatusName = N'Completed'
  AND previousStatus.StatusName = N'Failed'
ORDER BY RecoveryHours, o.OrderNumber;
