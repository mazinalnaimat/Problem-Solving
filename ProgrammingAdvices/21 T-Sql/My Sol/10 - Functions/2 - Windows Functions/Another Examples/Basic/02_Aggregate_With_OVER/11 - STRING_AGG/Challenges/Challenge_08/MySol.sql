USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

with DistinctBuildingTypes as 
(
	
	select distinct  BuildingName, MeterType
	from UtilityReadings

)

select 
      BuildingName,
	  COUNT(*) AS MeterTypeCount,
	  STRING_AGG(MeterType, ', ')
	  AS MeterTypes
from DistinctBuildingTypes
group by BuildingName
having count(*) >= 2
order by BuildingName