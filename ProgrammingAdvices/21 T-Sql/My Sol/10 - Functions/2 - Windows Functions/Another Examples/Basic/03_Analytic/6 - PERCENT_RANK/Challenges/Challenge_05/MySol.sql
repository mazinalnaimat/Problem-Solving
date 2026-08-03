USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      PaymentID,
      PlanName,
      Country,
      Amount,
	  PERCENT_RANK()
	  OVER
	  (
		partition by PlanName 
		order by Amount
	  )AS AmountPerPlanPercentRank
from SubscriptionPayments
where Amount is not null
order by  PlanName, Amount


