USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      ReadingID,
      ReadingTime,
      VibrationMmS,
	  STDEVP(VibrationMmS)
	  OVER
	  (
		order by ReadingTime, ReadingID
		rows between 
		unbounded preceding and current row
	  ) AS OverallRunningVibratoinPopStdDev
from MachineReadings
where VibrationMmS is not null
order by ReadingTime, ReadingID

