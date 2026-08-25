USE RetailOperations3NFDB;
GO

;WITH MonthlyWorkload AS
(
    SELECT
        st.AssignedEmployeeID,
        DATEFROMPARTS(YEAR(st.CreatedAt), MONTH(st.CreatedAt), 1) AS MonthStart,
        COUNT(*) AS TicketCount
    FROM dbo.SupportTickets st
    GROUP BY st.AssignedEmployeeID,
             DATEFROMPARTS(YEAR(st.CreatedAt), MONTH(st.CreatedAt), 1)
),
RankedWorkload AS
(
    SELECT
        mw.*,
        RANK() OVER
        (
            PARTITION BY mw.MonthStart
            ORDER BY mw.TicketCount DESC
        ) AS WorkloadRank
    FROM MonthlyWorkload mw
)
SELECT
    rw.MonthStart,
    e.EmployeeNumber,
    e.FullName,
    rw.TicketCount,
    rw.WorkloadRank
FROM RankedWorkload rw
JOIN dbo.Employees e ON e.EmployeeID = rw.AssignedEmployeeID
ORDER BY rw.MonthStart, rw.WorkloadRank, e.EmployeeNumber;
