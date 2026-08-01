USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
     ReadingID,
     ProductionLine,
     MachineCode,
     DefectCount,
	 CUME_DIST()
	 OVER
	 (
		partition by ProductionLine
		order by DefectCount
	 )AS DefectCountPerProdLineCumeDist

from MachineReadings
where DefectCount is not null
order by ProductionLine, DefectCount;

