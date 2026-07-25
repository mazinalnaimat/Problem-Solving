USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
     PaymentID,
     Country,
     PaymentDate,
     Seats,
     VARP(Seats)
     OVER
     (
        partition by Country
        order by PaymentDate DESC, PaymentID DESC
     ) AS ReverseRunningSeatPerCountryPopVar
from SubscriptionPayments
where Seats is not null
order by Country, PaymentDate, PaymentID;

