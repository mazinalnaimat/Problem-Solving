USE RetailOperations3NFDB;
GO

/*
Challenge 01: Customer Order-Frequency Percentile
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



;WITH CustomerActivity AS
(
	select 	  
		  Cu.CustomerID,
		  Cu.SegmentID,
		  count(SO.OrderID) AS OrderCount
	from  Customers AS Cu
	left join SalesOrders AS SO
		on Cu.CustomerID = SO.CustomerID
	    AND SO.OrderStatusID <> 6
	group by Cu.CustomerID, Cu.SegmentID
),
FrequencyPosition AS
(
    select
        CA.*,
        PERCENT_RANK() OVER
        (
            PARTITION BY CA.SegmentID
            ORDER BY CA.OrderCount
        ) AS FrequencyPercentRank
    FROM CustomerActivity CA
)

select
    CS.SegmentName,
    Cu.CustomerNumber,
    FP.OrderCount,
    CAST(fp.FrequencyPercentRank AS decimal(7,4)) AS FrequencyPercentRank
from FrequencyPosition FP
join Customers Cu 
    on Cu.CustomerID = FP.CustomerID
join CustomerSegments CS
    on CS.SegmentID = FP.SegmentID
order by CS.SegmentName, FP.FrequencyPercentRank DESC, Cu.CustomerNumber;




