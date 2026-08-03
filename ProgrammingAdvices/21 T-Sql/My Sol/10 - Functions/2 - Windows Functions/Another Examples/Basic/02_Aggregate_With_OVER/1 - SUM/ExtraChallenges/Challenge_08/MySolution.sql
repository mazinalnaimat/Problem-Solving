/*
Challenge 08: Moving total of the latest three cashier transactions
Level: Advanced

Write your solution below.
*/

USE WindowFunctionsTrainingDB;
GO


-- Write your query here:

select 
	  TransactionID,
	  Branch,
	  Cashier,
	  TransactionDate,
	  Amount,
	  SUM(Amount) OVER
	  (
	    PARTITION BY Branch, Cashier
		order by TransactionDate, TransactionID
		Rows between
		 2 preceding  and current row
	  )
	  AS LastThreeTransactionsTotal

from StoreTransactions
order by Branch, Cashier, TransactionDate, TransactionID

