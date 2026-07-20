USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      PaymentID,
      PlanName,
      PaymentDate,
      Amount,
      STDEV(Amount)
      OVER
      (
        partition by PlanName
        order by PaymentDate DESC, PaymentID DESC
      ) AS ReverseRunningAmountSampleDevPerPlan
from SubscriptionPayments
WHERE Amount IS NOT NULL
ORDER BY PlanName, PaymentDate, PaymentID;


