USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      STRING_AGG(MachineCode, ', ')
      within group (order by MachineCode)
      AS AllMachineCodes
from 
(
    select distinct MachineCode
    from MachineReadings
)x
