USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
     PaymentID,
     CustomerName,
     PlanName,
     PaymentDate,
     PaymentStatus,
	 COUNT
	 (
		 CASE
				when PaymentStatus = 'Paid' then 1
		END
	 )
	 OVER
	 (
		partition by CustomerName
		order by PaymentDate, PaymentID
		rows between 
		current row and unbounded following
	 )AS RemainingPaidPaymentCountPerCustomer
from SubscriptionPayments
ORDER BY CustomerName, PaymentDate, PaymentID;


