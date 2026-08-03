USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      PaymentID,
      Country,
      PaymentDate,
      Seats,
      STDEVP(Seats)
      OVER
      (
        partition by Country
        order by PaymentDate DESC, PaymentID DESC

      ) RunningSeatsPerCountryPopStdDev
from SubscriptionPayments
where Seats IS NOT NULL
order by Country, PaymentDate, PaymentID;

