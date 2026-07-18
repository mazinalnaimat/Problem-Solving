
/*
In this scenario, we'll use T-SQL variables to generate a monthly sales summary report for a given year and month. 
This report will include total sales, number of transactions, and average sale value. 
We'll need a Sales table that contains details of each sale.
*/

-- This script generates a monthly sales summary report.
-- It includes total sales, total number of transactions, and the average sale value for a specified month and year.

-- Declare variables
DECLARE @Year INT;
DECLARE @Month INT;
DECLARE @TotalSales DECIMAL(10, 2);
DECLARE @TotalTransactions INT;
DECLARE @AverageSale DECIMAL(10, 2);

SET @Year = 2023;
SET @Month  = 6;

SELECT @TotalSales = SUM(SaleAmount), @TotalTransactions= COUNT(*),
		@AverageSale = AVG(SaleAmount)
FROM Sales
WHERE YEAR(Sales.SaleDate) = @Year AND MONTH(Sales.SaleDate) = @Month; 


PRINT('Monthly Sales Summary Report');
PRINT('Year: ' + CAST(@Year as nvarchar) + ', Month: ' + CAST(@Month as nvarchar));
PRINT('Total Sales: ' +  CAST(@TotalSales as nvarchar));
PRINT('Total Transactions: ' +  CAST(@TotalTransactions as nvarchar));
PRINT('Average Sale Value: ' +  CAST(@AverageSale as nvarchar));


