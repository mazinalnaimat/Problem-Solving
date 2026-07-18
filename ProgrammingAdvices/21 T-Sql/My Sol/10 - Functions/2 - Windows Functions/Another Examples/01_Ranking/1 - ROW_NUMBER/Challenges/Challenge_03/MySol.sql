USE WindowFunctionsTrainingDB;
GO

Select
       FullName,
        PerformanceScore,
        ROW_NUMBER() over
        (          
            order by PerformanceScore desc
        ) as RowNum
from Employees
order by PerformanceScore desc


