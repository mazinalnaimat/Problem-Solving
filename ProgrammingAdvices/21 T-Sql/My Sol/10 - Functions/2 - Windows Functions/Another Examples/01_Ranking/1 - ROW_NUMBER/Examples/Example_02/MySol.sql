USE WindowFunctionsTrainingDB;
GO


with NumberedOrders as
(
select SalesOrders.OrderID, SalesOrders.CustomerName,
       SalesOrders.OrderDate, SalesOrders.Amount,
         ROW_NUMBER() over
         (
             partition by CustomerName
             order by OrderDate desc
         ) as rn
from SalesOrders
)
select * from NumberedOrders
where rn =1
order by  CustomerName

