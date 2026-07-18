



DECLARE @StartDate DATE = '2023-01-01'; 
DECLARE @EndDate DATE = '2023-01-31';   

WITH DateSeries AS 
(
    SELECT @StartDate AS [Date]

    UNION ALL

    SELECT DATEADD(day, 1, [Date])
    FROM DateSeries
    WHERE [Date] < @EndDate 
)

SELECT * FROM DateSeries


