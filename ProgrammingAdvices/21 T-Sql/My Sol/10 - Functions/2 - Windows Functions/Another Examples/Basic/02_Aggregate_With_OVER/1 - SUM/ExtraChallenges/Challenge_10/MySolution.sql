/*
Challenge 10: Apply temporary data changes and calculate cumulative daily totals
Level: Advanced+

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:


begin transaction;

	if not exists 
	(
	 select 1 from StoreTransactions
	 where ReferenceCode= 'PRACTICE-001'
	)
	BEGIN
		INSERT INTO dbo.StoreTransactions
			(ReferenceCode, Branch, Cashier, TransactionDate, ProductCategory, Amount)
		VALUES
			('PRACTICE-001', 'North', 'Aisha', '2025-01-06', 'Tables', 900.00);
	END;
	

	UPDATE dbo.StoreTransactions
	SET Amount = 575.00
	WHERE ReferenceCode = 'N-A-003';
	WITH DailyTotals AS
	(
		SELECT
			Branch,
			TransactionDate,
			SUM(Amount) AS DailyTotal
		FROM dbo.StoreTransactions
		GROUP BY
			Branch,
			TransactionDate
	)

	select 
		  Branch,
		  TransactionDate,
		  DailyTotal,
		  SUM(DailyTotal)
		  over
		  (
			partition by Branch
			order by TransactionDate
			rows between
			unbounded preceding and current row
		  )
		  AS BranchRunningTotal,
		  SUM(DailyTotal)
		  OVER
		  (
			 PARTITION BY Branch
		  ) 
		  AS BranchGrandTotal
	from DailyTotals
	order by Branch, TransactionDate

rollback transaction;

