/*
Challenge 09: Current transaction plus the next two branch transactions
Level: Advanced

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:


Select 
	  TransactionID,
	  Branch,
	  TransactionDate,
	  Cashier,
	  Amount,
	  SUM(Amount) 
	  OVER
	  (
		partition by Branch
		Order by TransactionDate, TransactionID 
		Rows between
		Current Row AND 2 FOLLOWING 

	  )

	  AS CurrentAndNextTwoTotal

from StoreTransactions
order by Branch, TransactionDate, TransactionID



