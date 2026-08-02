USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select 
      ReadingID,
      ProductionLine,
      MachineCode,
      DefectCount,
	  PERCENT_RANK()
	  OVER
	  (
		partition by ProductionLIne
		order by DefectCount
	  )AS DefectCoutPerProdLinePercentRank
from MachineReadings
where DefectCount is not null
order by ProductionLine, DefectCount;


