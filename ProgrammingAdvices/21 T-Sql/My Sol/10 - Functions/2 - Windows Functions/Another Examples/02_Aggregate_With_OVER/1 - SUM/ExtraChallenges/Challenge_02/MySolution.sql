/*
Challenge 02: Total sales for every region
Level: Beginner

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:


select 
	  Region,
	  SUM(Amount) AS RegionTotalSales
from SalesOrders
group by Region

