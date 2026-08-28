USE RetailOperations3NFDB;
GO

;WITH TicketFlow AS
(
    SELECT
        tsh.TicketID,
        tsh.SupportTicketStatusID,
        tsh.ChangedAt,
        LAG(tsh.SupportTicketStatusID) OVER
        (
            PARTITION BY tsh.TicketID
            ORDER BY tsh.ChangedAt, tsh.TicketStatusHistoryID
        ) AS PreviousStatusID,
        LAG(tsh.ChangedAt) OVER
        (
            PARTITION BY tsh.TicketID
            ORDER BY tsh.ChangedAt, tsh.TicketStatusHistoryID
        ) AS PreviousChangedAt
    FROM dbo.TicketStatusHistory tsh
)
SELECT
    st.TicketNumber,
    previousStatus.StatusName AS PreviousStatus,
    tf.ChangedAt AS ReopenedAt,
    DATEDIFF(HOUR, tf.PreviousChangedAt, tf.ChangedAt) AS HoursSincePreviousStatus
FROM TicketFlow tf
JOIN dbo.SupportTickets st ON st.TicketID = tf.TicketID
JOIN dbo.SupportTicketStatuses currentStatus
  ON currentStatus.SupportTicketStatusID = tf.SupportTicketStatusID
LEFT JOIN dbo.SupportTicketStatuses previousStatus
  ON previousStatus.SupportTicketStatusID = tf.PreviousStatusID
WHERE currentStatus.StatusName = N'Reopened'
ORDER BY tf.ChangedAt, st.TicketNumber;
