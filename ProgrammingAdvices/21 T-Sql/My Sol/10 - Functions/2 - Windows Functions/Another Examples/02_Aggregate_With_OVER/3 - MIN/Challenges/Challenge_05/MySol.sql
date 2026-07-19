USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
	  PaymentID,
	  CustomerName,
	  PlanName,
	  Country,
	  PaymentDate,
	  Amount,
	  MIN(Amount)
	  OVER
	  (
		partition by CustomerName
		order by PaymentDate, PaymentID
		rows between
		current row and unbounded following
	  )AS FutureMinPayment
from SubscriptionPayments
order by CustomerName, PaymentDate, PaymentID
