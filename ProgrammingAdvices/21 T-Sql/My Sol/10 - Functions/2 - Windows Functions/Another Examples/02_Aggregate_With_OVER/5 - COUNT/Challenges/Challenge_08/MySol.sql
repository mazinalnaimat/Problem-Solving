USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

WITH ReadingCounts AS
(
	select
		  ReadingID,
		  MachineCode,
		  ReadingTime,
		  Count(*)
		  OVER
		  (
			partition by MachineCode
		  )AS MachineReadingCount
	from MachineReadings
)
select * from ReadingCounts
where MachineReadingCount >= 3
order by MachineCode, ReadingTime, ReadingID

