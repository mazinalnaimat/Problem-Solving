USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      PaymentID,
      CustomerName,
      PaymentDate,
      Amount,
      FIRST_VALUE(Amount)
      OVER
      (
        partition by CustomerName
        order by PaymentDate, PaymentID
      )AS FirstAmountPerCustomer
from SubscriptionPayments
order by CustomerName, PaymentDate, PaymentID;
