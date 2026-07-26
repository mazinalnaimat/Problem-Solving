USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select
      PaymentID,
      PlanName,
      PaymentStatus,
      CHECKSUM_AGG
      (
          case when PaymentStatus = 'Paid' then PaymentID end
      ) 
	  OVER
	  (
		partition by PlanName
	  )AS PaidPaymentIDCheckSum
from SubscriptionPayments
order by PlanName, PaymentDate, PaymentID
