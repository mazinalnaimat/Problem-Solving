USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      PaymentID,
      CustomerName,
      PaymentDate,
      Amount,
	  LAST_VALUE(Amount)
	  OVER
	  (
		partition by CustomerName
		order by PaymentDate, PaymentID
		rows between
		unbounded preceding and unbounded following
	  )
	  AS LastAmountPerCustomer
from SubscriptionPayments
order by CustomerName, PaymentDate, PaymentID;

