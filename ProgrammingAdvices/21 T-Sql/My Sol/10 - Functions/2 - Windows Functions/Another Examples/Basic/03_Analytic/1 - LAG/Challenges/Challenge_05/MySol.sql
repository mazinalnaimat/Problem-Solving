USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      PaymentID,
      CustomerName,
      PaymentDate,
      Amount,
	  LAG(Amount)
	  OVER
	  (
		partition by CustomerName
		order by PaymentDate, PaymentID
	  )AS PreviousAmount
from SubscriptionPayments
order by  CustomerName, PaymentDate, PaymentID;


