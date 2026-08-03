USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      PaymentID,
      CustomerName,
      PaymentDate,
      Amount,
      LEAD(Amount)
      OVER
      (
        partition by CustomerName
        order by PaymentDate, PaymentID
      )
      AS NextSubscriptionAmount
from SubscriptionPayments
order by CustomerName, PaymentDate, PaymentID

