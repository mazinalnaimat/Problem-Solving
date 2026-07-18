/*
Challenge 03: Show every order with the grand total
Level: Beginner+

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:

select 
		*,
		SUM(Amount)OVER
		()AS TotalSales
from SalesOrders

