USE WindowFunctionsTrainingDB;
GO



Select 
	CustomerName,
	OrderID,
	OrderDAte,
	Amount 
from
(
	Select 
		*,
		ROW_NUMBER() over
		(
			partition by CustomerName
			order by OrderDate desc
		)
		as rn
	
	from SalesOrders
	
) as x
where rn between  1 and 2
order by CustomerName;
