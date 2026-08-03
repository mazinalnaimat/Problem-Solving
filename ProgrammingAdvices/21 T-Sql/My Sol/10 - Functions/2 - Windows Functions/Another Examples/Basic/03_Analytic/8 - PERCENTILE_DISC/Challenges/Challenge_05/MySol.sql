USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      PaymentID,
      PlanName,
      Country,
      Amount,
      PERCENTILE_DISC(0.8)
      within group (order by Amount)
      over
      (
        partition by PlanName, Country
      )as DiscreteP80Amount
from SubscriptionPayments
where Amount is not null
order by PlanName, Country, Amount;


