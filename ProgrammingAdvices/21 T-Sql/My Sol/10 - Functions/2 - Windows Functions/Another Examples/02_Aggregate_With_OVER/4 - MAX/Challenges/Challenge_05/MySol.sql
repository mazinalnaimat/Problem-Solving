USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      PaymentID,
      CustomerName,
      PlanName,
      Country,
      PaymentDate,
      Seats,
      MAX(Seats)
      OVER
      (
        partition by CustomerName
        order by PaymentDate, PaymentID
        rows between 
        current row and unbounded following
      )AS FutureMaxSeats
from SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID

