USE WindowFunctionsTrainingDB;
GO


WITH ClassAvgScore AS
(
    select 
          ClassName,
           AVG(CAST(Score AS DECIMAL(10,2))) AS AvgScore    
    from StudentScores
    group by ClassName
)

Select 
        ClassName,
        AvgScore,
        RANK() OVER
        (
            Order By AvgScore desc
        )
        AS ClassRankPerAvgScore
from ClassAvgScore







