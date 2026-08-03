USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select 
      PaymentID,
      PlanName,
      Country,
      Amount,
      CUME_DIST()
      OVER
      (
        partition by PlanName
        order by Amount
      )AS AmountPerPlanCumeDist
from SubscriptionPayments
where Amount is not null
order by PlanName, Amount;


