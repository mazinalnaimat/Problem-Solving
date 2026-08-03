/*
Challenge 05: Total by region and product category
Level: Intermediate

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:


select 
		OrderID,
		Region,
		ProductCategory,
		OrderDate
		Amount,
		SUM(Amount) OVER
		(
			partition by Region, ProductCategory
		)AS TotalAmountPerRegionAndProductCategory
from SalesOrders

