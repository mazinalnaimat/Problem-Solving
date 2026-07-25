USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
     ReadingID,
     ReadingTime,
     DefectCount,
	 VARP(DefectCount)
	 OVER
	 (
		order by ReadingTime, ReadingID
		rows between 
		unbounded preceding and current row
	 ) AS OverallRunningDefectPopVar
from MachineReadings
where DefectCount is not null
order by ReadingTime, ReadingID;

