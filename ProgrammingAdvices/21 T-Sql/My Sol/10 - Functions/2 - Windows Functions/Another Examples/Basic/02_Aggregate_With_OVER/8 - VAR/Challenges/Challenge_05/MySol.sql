USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      PaymentID,
      PlanName,
      PaymentDate,
      Amount,
      VAR(Amount)
      OVER
      (
        partition by PlanName
        order by PaymentDate DESC, PaymentID DESC
      )AS ReverseRunningOrderAmountPerPlanSamVar
from SubscriptionPayments
where Amount is not null 
order by PlanName, PaymentDate, PaymentID;
