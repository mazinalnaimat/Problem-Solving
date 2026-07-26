USE WindowFunctionsTrainingDB;
GO

select
      Region,
      OrderID,
      CustomerName,
      Amount,
	  CHECKSUM_AGG(OrderID)
	  OVER
	  (
	  	partition by Region
	  )AS OrderCheckSumInRegion
from SalesOrders
order by Region, OrderID;


